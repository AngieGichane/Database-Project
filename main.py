import mysql.connector
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

# Database connection
db_config = {
    'user': 'your_user',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'library'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

app = FastAPI()

class Book(BaseModel):
    title: str
    author_id: int
    genre: str
    publish_date: str

class Member(BaseModel):
    name: str
    membership_date: str

# Create a new book
@app.post("/books/")
async def create_book(book: Book):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Books (title, author_id, genre, publish_date) VALUES (%s, %s, %s, %s)",
                   (book.title, book.author_id, book.genre, book.publish_date))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": "Book created successfully"}

# Get all books
@app.get("/books/")
async def get_books():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Books")
    books = cursor.fetchall()
    cursor.close()
    conn.close()
    return books

# Update book details
@app.put("/books/{book_id}")
async def update_book(book_id: int, book: Book):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Books SET title=%s, author_id=%s, genre=%s, publish_date=%s WHERE book_id=%s",
                   (book.title, book.author_id, book.genre, book.publish_date, book_id))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": "Book updated successfully"}

# Delete a book
@app.delete("/books/{book_id}")
async def delete_book(book_id: int):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Books WHERE book_id=%s", (book_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": "Book deleted successfully"}
