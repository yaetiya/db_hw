CREATE SCHEMA library;

CREATE TABLE library.book (
    isbn INT PRIMARY KEY,
    author VARCHAR(30),
    publish_date DATE,
    title VARCHAR(30),
    pages INT
);

CREATE TABLE library.category (
    id INT PRIMARY KEY,
    category_name VARCHAR(30)
);

CREATE TABLE library.category_book (isbn INT, category_id INT);

CREATE TABLE library.category_category (child_category_id INT, parent_category_id INT);

CREATE TABLE library.publisher (
    id INT PRIMARY KEY,
    publisher_name VARCHAR(30)
);

CREATE TABLE library.publisher_book (isbn INT, publisher_id INT);

CREATE TABLE library.book_instance (id INT PRIMARY KEY, isbn INT);

CREATE TABLE library.reader_book (id INT, reader_id INT);

CREATE TABLE library.reader (
    id INT PRIMARY KEY,
    reader_name VARCHAR(30)
);

ALTER TABLE
    library.category_category
ADD
    FOREIGN KEY (child_category_id) REFERENCES library.category (id);

ALTER TABLE
    library.category_category
ADD
    FOREIGN KEY (parent_category_id) REFERENCES library.category (id);

ALTER TABLE
    library.book_instance
ADD
    FOREIGN KEY (isbn) REFERENCES library.book (isbn);

ALTER TABLE
    library.category
ADD
    FOREIGN KEY (id) REFERENCES library.book (isbn);

ALTER TABLE
    library.publisher_book
ADD
    FOREIGN KEY (isbn) REFERENCES library.book (isbn);

ALTER TABLE
    library.publisher_book
ADD
    FOREIGN KEY (publisher_id) REFERENCES library.publisher (id);

ALTER TABLE
    library.reader_book
ADD
    FOREIGN KEY (id) REFERENCES library.book_instance (id);

ALTER TABLE
    library.reader_book
ADD
    FOREIGN KEY (reader_id) REFERENCES library.reader (id);

ALTER TABLE
    library.category_book
ADD
    FOREIGN KEY (category_id) REFERENCES library.category (id);