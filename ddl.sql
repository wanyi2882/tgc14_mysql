/* show all databases on server */
show databases;

/* create new database */
create database swimming_school;

/* switch to a database (i.e make it active )*/
use swimming_school;

/* see the current database */
SELECT DATABASE();

/* create a table */
create table parents (
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) not null
) engine = innodb;

/* show all the tables in the current active database */
show tables;

/* check the columns of a table */
describe parents;

/* how to add rows to table */
/*insert into <table name> (<cols>) values (<values>)*/
insert into parents (first_name, last_name) values ('Foo', 'Lin Lin');

/* select all rows from a table */
/* select * from <table name> */
select * from parents;

/* insert multiple */
insert into parents (first_name, last_name) values
    ("Ah Kow", "Tan"),
    ("Mable", "Ng"),
    ("Alice", "Smith");


/* Updates */
/* update the parent's last name with id 4 to be patterson */
update parents set last_name="Patterson" where parent_id=4;

/* Delete */
/* Remove the parent with the id 3 */
delete from parents where parent_id = 3;

/* students table */
create table students (
    student_id int unsigned primary key auto_increment,
    name varchar(100) not null,
    date_of_birth date not null,
    swimming_level tinyint not null
) engine=innodb;

/* add the foreign key */
alter table students add parent_id int unsigned not null;
/* for every row in the students table,
each row's parent_id must refer to a valid parent_id in the parents table */
alter table students add constraint fk_students_parents
    foreign key (parent_id) references parents(parent_id);

insert into students (name, date_of_birth, swimming_level, parent_id)
 values ('Litle Dog', '1999-09-08', 1, 2);

/* the below won't work */
 insert into students(name, date_of_birth, swimming_level, parent_id)
 values("Naughty Boy", "1998-09-10", 1,99 );

 create table swimming_levels (
     level_id int unsigned auto_increment primary key,
     name varchar(200)
 )engine=innodb;

/* add to the student table a new column  named level_id */
 alter table students add level_id int unsigned not null;

/* we cannot add the new FK because there are existing students
 which level_id is 0 unless we delete all the students first*/
 alter table students add constraint fk_students_swimming_levels
    foreign key (level_id) references swimming_levels(level_id);

/**/