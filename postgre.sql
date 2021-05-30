--Creating tables
CREATE TABLE IF NOT EXISTS "user" (
                        id serial PRIMARY KEY,
                        "user_email" varchar
						);

CREATE TABLE IF NOT EXISTS "account" (
                        id serial PRIMARY KEY,
                        "user_name" varchar,
                        "password" varchar NOT NULL, 
						"signup_date" timestamp
						);
						
CREATE TABLE IF NOT EXISTS "role" (
                        id serial PRIMARY KEY,
                        "role_name" varchar
						);
						
CREATE TABLE IF NOT EXISTS "topic" (
                        id serial PRIMARY KEY,
                        "topic_name" varchar
						);
						
CREATE TABLE IF NOT EXISTS "presentation" (
                        id serial PRIMARY KEY,
                        "title" varchar,
						"link" varchar
						);
						
CREATE TABLE IF NOT EXISTS "video" (
                        id serial PRIMARY KEY,
                        "title" varchar,
						"link" varchar
						);
						
CREATE TABLE IF NOT EXISTS "image" (
                        id serial PRIMARY KEY,
                        "title" varchar,
						"link" varchar
						);
						
CREATE TABLE IF NOT EXISTS "assigned_topic" (
						"completed" boolean 
						);

--Adding the Foreign Keys to USER table

ALTER TABLE "user"
ADD COLUMN IF NOT EXISTS "first_name" varchar, 
ADD COLUMN IF NOT EXISTS "last_name" varchar,  
ADD COLUMN IF NOT EXISTS "account_id" integer;

ALTER TABLE "user"
ADD FOREIGN KEY ("user_name")
REFERENCES "account"("user_name");

ALTER TABLE "user"
ADD FOREIGN KEY ("account_id")
REFERENCES "account"("id");

-- Adding Foreign Keys to ACCOUNT table

ALTER TABLE "account"
ADD COLUMN IF NOT EXISTS "role_id" integer;

ALTER TABLE "account"
ADD FOREIGN KEY ("role_id")
REFERENCES "role"("id");

--Adding Foreign Keys to PRESENTATION table

ALTER TABLE "presentation"
ADD COLUMN IF NOT EXISTS "topic_id" integer;

ALTER TABLE "presentation"
ADD FOREIGN KEY ("topic_id")
REFERENCES "topic"("id");
--Adding Foreign Keys to IMAGE table

ALTER TABLE "image"
ADD COLUMN IF NOT EXISTS "topic_id" integer;

ALTER TABLE "image"
ADD FOREIGN KEY ("topic_id")
REFERENCES "topic"("id");

--Adding Foreign Keys to VIDEO table

ALTER TABLE "video"
ADD COLUMN IF NOT EXISTS "topic_id" integer;

ALTER TABLE "video"
ADD FOREIGN KEY ("topic_id")
REFERENCES "topic"("id");

--Adding Foreign Keys to ASSIGNED TOPIC table

ALTER TABLE "assigned_topic"
ADD COLUMN IF NOT EXISTS "account_id" integer,
ADD COLUMN IF NOT EXISTS "topic_id" integer;

ALTER TABLE "assigned_topic"
ADD FOREIGN KEY ("account_id")
REFERENCES "account"("id");

ALTER TABLE "assigned_topic"
ADD FOREIGN KEY ("topic_id")
REFERENCES "topic"("id");

-------------------- Adding extra columns after group meeting --------------------------------------------

ALTER TABLE "topic"
ADD COLUMN IF NOT EXISTS "role_id" integer;

ALTER TABLE "topic"
ADD FOREIGN KEY ("role_id")
REFERENCES "role"("role_id");
---------------------------------------------------
ALTER TABLE "image"
ADD COLUMN IF NOT EXISTS "image_description" varchar,
ADD COLUMN IF NOT EXISTS "display_order" integer;

ALTER TABLE "video"
ADD COLUMN IF NOT EXISTS "video_description" varchar,
ADD COLUMN IF NOT EXISTS "display_order" integer;

ALTER TABLE "presentation"
ADD COLUMN IF NOT EXISTS "presentation_description" varchar,
ADD COLUMN IF NOT EXISTS "display_order" integer;

CREATE TABLE IF NOT EXISTS "paragraph" (
                        "paragraph_id" serial PRIMARY KEY,
                        "paragraph_content" varchar,
						"display_order" integer
						);

