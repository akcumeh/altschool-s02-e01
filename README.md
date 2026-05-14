# altschool-s02-e01 - Blog API
AltSchool Second Semester Exam (Practical)

A RESTful API for a blogging platform with user authentication and blog post management, built with Node.js, Express, MongoDB, and JWT authentication.

## Features

- User authentication (signup/signin)
- Create, read, update, publish, and delete blog posts
- Filter blogs by author, title, or tags
- Automatic reading time calculation
- Read count tracking
- Protected routes with JWT authentication

## Prerequisites

Before running this project, make sure you have the following:

- [Node.js](https://nodejs.org/) (v14 or higher)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [Git](https://git-scm.com/)
- A [MongoDB](https://www.mongodb.com/) account or local MongoDB installation

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/akcumeh/altschool-s02-e01.git
cd altschool-s02-e01
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Environment Variables

Copy `.env.example` to `.env` and fill in the values:

```bash
cp .env.example .env
```

Your `.env` should contain:
- `MONGODB_URI`: Your MongoDB connection string (e.g., from MongoDB Atlas)
- `JWT_SECRET`: A random string used for JWT generation
- `JWT_EXPIRY`: When you want the JWT to expire (e.g., `1h`, `24h`, `7d`)
- `PORT`: Port to run on (default: `3000`)

### 4. Run Tests (Optional)

```bash
npm test
```

### 5. Start the Development Server

```bash
npm run dev
```

The server will start on `http://localhost:3000`.

## API Endpoints

Base URL (local): `http://localhost:3000/api`

The API is also deployed and accessible at:
```
http://altsch-s02-e01-dfa405ab572e.herokuapp.com/api/
```

### Auth
- `POST /auth/signup` - Register a new user
- `POST /auth/login` - Sign in and receive a JWT

### Blogs
- `GET /blogs` - Get all published blog posts (supports filtering by `author`, `title`, `tags`)
- `POST /blogs` - Create a new blog post *(auth required)*
- `GET /blogs/:id` - Get a single blog post
- `PUT /blogs/:id` - Update a blog post *(auth required)*
- `PATCH /blogs/:id/publish` - Publish a blog post *(auth required)*
- `DELETE /blogs/:id` - Delete a blog post *(auth required)*
- `GET /my-blogs` - Get all posts by the logged-in user *(auth required)*

### Testing with Postman or Thunder Client

For protected routes, add an `Authorization` header with the token received from login as the value.

See the full **[Postman docs](https://documenter.getpostman.com/view/38823654/2sBXcBmguN)**.

## Project Structure

```
altschool-s02-e01/
├── config/
│   └── db.js              # Database configuration
├── controllers/
│   ├── authController.js  # Authentication logic
│   └── blogController.js  # Blog CRUD logic
├── middleware/
│   └── auth.js            # JWT auth middleware
├── models/
│   ├── User.js            # User db model
│   └── Post.js            # Blog post db model
├── routes/
│   ├── authRoutes.js      # Auth routes
│   └── blogRoutes.js      # Blog routes
├── utils/
│   ├── validator.js       # Request validation schemas
│   └── readingTimeCalculator.js  # Reading time calculator
├── .env.example           # Example environment variables
├── server.js              # Application entry point
├── Procfile               # Heroku deployment config
└── package.json
```

## Database Schema

### User
- `username` (string, required)
- `email` (string, required, unique)
- `password` (string, required, hashed)
- `createdAt` (date, auto-generated)

### Post
- `title` (string, required, unique)
- `description` (string)
- `body` (string, required)
- `author` (ref: User, required)
- `state` (enum: `draft` | `published`, default: `draft`)
- `tags` (array of strings)
- `readingTime` (number, auto-calculated)
- `readCount` (number, default: `0`)
- `createdAt` / `updatedAt` (dates, auto-generated)

## Stack Used

- **Node.js** (**Express.js**) - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication
- **bcryptjs** - Password hashing
- **Joi** - Request validation
- **dotenv** - Environment variable management

## Author

Thank you for reading this far! Connect with me on:

- GitHub - [Angel Umeh](https://github.com/akcumeh)
- Twitter - [@akcumeh](https://x.com/akcumeh)
