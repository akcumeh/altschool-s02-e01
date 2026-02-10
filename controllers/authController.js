const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { signupSchema, signinSchema } = require('../utils/validator');

exports.signup = async (req, res) => {
    try {
        const { e, value } = signupSchema.validate(req.body);
        if (e) {
            return res.status(400).json({ error: e.details[0].message });
        }

        const { email, first_name, last_name, password } = value;

        const hashedPwd = await bcrypt.hash(password, 10);

        const user = new User({
            email,
            first_name,
            last_name,
            password: hashedPwd
        });

        try {} catch (e) {
            if (e.code === 11000) {
                return res.status(400).json({ error: "This email is already in use." })
            }
            throw e;
        }

        res.status(201).json({ message: "Successfully created user." });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

exports.signin = async (req, res) => {
    try {
        const { e, value } = signupSchema.validate(req.body);
        if (e) {
            return res.status(400).json({ error: e.details[0].message });
        }

        const { email, password } = value;

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