ALTER TABLE "paragraph"
ADD COLUMN IF NOT EXISTS "topic_id" integer;

ALTER TABLE "paragraph"
ADD FOREIGN KEY ("topic_id")
REFERENCES "topic"("topic_id");

------------------- INSERT DUMMY DATA ----------------------------------------------------------------

INSERT INTO role("role_name")
VALUES
('admin'),
('student'),
('teacher_db'),
('teacher_idesign'),
('teacher_webdev')
ON CONFLICT DO NOTHING;

INSERT INTO "topic"("topic_name", "topic_description", "role_id")
VALUES
('Normalization', 'Class normalization is a process by which you reorganize the structure of your object schema in such a way as to increase the cohesion of classes while minimizing the coupling between them. Unfortunately class normalization has not been adopted as widely as I would have hoped.', '3'),
('Relational Database', 'A relational database is a type of database that stores and provides access to data points that are related to one another. ... The columns of the table hold attributes of the data, and each record usually has a value for each attribute, making it easy to establish the relationships among data points.', '3'),
('Entity Relationship Diagram', 'Database is absolutely an integral part of software systems. To fully utilize ER Diagram in database engineering guarantees you to produce high-quality database design to use in database creation, management, and maintenance. An ER model also provides a means for communication.Today we are going to walk you through everything you need to know about ER Diagramming. By reading this ERD guide, you will get the essential knowledge and skills about ER Diagrams and database design. You will learn things like what is ERD, why ERD, ERD notations, how to draw ERD, etc. along with a bunch of ERD examples.', '3'),
('CRUD Operations', 'CRUD is an acronym that comes from the world of computer programming and refers to the four functions that are considered necessary to implement a persistent storage application: create, read, update and delete. Persistent storage refers to any data storage device that retains power after the device is powered off, such as a hard disk or a solid-state drive. In contrast, random access memory and internal caching are two examples of volatile memory - they contain data that will be erased when they lose power.', '3'),
('PostgreSQL quickstart guide', 'Welcome to the PostgreSQLTutorial.com website! This PostgreSQL tutorial helps you understand PostgreSQL quickly. You’ll master PostgreSQL very fast through many practical examples and apply the knowledge in developing applications using PostgreSQL. This section helps you get started with PostgreSQL by showing you how to install PostgreSQL on Windows, Linux, and macOS. You also learn how to connect to PostgreSQL using the psql tool as well as how to load a sample database into the PostgreSQL for practicing. First, you’ll learn how to query data from a single table using basic data querying techniques, including selecting data, sorting result sets, and filtering rows. Then, you’ll learn about advanced queries such as joining multiple tables, using set operations, and constructing the subquery. Finally, you will learn how to manage database tables, such as creating a new table or modifying an existing table’s structure.', '3'),
('Database Front-end', 'Frontend development is one of the critical skills for web developers, as there is a high demand for programmers with excellent front-end development skills. If you have never experienced client-side web development, learning the plethora of front-end technologies can be difficult, but with proper guidance and the right courses, you can achieve your goal.', '5')
ON CONFLICT DO NOTHING;

INSERT INTO "account"("account_username", "account_password", "account_signup_date", "role_id")
VALUES
('bobV', 'lsedfjbJJ6423', '2021-03-25 02:10:23', '2'),
('jimHalpert', 'skdjf&/347', '2021-03-24 20:10:23', '2'),
('pam', 'jkdfjHH&48', '2021-03-24 19:10:23', '2'),
('michael', 'jbjJHGvb65', '2021-03-24 15:10:23', '2'),
('dwight', '98765tghyD', '2021-03-24 13:10:23', '2'),
('tobby', 'password1234', '2021-03-24 15:10:23', '2'),
('angela65', '345457568AHB', '2021-03-24 12:10:23', '2'),
('gabe72', '12345sksj#8', '2021-03-24 17:10:23', '2'),
('kelly83', '98ksGj#8', '2021-03-24 17:10:23', '2'),
('oscar74', 'xxcd5sksj#8', '2021-03-24 17:10:23', '2'),
('keven79', '8756sksj#8', '2021-03-24 17:10:23', '2')
ON CONFLICT DO NOTHING;

