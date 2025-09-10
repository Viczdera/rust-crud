# 🦀 Rust CRUD API

A lightweight, high-performance REST API built with Rust that performs CRUD operations on a PostgreSQL database. Built this to demonstrate raw HTTP handling without external web frameworks, showcasing Rust's capabilities for building efficient backend services.

## ✨ Features

- **Pure Rust Implementation**: Built without external web frameworks, using only standard library and minimal dependencies
- **RESTful API**: Complete CRUD operations for user management
- **PostgreSQL Integration**: Robust database operations with connection handling
- **JSON Support**: Serialization/deserialization with Serde
- **Docker Ready**: Complete containerization with Docker Compose
- **Error Handling**: Comprehensive error responses and status codes
- **Auto Table Creation**: Database schema initialization on startup

## 🚀 Quick Start

### Using Docker Compose (Recommended)

1. **Clone the repository**:
   ```bash
   git clone <your-repository-url>
   cd rust-crud
   ```

2. **Start the application**:
   ```bash
   docker-compose up --build
   ```

3. **Access the API**:
   ```
   http://localhost:8082
   ```

### Manual Setup

#### Prerequisites
- Rust (latest stable version)
- PostgreSQL 12+
- Cargo

#### Environment Setup

1. **Set environment variable**:
   ```bash
   export DB_URL="postgres://username:password@localhost:5432/dbname"
   ```

2. **Install dependencies and run**:
   ```bash
   cargo build --release
   cargo run
   ```

## 🗄️ Database Schema

The application automatically creates the following table on startup:

```sql
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);
```

## 📚 API Documentation

### Base URL
```
http://localhost:8082
```

### Endpoints

| Method | Endpoint | Description | Request Body |
|--------|----------|-------------|--------------|
| `GET` | `/users` | Retrieve all users | None |
| `GET` | `/user/{id}` | Retrieve a specific user | None |
| `POST` | `/users` | Create a new user | User JSON |
| `PUT` | `/users/{id}` | Update an existing user | User JSON |
| `DELETE` | `/users/{id}` | Delete a user | None |

### Request/Response Examples

#### Create User
```bash
curl -X POST http://localhost:8082/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com"
  }'
```

**Response**: `200 OK`
```
User created
```

#### Get All Users
```bash
curl http://localhost:8082/users
```

**Response**: `200 OK`
```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
  }
]
```

#### Get User by ID
```bash
curl http://localhost:8082/user/1
```

**Response**: `200 OK`
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john.doe@example.com"
}
```

#### Update User
```bash
curl -X PUT http://localhost:8082/users/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Doe",
    "email": "jane.doe@example.com"
  }'
```

**Response**: `200 OK`
```
User updated
```

#### Delete User
```bash
curl -X DELETE http://localhost:8082/users/1
```

**Response**: `200 OK`
```
User deleted successfully
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `DB_URL` | PostgreSQL connection string | None | Yes |

### Docker Configuration

The project includes:
- **Dockerfile**: Multi-stage build for optimized production image
- **docker-compose.yml**: Complete stack with PostgreSQL database
- **Automatic networking**: App and database communication

## 🏗️ Project Structure

```
rust-crud/
├── src/
│   └── main.rs          # Main application code
├── Cargo.toml           # Dependencies and metadata
├── Dockerfile           # Container build instructions
├── docker-compose.yml   # Multi-service orchestration
└── README.md           # Project documentation
```

## 🛠️ Technologies Used

- **[Rust](https://www.rust-lang.org/)** - Systems programming language
- **[postgres](https://crates.io/crates/postgres)** - PostgreSQL driver
- **[serde](https://crates.io/crates/serde)** - Serialization framework
- **[serde_json](https://crates.io/crates/serde_json)** - JSON support
- **[lazy_static](https://crates.io/crates/lazy_static)** - Static variable initialization
- **PostgreSQL** - Database
- **Docker** - Containerization


## 🚧 Development

### Building
```bash
cargo build
```

### Running in Development
```bash
cargo run
```

### Building for Production
```bash
cargo build --release
```

## 🐳 Docker Commands

### Build Image
```bash
docker build -t rust-crud .
```

### Run with Docker Compose
```bash
docker-compose up -d
```

### View Logs
```bash
docker-compose logs -f rustapp
```

### Stop Services
```bash
docker-compose down
```