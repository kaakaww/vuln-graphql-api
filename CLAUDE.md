# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **vulnerable GraphQL API** designed for security testing and demonstration purposes. It's a fork of the original vulnerable-graphql-api that has been simplified for Docker deployment. The application intentionally contains security vulnerabilities for educational and testing purposes.

⚠️ **Security Notice**: This is intentionally vulnerable software for testing purposes only. Do not deploy in production environments.

## Development Commands

### Docker Development (Primary Method)
```bash
# Build and run the application
docker-compose up

# Build only
docker-compose build

# Run in background
docker-compose up -d
```

The application runs on port 3000 by default. Set `SERVER_PORT` environment variable to change the port.

### TypeScript Compilation
```bash
cd app
npm run tsc
```

### Database Operations
```bash
cd app
npm run sequelize db:migrate
npm run sequelize db:seed:all
```

## Architecture Overview

### Application Structure
- **app/app.ts**: Main Express server with GraphQL endpoint
- **app/lib/gql/**: GraphQL schema, types, queries, and mutations
- **app/models/**: Sequelize database models (User, Post)
- **app/migrations/**: Database migration files
- **app/seeders/**: Database seed data
- **docker-compose.yml**: Container orchestration for the vulnerable app

### GraphQL Schema
The GraphQL API is built with express-graphql and includes:
- **Queries**: User lookups, post searches, asset retrieval
- **Mutations**: User registration/login, post creation, secret operations
- **Types**: User, Post, and custom scalar types

### Database
- SQLite database with Sequelize ORM
- Models: User and Post with associations
- Seeded with test data for demonstration

### Security Context
This application contains intentional vulnerabilities including:
- Weak session management
- Potentially unsafe GraphQL operations
- Insecure asset handling
- Authentication bypasses

## Key Files
- `app/app.ts`: Express server setup and GraphQL configuration
- `app/lib/gql/schema.ts`: GraphQL schema definition
- `app/models/index.ts`: Database connection and model loading
- `stackhawk.d/`: StackHawk security scanning configurations

## Testing with StackHawk
Sample configurations are provided in `stackhawk.d/` for security scanning. A GitHub Actions workflow is available for automated scanning.

## Port Configuration
Default port is 3000, configurable via `SERVER_PORT` environment variable in both Docker and direct Node execution.