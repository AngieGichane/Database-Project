-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    UNIQUE(name)
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    publish_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    membership_date DATE,
    UNIQUE(name)
);

-- Create Loans table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Sample data insertion
INSERT INTO Authors (name, date_of_birth) VALUES
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('J.R.R. Tolkien', '1892-01-03');

INSERT INTO Books (title, author_id, genre, publish_date) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 'Fantasy', '1997-06-26'),
('1984', 2, 'Dystopian', '1949-06-08'),
('The Hobbit', 3, 'Fantasy', '1937-09-21');

INSERT INTO Members (name, membership_date) VALUES
('Maya Swan', '2023-01-15'),
('Dan Rowland', '2022-11-22'),
('Iris West', '2023-04-01');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2023-04-05', '2023-04-12'),
(2, 2, '2023-04-06', '2023-04-13'),
(3, 3, '2023-04-07', '2023-04-14');