INSERT INTO "user"("user_first_name", "user_last_name", "user_email", "account_id")
VALUES
('Bob', 'Vence', 'fdgjfgdj@gmail.com', '12'),
('Jim', 'Halpert', 'asdfsadf@elearning.dk', '13'),
('Pam', 'Beasly', 'dsffsd86@gmail.com', '14'),
('Michael', 'Scott', 'retyh90@gmail.com', '15'),
('Dwight', 'Schrute', 'sadfasdf@elearning.dk', '16'),
('Tobby', 'Flendersen', 'sdfgdfg@gmail.com', '17'),
('Angela', 'Martins', 'asdfsd@elearning.dk', '18'),
('Gabe', 'Saber', 'jdgt532g@elearning.dk', '19'),
('Kelly', 'Kapur', 'dfg5ge4@elearning.dk', '20'),
('Oscar', 'Jensen', 'dar4g44@elearning.dk', '21'),
('Keven', 'Miller', 'dfg4tge@elearning.dk', '22')
ON CONFLICT DO NOTHING;

INSERT INTO "assigned_topic"("topic_id", "account_id", "completed")
VALUES
('1', '12', 'true'),
('1', '13', 'false'),
('1', '14', 'false'),
('1', '15', 'true'),
('1', '16', 'false'),
('1', '17', 'false'),
('3', '12', 'false'),
('3', '13', 'true'),
('3', '14', 'true'),
('3', '19', 'false'),
('2', '21', 'false'),
('3', '18', 'true'),
('4', '12', 'false'),
('2', '12', 'false')
ON CONFLICT DO NOTHING;

INSERT INTO "video"("video_link", "video_title", "video_description", "topic_id")
VALUES
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'Update and stored procedures', 'How to use a stored procedure for updateing user information.', 4), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'CRUD, everything you need to know', 'In this video you will learn the basics queries in PostgreSQL, how to create, read, update and delete.', 4), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'Data Types', 'This is a video about different data types.', 3), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'Normalization basics', 'Normalization is the foundation of every good relational database. In this video you will learn the rules for it.', 1), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'PostgreSQL basics', 'Everything you need to know about the perks of using PostgreSQL and the basics.', 2), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'How to make a good ERD', 'In this video you will be introdced to the logic of entity relationship diagrams and to the ERD beta tool in pgAdmin.', 3), 
('https://www.youtube.com/watch?v=wR0jg0eQsZA', 'Null vs Undefined', 'What is the difference between null and undefined values? You are going to memorize this for life.', 2) 
ON CONFLICT DO NOTHING;

INSERT INTO "presentation"("presentation_link", "presentation_title", "presentation_description", "topic_id")
VALUES
('http://www.esp.org/db-fund.pdf', 'Data Types', 'This is a presentation about different data types.', 3), 
('http://www.esp.org/db-fund.pdf', 'Normalization basics', 'Normalization is the foundation of every good relational database. In this video you will learn the rules for it.', 1), 
('http://www.esp.org/db-fund.pdf', 'PostgreSQL basics', 'Everything you need to know about the perks of using PostgreSQL and the basics.', 2), 
('http://www.esp.org/db-fund.pdf', 'Planning an ERD', 'In this presentation you will be introdced to the logic of entity relationship diagrams and to the ERD beta tool in pgAdmin.', 3), 
('http://www.esp.org/db-fund.pdf', 'Stored procedures and Updates', 'How to use a stored procedure for updateing user information.', 4), 
('http://www.esp.org/db-fund.pdf', 'CRUD basics', 'In this presentation you will read about the basics queries in PostgreSQL, how to create, read, update and delete.', 4), 
('http://www.esp.org/db-fund.pdf', 'Null vs Undefined', 'What is the difference between null and undefined values? You are going to memorize this for life.', 2) 
ON CONFLICT DO NOTHING;

INSERT INTO "image"("image_link", "image_title", "image_description", "topic_id")
VALUES
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure1: Data Types', 'Read the figure and answer the question', 3), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure1: Normalization basics', 'Read the figure and answer the question', 1), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure1:PostgreSQL basics', 'Read the figure and answer the question', 2), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure2: Planning an ERD', 'Read the figure and answer the question', 3), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure1: Stored procedures and Updates', 'Read the figure and answer the question', 4), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure2: CRUD basics', 'Read the figure and answer the question', 4), 
('https://drive.google.com/drive/u/0/folders/1nTU9XtH_gE8qCr0J-JI_FbsXaSrLx1sY', 'Figure2: Null vs Undefined', 'Read the figure and answer the question', 2) 
ON CONFLICT DO NOTHING;


