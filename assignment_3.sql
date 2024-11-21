drop table books_for_courses;
drop table courses;
drop table authors;
drop table books;
drop table publishers;

create table books_for_courses(
	CRN int not null,
	ISBN int not null,
	title varchar(255),
	authors varchar(255),
	edition int,
	publisher varchar(255),
	publisher_address varchar(255),
	pages int,
	b_year int,
	course_name varchar(255),
	primary key(CRN,ISBN)
);

copy books_for_courses from 'C:\Users\Public\Unnormalized1(Sheet1).csv' delimiter ',' csv header;

select * from books_for_courses;

create table books(
	ISBN int not null,
	title varchar(255),
	authors varchar(255),
	edition int,
	publisher varchar(255),
	publisher_address varchar(255),
	pages int,
	b_year int,
	primary key(ISBN)
	--foreign key(ISBN) references books_for_courses(ISBN)
);

insert into books
select distinct ISBN,
				title,
				authors,
				edition,
				publisher,
				publisher_address,
				pages,
				b_year 
				from books_for_courses;
				
alter table books_for_courses
add foreign key (ISBN) references books(ISBN),
drop column title,
drop column authors,
drop column edition,
drop column publisher,
drop column publisher_address,
drop column pages,
drop column b_year;

select * from books_for_courses;

create table authors(
	ISBN int not null,
	author varchar(255),
	primary key(ISBN,author),
	foreign key(ISBN) references books(ISBN)
);

insert into authors
select distinct ISBN,regexp_split_to_table(authors, ', ') from books;

alter table books drop column authors;

select * from authors;

create table publishers(
	publisher_number serial,
	publisher_name varchar(255),
	publisher_address varchar(255),
	primary key(publisher_number)
);

insert into publishers (publisher_name,publisher_address)
select distinct publisher,publisher_address from books;

select * from publishers;

alter table books add column publisher_number integer references publishers(publisher_number); 

update books
set publisher_number = publishers.publisher_number
from publishers
where (books.publisher = publishers.publisher_name);

alter table books drop column publisher,drop column publisher_address;

select * from books;

create table courses(
	CRN int not null,
	course_name varchar(255),
	primary key(CRN)
);

insert into courses
select distinct CRN,course_name from books_for_courses;
alter table books_for_courses 
add foreign key (CRN) references courses(CRN),
drop column course_name;

-- select * from books_for_courses;
-- select * from courses;
-- select * from books;
-- select * from authors;
-- select * from publishers;