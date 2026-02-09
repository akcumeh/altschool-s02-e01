const express = require('express');
const router = express.Router();
const blogController = require('../controllers/blogController');
const auth = require('../middleware/auth');

router.get('/blogs', blogController.getPublishedBlogs);
router.get('/blogs/:id', blogController.getBlogById);

router.post('/blogs', auth, blogController.createPost);
router.get('/user/blogs', auth, blogController.getUserBlogs);
router.patch('/blogs/:id/state', auth, blogController.updateBlogState);
router.put('/blogs/:id', auth, blogController.updateBlog);
router.delete('/blogs/:id', auth, blogController.deleteBlog);

module.exports = router;