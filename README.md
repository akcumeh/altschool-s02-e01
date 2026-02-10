# altschool-s02-e01 - Blog API
AltSchool Second Semester Exam (Practical)

A RESTful API for a blogging platform with user authentication and blog post management, built with Node.js, Express, MongoDB, and JWT authentication.

## Features

- User authentication (signup/signin)
- Create, read, update, and delete blog posts
- Publish/unpublish blog posts
- Filter blogs by published status, author, title, and tags
- Automatic reading time calculation
- Read count tracking
- Protected routes with JWT authentication

## Prerequisites

Before running this project, make sure you have the following installed:

- [Node.js](https://nodejs.org/) (v14 or higher)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [MongoDB](https://www.mongodb.com/) account or local MongoDB installation
- [Git](https://git-scm.com/)

## Getting Started (Local Setup)

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

### Authentication Endpoints

#### 1. Sign Up (Create New User)

```
POST /api/auth/signup
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securePassword123",
  "first_name": "John",
  "last_name": "Doe"
}
```

**Success Response (201):**
```json
{
  "message": "Successfully created user."
}
```

**Error Responses:**
```json
{
  "error": "This email is already in use."
}
```

#### 2. Sign In (Login)

```
POST /api/auth/signin
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securePassword123"
}
```

**Success Response (200):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error Responses:**
```json
{
  "error": "Invalid credentials."
}
```

### Blog Endpoints

#### 3. Get All Published Blogs (Public)

```
GET /api/blogs
```

**Query Parameters (optional):**
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20)
- `author`: Filter by author name (first_name or last_name)
- `title`: Filter by title (case-insensitive search)
- `tags`: Filter by tags (comma-separated, e.g., "tech,coding")
- `orderBy`: Sort field - `timestamp`, `read_count`, or `reading_time` (default: timestamp)
- `order`: Sort order - `asc` or `desc` (default: desc)

**Example Request:**
```
GET /api/blogs?page=1&limit=10&author=John&orderBy=read_count&order=desc
```

**Response (200):**
```json
{
  "posts": [
    {
      "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
      "title": "My First Blog Post",
      "description": "A brief description",
      "body": "This is the content...",
      "author": {
        "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com"
      },
      "state": "published",
      "read_count": 5,
      "reading_time": 3,
      "tags": ["technology", "coding"],
      "createdAt": "2024-01-01T00:00:00.000Z",
      "updatedAt": "2024-01-01T00:00:00.000Z"
    }
  ],
  "totalPages": 5,
  "currentPage": 1
}
```

#### 4. Get Single Blog by ID (Public)

```
GET /api/blogs/:id
```

**Response (200):**
```json
{
  "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
  "title": "My First Blog Post",
  "description": "A brief description",
  "body": "This is the content...",
  "author": {
    "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
    "first_name": "John",
    "last_name": "Doe",
    "email": "john@example.com"
  },
  "state": "published",
  "read_count": 6,
  "reading_time": 3,
  "tags": ["technology"],
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T00:00:00.000Z"
}
```

**Error Response (404):**
```json
{
  "error": "This post could not be found."
}
```

Note that each time this endpoint is called, the `read_count` is incremented by 1.

#### 5. Create New Blog Post (Protected)

```
POST /api/blogs
```

**Headers:**
```
Authorization: Bearer <your_jwt_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "title": "My New Blog Post",
  "description": "A short description of the post",
  "body": "This is my blog content...",
  "tags": ["technology", "coding"]
}
```

Note that `description` and `tags` are optional. The post is created in `draft` state by default.

**Success Response (201):**
```json
{
  "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
  "title": "My New Blog Post",
  "description": "A short description of the post",
  "body": "This is my blog content...",
  "author": "60f7b3b3b3b3b3b3b3b3b3b3",
  "state": "draft",
  "read_count": 0,
  "reading_time": 2,
  "tags": ["technology", "coding"],
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T00:00:00.000Z"
}
```

#### 6. Get User's Blogs (Protected)

```
GET /api/user/blogs
```

**Headers:**
```
Authorization: Bearer <your_jwt_token>
```

**Query Parameters (optional):**
- `state`: Filter by state (`draft` or `published`)
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20)

**Example Request:**
```
GET /api/user/blogs?state=draft&page=1&limit=10
```

**Response (200):**
```json
{
  "posts": [
    {
      "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
      "title": "My Draft Post",
      "description": "Draft description",
      "body": "Content...",
      "author": "60f7b3b3b3b3b3b3b3b3b3b3",
      "state": "draft",
      "read_count": 0,
      "reading_time": 2,
      "tags": ["draft"],
      "createdAt": "2024-01-01T00:00:00.000Z",
      "updatedAt": "2024-01-01T00:00:00.000Z"
    }
  ],
  "totalPages": 5,
  "currentPage": 1
}
```

