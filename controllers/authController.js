const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

exports.signup = async (req, res) => {
    try {
        const { email, first_name, last_name, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ error: "This email is already in use." });
        }

        const hashedPwd = await bcrypt.hash(password, 10);

        const user = new User({
            email,
            first_name,
            last_name,
            password: hashedPwd
        });

        await user.save();

        res.status(201).json({ message: "Successfully created user." });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.signin = async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) {
            return res.status(401).json({ error: "Invalid credentials." });
        }

        const isPwd = await bcrypt.compare(password, user.password);
        if (!isPwd) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const token = jwt.sign(
            { userId: user._id },
            process.env.JWT_SECRET,
            { expiresIn: process.env.JWT_EXPIRY }
        );

        res.json({ token });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};