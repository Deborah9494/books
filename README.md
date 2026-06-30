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