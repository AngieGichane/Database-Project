# Library Management System API

## Project Description

This project is a **Library Management System** that implements a database-driven system to manage books, authors, members, and book loans. It consists of two parts:

1. **Database Management**: A relational database schema using MySQL to manage and store information related to books, authors, members, and loans.
2. **CRUD API**: A FastAPI-based web service that allows users to perform Create, Read, Update, and Delete (CRUD) operations on books, members, and loans.

This project provides a basic API to interact with the library database and offers features to add, update, delete, and retrieve books and members, as well as manage book loans.

---

## Features

- **Books Management**: Add, update, retrieve, and delete books in the library.
- **Member Management**: Manage members, including adding, updating, and retrieving member information.
- **Loan Management**: Manage the borrowing and return of books.

---

## Setup and Requirements

### Prerequisites

- **Python** (version 3.7 or later)
- **MySQL** (version 5.7 or later)
- **FastAPI**
- **MySQL Connector** (for Python)
- **Uvicorn** (for running FastAPI)

### Step 1: Install Python Dependencies

Create a `requirements.txt` file with the following content:

```text
fastapi
mysql-connector-python
uvicorn