INSERT INTO "paragraph"("paragraph_content", "topic_id")
VALUES
('Database Normalization is a technique of organizing the data in the database. Normalization is a systematic approach of decomposing tables to eliminate data redundancy(repetition) and undesirable characteristics like Insertion, Update and Deletion Anomalies. It is a multi-step process that puts data into tabular form, removing duplicated data from the relation tables.', 1),
('If a table is not properly normalized and have data redundancy then it will not only eat up extra memory space but will also make it difficult to handle and update the database, without facing data loss. Insertion, Updation and Deletion Anomalies are very frequent if database is not normalized. To understand these anomalies let us take an example of a Student table.', 1),
('For a table to be in the First Normal Form: it should follow the following 4 rules:
It should only have single(atomic) valued attributes/columns.
Values stored in a column should be of the same domain
All the columns in a table should have unique names.
And the order in which data is stored, does not matter.', 1),
('For a table to be in the Second Normal Form: 
It should be in the First Normal form. 
And, it should not have Partial Dependency.', 1),
('A table is said to be in the Third Normal Form when:
It is in the Second Normal form. 
And, it does not have Transitive Dependency.', 1),
('A database is a set of data stored in a computer. This data is usually structured in a way that makes the data easily accessible. ', 2),
('A relational database is a type of database. It uses a structure that allows us to identify and access data in relation to another piece of data in the database. Often, data in a relational database is organized into tables.', 2),
('SQL (Structured Query Language) is a programming language used to communicate with data stored in a relational database management system. SQL syntax is similar to the English language, which makes it relatively easy to write, read, and interpret.', 2),
('In the early years of databases, every application stored data in its own unique structure. When developers wanted to build applications to use that data, they had to know a lot about the particular data structure to find the data they needed. These data structures were inefficient, hard to maintain, and hard to optimize for delivering good application performance. The relational database model was designed to solve the problem of multiple arbitrary data structures.', 2),
('Database is absolutely an integral part of software systems. To fully utilize ER Diagram in database engineering guarantees you to produce high-quality database design to use in database creation, management, and maintenance. An ER model also provides a means for communication.', 3),
('Today we are going to walk you through everything you need to know about ER Diagramming. By reading this ERD guide, you will get the essential knowledge and skills about ER Diagrams and database design. You will learn things like what is ERD, why ERD, ERD notations, how to draw ERD, etc. along with a bunch of ERD examples.', 3),
('Entity Relationship Diagram, also known as ERD, ER Diagram or ER model, is a type of structural diagram for use in database design. An ERD contains different symbols and connectors that visualize two important information: The major entities within the system scope, and the inter-relationships among these entities.', 3),
('Create, Read, Update, and Delete (CRUD) are the four basic functions that models should be able to do, at most.
', 4),
('When we are building APIs, we want our models to provide four basic types of functionality. The model must be able to Create, Read, Update, and Delete resources. Computer scientists often refer to these functions by the acronym CRUD. A model should have the ability to perform at most these four functions in order to be complete. If an action cannot be described by one of these four operations, then it should potentially be a model of its own.', 4),
('The CRUD paradigm is common in constructing web applications, because it provides a memorable framework for reminding developers of how to construct full, usable models. For example, let’s imagine a system to keep track of library books. In this hypothetical library database, we can imagine that there would be a books resource, which would store book objects. Let’s say that the book object looks like this:', 4),
('Create — This would consist of a function which we would call when a new library book is being added to the catalog. The program calling the function would supply the values for “title”, “author”, and “isbn”. After this function is called, there should be a new entry in the books resource corresponding to this new book. Additionally, the new entry is assigned a unique id, which can be used to access this resource later.', 4)
ON CONFLICT DO NOTHING;

INSERT INTO "paragraph"("paragraph_content", "topic_id")
VALUES
('Database Normalization Example can be easily understood with the help of a case study. Assume, a video library maintains a database of movies rented out. Without any normalization in database, all information is stored in one table as shown below. Understand Normalization in database with tables example:', 1),
('A KEY is a value used to identify a record in a table uniquely. A KEY could be a single column or combination of multiple column', 1),
('A transitive functional dependency is when changing a non-key column, might cause any of the other non-key columns to change. Consider the table 1. Changing the non-key column Full Name may change Salutation.', 1)
('ER Modeling helps you to analyze data requirements systematically to produce a well-designed database. So, it is considered a best practice to complete ER modeling before implementing your database.', 3)
('ER diagrams are a visual tool which is helpful to represent the ER model. It was proposed by Peter Chen in 1971 to create a uniform convention which can be used for relational database and network. He aimed to use an ER model as a conceptual modeling approach.', 3)
('In order to perform any of these tasks, though, the DBMS must have some kind of underlying model that defines how the data are organized. The relational model is one approach for organizing data that has found wide use in database software since it was first devised in the late 1960s, so much so that, as of this writing, four of the top five most popular DBMSs are relational.', 2)
ON CONFLICT DO NOTHING;

---------------------------CRUD & FUNCTIONS --------------------------------------------------------------

SELECT topic_id, COUNT (*)
	OVER (PARTITION BY topic_id)
FROM public.assigned_topic WHERE completed='true'
ORDER BY topic_id;


SELECT a.account_id, a.account_username, r.role_name, t.topic_id, t.topic_name, "at".completed
FROM public.assigned_topic "at"
LEFT JOIN account a 
ON "at".account_id = a.account_id
LEFT JOIN topic t
ON "at".topic_id = t.topic_id
LEFT JOIN "role" r
ON r.role_id = a.role_id
WHERE "at".account_id = 3 --show a specific student
AND "at".completed = 'false' --show the student's ongoing courses
ORDER BY t.topic_id ASC;



--Filter by videos (counting how many video/ topic)

CREATE OR REPLACE VIEW "viewTopicVideos" AS
SELECT t.topic_name, t.topic_id, v.video_title, "at".account_id, "at".completed
FROM topic t
LEFT JOIN video v ON t.topic_id = v.topic_id
LEFT JOIN assigned_topic "at" ON t.topic_id = "at".topic_id;

--Select videos of the ongoing topic of one student
SELECT account_id, topic_name, completed, video_title, COUNT(video_title) FROM "viewTopicVideos"
WHERE completed = 'false' AND account_id = 3
GROUP BY account_id, topic_id, topic_name, completed
ORDER BY account_id ASC;

--Grouping

SELECT topic_id
FROM assigned_topic
GROUP BY topic_id
HAVING count(*) >= 2 AND topic_id IS NOT NULL;

-----------------------------------------------------------
UPDATE video_title
SET category_id = (
SELECT "id"
FROM category
WHERE title = 'Web Development'
)
WHERE title = 'Javascript';    


--------------------------- TRIGGER --------------------------------------------------------------
CREATE TABLE password_log (
account_id integer,
old_password varchar(15),
logged_at timestamp DEFAULT current_timestamp
);

CREATE OR REPLACE FUNCTION password_log_event() RETURNS trigger AS $$
DECLARE
BEGIN
INSERT INTO password_log (account_id, old_password)
VALUES (OLD.account_id, OLD.account_password);
-- RAISE NOTICE 'Password update for #%', OLD.account_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER password_log_events
AFTER UPDATE ON account
FOR EACH ROW EXECUTE PROCEDURE password_log_event();

-- test trigger:
UPDATE account
SET account_password = 'newPassCode'
WHERE account_id='38';

--------------------------- VIEW --------------------------------------------------------------

-- view all teachers:
 SELECT account.account_id AS teacher_id,
    account.role_id
   FROM account
  WHERE account.role_id = ANY (ARRAY[3, 4, 5]);


--------------------------- STORED PROCEDURE --------------------------------------------------------------

CREATE OR REPLACE FUNCTION add_user_and_create_account(

usern varchar(10),
user_pass varchar(15),
start_d timestamp,
first_n varchar(40),
last_n varchar(50),
e_mail varchar(50),
roleid integer)

RETURNS boolean AS $$
DECLARE
did_insert boolean := false;
found_count integer;
the_account_id integer;

BEGIN
SELECT account_id INTO the_account_id
FROM account s
WHERE s.account_password=user_pass AND s.account_signup_date=start_d and s.role_id=roleID and s.account_username like usern
LIMIT 1;

IF the_account_id IS NULL THEN
INSERT INTO account (account_username, account_password, account_signup_date, role_id)
VALUES (usern, user_pass, start_d, roleID)
RETURNING account_id INTO the_account_id;
did_insert := true;
END IF;

-- Note: this is a notice, not an error as in some programming languages
RAISE NOTICE 'Account found %', the_account_id;
INSERT INTO users (user_first_name, user_last_name, user_email, account_id)
VALUES (first_n, last_n, e_mail, the_account_id);
RETURN did_insert;
END;
$$ LANGUAGE plpgsql;