#### 7. Publish a Blog (Protected)

```
PATCH /api/blogs/:id/publish
```

**Headers:**
```
Authorization: Bearer <your_jwt_token>
```

**Success Response (200):**
```json
{
  "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
  "title": "My Blog Post",
  "description": "Description",
  "body": "Content...",
  "author": "60f7b3b3b3b3b3b3b3b3b3b3",
  "state": "published",
  "read_count": 0,
  "reading_time": 2,
  "tags": ["published"],
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T00:00:00.000Z"
}
```

**Error Responses:**
```json
{
  "error": "This post could not be found."
}
```
```json
{
  "error": "This post is already published."
}
```

#### 8. Update a Blog (Protected)

```
PUT /api/blogs/:id
```

**Headers:**
```
Authorization: Bearer <your_jwt_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "title": "Updated Title",
  "body": "Updated content...",
  "description": "Updated description",
  "tags": ["updated"]
}
```

**Note:** You can update any combination of fields. If you update the `body`, the `reading_time` is automatically recalculated.

**Success Response (200):**
```json
{
  "_id": "60f7b3b3b3b3b3b3b3b3b3b3",
  "title": "Updated Title",
  "description": "Updated description",
  "body": "Updated content...",
  "author": "60f7b3b3b3b3b3b3b3b3b3b3",
  "state": "draft",
  "read_count": 0,
  "reading_time": 2,
  "tags": ["updated"],
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T12:00:00.000Z"
}
```

**Error Response (404):**
```json
{
  "error": "This post could not be found."
}
```

#### 9. Delete a Blog (Protected)

```
DELETE /api/blogs/:id
```

**Headers:**
```
Authorization: Bearer <your_jwt_token>
```

**Success Response (200):**
```json
{
  "message": "You've successfully deleted this blog."
}
```

**Error Response (404):**
```json
{
  "error": "This post could not be found."
}
```

## Using the Deployed Version

The API is deployed on Heroku and can be accessed at:

```
http://altsch-s02-e01-dfa405ab572e.herokuapp.com/api/
```

All the endpoints work the same way as described above, just replace `http://localhost:3000` with the Heroku URL.

### Testing with cURL

**Sign Up:**
```bash
curl -X POST https://your-app-name.herokuapp.com/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test123","first_name":"Test","last_name":"User"}'
```

**Sign In:**
```bash
curl -X POST https://your-app-name.herokuapp.com/api/auth/signin \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test123"}'
```

**Get Published Blogs:**
```bash
curl https://your-app-name.herokuapp.com/api/blogs
```

**Create Blog (requires authentication):**
```bash
curl -X POST https://your-app-name.herokuapp.com/api/blogs \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{"title":"Test Blog","description":"Test description","body":"This is a test blog post","tags":["test"]}'
```

**Get User's Blogs:**
```bash
curl https://your-app-name.herokuapp.com/api/user/blogs \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

**Publish a Blog:**
```bash
curl -X PATCH https://your-app-name.herokuapp.com/api/blogs/BLOG_ID_HERE/publish \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

**Update a Blog:**
```bash
curl -X PUT https://your-app-name.herokuapp.com/api/blogs/BLOG_ID_HERE \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{"title":"Updated Title","body":"Updated content"}'
```

**Delete a Blog:**
```bash
curl -X DELETE https://your-app-name.herokuapp.com/api/blogs/BLOG_ID_HERE \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### Testing with Postman or Thunder Client

1. Create a new request
2. Set the method (GET, POST, PUT, PATCH, DELETE)
3. Enter the URL (e.g., `https://your-app-name.herokuapp.com/api/auth/signup`)
4. For protected routes, add an Authorization header:
   - Key: `Authorization`
   - Value: `Bearer <your_token>`
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

- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication
- **bcryptjs** - Password hashing
- **Joi** - Request validation
- **dotenv** - Environment variable management

## Scripts

- `npm start` - Start the production server
- `npm run dev` - Start the development server with nodemon (auto-restart on file changes)
- `npm test` - Run tests

## Important Notes

- All blog posts are created in `draft` state by default
- Blog posts can be edited in both draft and published states
- The `reading_time` is automatically calculated based on the blog content
- The `read_count` increments each time a blog is viewed via the GET `/api/blogs/:id` endpoint
- You can only update or delete your own blog posts
- Blogs are paginated, with 20 displayed per page

## Author

Thank you for readimg this far! Connect with me on:

- GitHub - [Angel Umeh](https://github.com/akcumeh)
- Twitter - [@akcumeh](https://x.com/akcumeh)
