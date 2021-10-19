/* create new database */
create database library;

/* BOOKS SCHEMA */
use library;

create table books (
    book_id int unsigned auto_increment primary key,
    title varchar(100) not null,
    synopsis text,
    edition int
) engine = innodb;

insert into books (title, synopsis) 
    values ("Lord of the Rings", "Two short guys must return a ring");

create table authors (
    authors_id int unsigned auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null
) engine = innodb;

insert into authors (first_name, last_name)
    values ("John Ronald", "Tolkien"),
           ("J.K.", "Rowling"),
           ("Jim", "Butcher");

create table authors_books (
    author_book_id int unsigned auto_increment primary key,
    authors_id int unsigned not null,
    book_id int unsigned,
    foreign key (authors_id) references authors(authors_id) on delete cascade,
    foreign key (book_id) references books(book_id) on delete cascade
) engine = innodb;

/*on delete cascade means all related will be deleted*/
/*on delete restrict need to change the table with fk first then can delete*/
