# altschool-s02-e01 - Blog API
AltSchool Second Semester Exam (Practical)

A RESTful API for a blogging platform with user authentication and blog post management, built with Node.js, Express, MongoDB, and JWT authentication.

## Features

- User authentication (signup/signin)
- Create, read, update, publish and delete blog posts
- Filter blogs by author, title, or tags
- Automatic reading time calculation
- Read count tracking
- Protected routes with JWT authentication

## Prerequisites

Before running this project, make sure you have the following installed:

- [Node.js](https://nodejs.org/) (v14 or higher)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [MongoDB](https://www.mongodb.com/) account or local MongoDB installation
- [Git](https://git-scm.com/)

## Getting Started

Follow these steps to run the project on your local machine:

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

Option 1: Create a `.env` file in the root directory and add the necessary variables. In your terminal:

```bash
touch .env
```
then open `.env` and edit:

```env
PORT=3000
MONGODB_URI=mongodb+srv://blah.mongodb.net
JWT_SECRET=put_anything_here
JWT_EXPIRY=1h
```

Option 2: Just copy `.env.example` to `.env` and update the values. In your terminal:

```bash
cp .env.example .env
```
then open `.env` and change the placeholders.

Your `.env` should contain
- `MONGODB_URI`: Your MongoDB connection string (e.g., from MongoDB Atlas)
- `JWT_SECRET`: A random string that will be used for JWT generation
- `JWT_EXPIRY`: When you want the JWT to expire (e.g., 1h, 24h, 7d)

### 4. Run Tests (Optional)

In your terminal:

```bash
npm test
```

### 5. Start the Development Server

```bash
npm run dev
```

The server will start on `http://localhost:3000` (or the PORT you specified in `.env`)

You should see in the terminal:
```
connected to db
server is running on port 3000
```

## API Endpoints

Base URL (local): `http://localhost:3000/api`

[Postman docs](https://documenter.getpostman.com/view/38823654/2sBXcBmguN)

The API is deployed on Heroku and can be accessed at:

```
http://altsch-s02-e01-dfa405ab572e.herokuapp.com/api/
```

All the endpoints work the same way, just replace `http://localhost:3000` with the Heroku URL.

### Testing with Postman or Thunder Client

1. Create a new request
2. Set the method (GET, POST, PUT, PATCH, DELETE)
3. Enter the URL (e.g., `https://your-app-name.herokuapp.com/api/auth/signup`)
4. For protected routes, add an Authorization header:
   - Key: `Authorization`
   - Value: `<your_token>`
5. For POST/PUT requests, set the body to raw JSON and add your data

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

## Stack Used

- **Node.js** (**Express.js**) - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication
- **bcryptjs** - Password hashing
- **Joi** - Request validation
- **dotenv** - Environment variable management

## Author

Thank you for readimg this far! Connect with me on:

- GitHub - [Angel Umeh](https://github.com/akcumeh)
- Twitter - [@akcumeh](https://x.com/akcumeh)
