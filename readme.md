# Rust CRUD API

A simple REST API built with Rust that performs CRUD operations using PostgreSQL database.

## Features

- RESTful endpoints for Users
- PostgreSQL database integration
- JSON request/response handling
- Basic error handling

## Prerequisites

- Rust (latest stable version)
- PostgreSQL
- cargo

## Environment Variables

Create a `.env` file in the root directory and add:

```env
DATABASE_URL=postgres://username:password@localhost/dbname
PORT=8080
```

## Database Schema

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/users` | Get all users |
| GET | `/users/:id` | Get a single user |
| POST | `/users` | Create a new user |
| PUT | `/users/:id` | Update a user |
| DELETE | `/users/:id` | Delete a user |

## Running the Application

1. Clone the repository:
```bash
git clone <repository-url>
cd rust-crud
```

2. Install dependencies:
```bash
cargo build
```

3. Run the server:
```bash
cargo run
```

The server will start on `http://localhost:8080`

## Request/Response Examples

### Create User
```bash
POST /users
Content-Type: application/json

{
    "name": "John Doe",
    "email": "john@example.com"
}
```

### Get User
```bash
GET /users/1
```

## Error Handling

The API returns the following error codes:

- `200 OK` - Success
- `404 Not Found` - Resource not found
- `500 Internal Server Error` - Server error

## Dependencies

- `postgres` - PostgreSQL driver
- `serde` - Serialization/Deserialization
-