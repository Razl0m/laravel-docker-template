# Laravel with Docker Compose

This repository contains a docker compose template configured to run laravel using containers in both development and production environments.

based on  [laravel-docker-examples](https://github.com/rw4lll/laravel-docker-examples)

## What changed 
- fix HMR
- use alpine images
- left only the necessary libraries
- add SSL support
- add vite container with always "npm run dev" (in development mode)  

## Features
- Nginx for serving the Laravel application
- PHP-FPM for executing PHP scripts
- PostgreSQL as the database
- Redis for caching and session storage
- Automatic SSL support
- Automate migrating when start porject
- HRM Vite (in development mode)
- Xdebug for PHP debugging (in development mode)
- Install all dependecies when start project (in development mode)

## Prerequisites
Ensure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### 1. Clone the Repository in laravel project
```sh
git clone https://github.com/Razl0m/laravel-docker-template.git path/to/your/laravel/project
cd path/to/your/laravel/project
```

### 2. Create Environment File
Copy the example environment file and update the necessary variables:
```sh
cp .env.example .env
```

### 3. Build and Start Services
- Put your cert.crt and key.key files in ssl directory
- Replace `yourDomain` in `nginx.conf` with your actual domain
- Replace `yourDomain` in `vite.config.ts` with your actual domain

#### Development Environment
```sh
docker compose -f compose.dev.yaml up --build -d
```

#### Production Environment
```sh
docker compose -f compose.prod.yaml up --build -d
```

## Services Overview

### Web Server (Nginx)
- Configured to serve the Laravel application and redirect HTTP to HTTPS
- Uses SSL certificates for secure connections

### PHP-FPM
- Runs the Laravel application
- Supports Xdebug in development

### PostgreSQL
- Stores application data
- Uses credentials from `.env` file

### Redis
- Used for caching and queue management

### Vite (Development Only)
- Watches for changes and updates automatically

## Stopping Services
To stop and remove all containers:
```sh
docker compose -f compose.dev.yaml down

# or for production
docker compose -f compose.prod.yaml down
```

## Additional Commands
### Connect to container terminal or execude command
```sh
docker compose -f compose.dev|prod.yaml exec serviceName /bin/sh
```

## Technical Details

- **PHP**: Version **8.4.5 FPM**
- **PostgreSQL**: Version **17.4**
- **Redis**: Version **7.4.2**
- **Nginx**: Version **1.27.4**