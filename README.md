# Library Management Web Application

This project is a small web application for managing a book system with authors, genres, and books. It is built with PHP on the backend and vanilla JavaScript on the frontend.

The application allows you to create, edit, and delete authors and genres, assign books to genres, and view related data dynamically without full page reloads.

The frontend uses a custom rendering system to generate HTML templates from JavaScript, and API calls are handled through a lightweight fetch wrapper. The interface is designed using a reusable table and overlay system that is shared across different modules.

Main features:
- CRUD operations for authors and genres
- Dynamic assignment of books to genres
- Overlay forms for creating, editing, and deleting records
- Reusable table layout for different data types
- Basic client-side interactivity with vanilla JavaScript

The backend is structured in layers, separating data access, logic, and view handling. SQL queries are managed through a central data access module.

This project was built as a learning exercise to practice full-stack development, DOM manipulation, and modular code organization without frameworks.

## Project structure

- `/public` → Frontend entry point
- `/public/assets` → images, CSS and JavaScript files
- `/src` → PHP backend logic and views
- `/database` → SQL file to create and populate the database

## Requirements

- PHP 7+ or 8+
- MariaDB
- phpMyAdmin (recommended for easy import)
- Local server (XAMPP)

## Setup instructions

### 1. Create the database
Open phpMyAdmin and create a database with the following name: books_v3
### 2. Import the database
Inside the project folder, go to: /database
Import the `.sql` file into the `books_v3` database using phpMyAdmin.
### 3. Configure server
Make sure your local server points to the project folder.
If you are using XAMPP, place the project inside: htdocs/books
### 4. Run the project
Open your browser and go to: http://localhost/books/public/index.php