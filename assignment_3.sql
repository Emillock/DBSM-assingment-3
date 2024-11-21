drop table authors;
drop table books_for_courses;
drop table books;



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

select * from authors;

alter table books drop column authors;

-- insert into books_for_courses values (
-- 	'20424',	
-- 	'133970779',	
-- 	'Fundamentals of Database Systems 7th Edition',
-- 	'Ramez Elmasri, Shamkant Navathe',	
-- 	'7',	
-- 	'Pearson',	
-- 	'1 Lake Street Upper Saddle River, NJ 07458 United States',	
-- 	'1280',	
-- 	'2018',	
-- 	'Introduction to DB Systems'
-- );
-- insert into books_for_courses values (
-- 	20424,
-- 	1111969604,
-- 	'Database Systems: Design, Implementation, and Management',
-- 	'Carlos Coronel, Steven Morris, Peter Rob',
-- 	10,
-- 	'Course Technology',
-- 	'5 Maxwell Drive, Clifton Park NY 12065, Boston, MA, United States',
-- 	752,
-- 	2019,
-- 	'Introduction to DB Systems'
-- );
-- insert into books_for_courses values (
-- 	20424,
-- 	135188148,
-- 	'Database Concepts',
-- 	'David Kroenke, David Auer, Scott Vandenberg, Robert Yoder',
-- 	9,
-- 	'Pearson',
-- 	'1 Lake Street Upper Saddle River, NJ 07458 United States',
-- 	552,
-- 	2019,
-- 	'Introduction to DB Systems'
-- );
-- insert into books_for_courses values (
-- 	10122,
-- 	133970779,
-- 	'Fundamentals of Database Systems 7th Edition',
-- 	'Ramez Elmasri, Shamkant Navathe',
-- 	7,
-- 	'Pearson',
-- 	'1 Lake Street Upper Saddle River, NJ 07458 United States',
-- 	1280,
-- 	2018,
-- 	'Big Data and Analytics'
-- );
-- insert into books_for_courses values (
-- 	20451,
-- 	1119803780,
-- 	'Systems Analysis and Design',
-- 	'Alan Dennis, Barbara Wixom, Roberta M. Roth',
-- 	7,
-- 	'Wiley',
-- 	'111 River Street, Hoboken, NJ, USA',
-- 	464,
-- 	2021,
-- 	'Systems Analysis & Design'
-- );
-- insert into books_for_courses values (
-- 	31311,
-- 	908606273,
-- 	'My Cat Likes to Hide in Boxes',
-- 	'Lynley Dodd',
-- 	1,
-- 	'Mallinson Rendel',
-- 	'5th Flr, 15 Courtnay Place Te Aro, Wellington, New Zealand',
-- 	345,
-- 	2013,
-- 	'Academic Writing'
-- );
-- insert into books_for_courses values (
-- 	10209,
-- 	131103627,
-- 	'C Programming Language',
-- 	'Brian W. Kernighan, Dennis M. Ritchie',
-- 	2,
-- 	'Pearson',
-- 	'1 Lake Street Upper Saddle River, NJ 07458 United States',
-- 	272,
-- 	1988,
-- 	'Programming Principles I'
-- );
-- insert into books_for_courses values (
-- 10209,
-- 1718501048,
-- 'Effective C: An Introduction to Professional C Programming',
-- 'Robert C. Seacord',
-- 2,
-- 'No Starch Press',
-- '329 Primrose Road, #42 Burlingame, CA 94010-4093 USA',
-- 272,
-- 2020,
-- 'Programming Principles I'
-- );


