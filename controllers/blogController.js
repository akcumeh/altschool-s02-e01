const Post = require('../models/Post');
const calcReadingTime = require('../utils/readingTimeCalculator');
const { blogSchema, updateBlogSchema } = require('../utils/validator');

exports.createPost = async (req, res) => {
    try {
        const { e, value } = blogSchema.validate(req.body);
        if (e) {
            return res.status(400).json({ error: e.details[0].message });
        }

        const { title, description, tags, body } = value;

        const reading_time = calcReadingTime(body);

        const blog = new Post({
            title,
            description,
            tags,
            body,
            author: req.userId,
            reading_time
        });

        await blog.save();
        res.status(201).json(blog);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.updateBlog = async (req, res) => {
    try {
        const { e, value } = updateBlogSchema.validate(req.body);
        if (e) {
            return res.status(400).json({ error: e.details[0].message });
        }

        const { id } = req.params;
        const updates = value;

        const post = await Post.findOne({ _id: id, author: req.userId });

        if (!post) {
            return res.status(404).json({ error: 'This post could not be found.' });
        }
        

        if (updates.body) {
            updates.reading_time = calcReadingTime(updates.body);
        }

        Object.assign(post, updates);
        await post.save();
        
        res.json(post);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.publishBlog = async (req, res) => {
    try {
        const { id } = req.params;

        const post = await Post.findOne({ _id: id, author: req.userId });

        if (!post) {
            return res.status(404).json({ error: 'This post could not be found.' });
        }

        if (post.state === 'published') {
            return res.status(400).json({ error: 'This post is already published.' });
        }

        post.state = 'published';
        await post.save();

        res.json(post);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.deleteBlog = async (req, res) => {
    try {
        const { id } = req.params;

        const post = await Post.findOneAndDelete({ _id: id, author: req.userId });
        
        if (!post) {
            return res.status(404).json({ error: 'This post could not be found.' });
        }

        res.json({ message: 'You\'ve successfully deleted this blog.' });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.getUserBlogs = async (req, res) => {
    try {
        const {
            state,
            page = 1,
            limit = 20
        } = req.query;
        const filter = { author: req.userId };

        if (state) {
            filter.state = state;
        }

        const posts = await Post.find(filter)
            .sort({ createdAt: -1 })
            .limit(limit * 1)
            .skip((page - 1) * limit);

        const count = await Post.countDocuments(filter);

        res.json({
            posts,
            totalPages: Math.ceil(count / limit),
            currentPage: page
        });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.getPublishedBlogs = async (req, res) => {
    try {
        const {
            page = 1,
            limit = 20,
            author,
            title,
            tags,
            orderBy = 'timestamp',
            order = 'desc'
        } = req.query;

        const filter = { state: 'published' };

        if (author) {
            const User = require('../models/User');
            const authorUser = await User.findOne({
                $or: [
                    { first_name: new RegExp(author, 'i') },
                    { last_name: new RegExp(author, 'i') }
                ]
            });

            if (authorUser) filter.author = authorUser._id;
        }

        if (title) {
            filter.title = new RegExp(title, 'i');
        }

        if (tags) {
            filter.tags = { $in: tags.split(',') };
        }

        const sortField = orderBy === 'read_count' ? 'read_count' : orderBy === 'reading_time' ? 'reading_time' : 'createdAt';
        const sortingOrder = order === 'asc' ? 1 : -1;

        const posts = await Post.find(filter)
            .populate('author', 'first_name last_name email')
            .sort({ [sortField]: sortingOrder })
            .limit(limit * 1)
            .skip((page - 1) * limit);

        const count = await Post.countDocuments(filter);

        res.json({
            posts,
            totalPages: Math.ceil(count / limit),
            currentPage: page
        });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.getBlogById = async (req, res) => {
    try {
        const { id } = req.params;

        const post = await Post.findOne({ _id: id, state: 'published' })
            .populate('author', 'first_name last_name email');
        
        if (!post) {
            return res.status(404).json({ error: 'This post could not be found.' });
        }

        post.read_count += 1;
        await post.save();

        res.json(post);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};