CREATE DATABASE IF NOT EXISTS doitsql;
USE doitsql;
CREATE TABLE doit_increment (
col_1 INT AUTO_INCREMENT PRIMARY KEY,
col_2 VARCHAR(50),
col_3 int);

INSERT INTO doit_increment(col_2, col_3) VALUES ('1 자동 입력', 1);
INSERT INTO doit_increment(col_2, col_3) VALUES ('2 자동 입력', 2);

SELECT * FROM doit_increment;

INSERT INTO doit_increment (col_1,col_2, col_3) VALUES (3, '3 자동 입력', 3);
INSERT INTO doit_increment (col_1,col_2, col_3) VALUES (5, '4 건너 뛰고 5 자동 입력', 5);
INSERT INTO doit_increment(col_2, col_3) VALUES ('어디까지 입력되었을까?', 0);
SELECT LAST_INSERT_ID();

ALTER TABLE doit_increment AUTO_INCREMENT=100;
INSERT INTO doit_increment (col_2, col_3) VALUES ('시작값이 변경되었을까?' , 0);

SET @@auto_increment_increment = 5;
INSERT INTO doit_increment (col_2, col_3) VALUES ('5씩 증가 할까? (1)' , 0);
INSERT INTO doit_increment (col_2, col_3) VALUES ('5씩 증가 할까? (2)' , 0);


CREATE TABLE doit_insert_select_from(

col_1 INT,
col_2 VARCHAR(10)
);

CREATE TABLE doit_insert_select_to (
col_1 INT,
col_2 VARCHAR(10)
);

INSErT INTO doit_insert_select_from VALUES (1, 'Do');
INSERT INTO doit_insert_select_from VALUES (2, 'It');
INSERT INTO doit_insert_select_from VALUES (3, 'MySQL');

INSERT INTO doit_insert_select_to
SELECT * FROM doit_insert_select_from;

SELECT * FROM doit_insert_select_to;

CREATE TABLE doit_select_new AS (SELECT * FROM doit_insert_select_from);

SELECT * FROM doit_select_new;

CREATE TABLE doit_parent (col_1 INT PRIMARY KEY);
CREATE TABLE doit_child (col1_1 INT);

ALTER TABLE doit_child
ADD FOREIGN KEY (col1_1) REFERENCES doit_parent(col_1);
SELECT * FROM doit_child;
INSERT INTO doit_parent VALUES (1);
INSERT INTO doit_child VALUES (1);
SELECT * FROM doit_parent;

DELETE FROM doit_child WHERE col_1 = 1;
DELETE FROM doit_partent WHERE col_= 1;

DROP TABLE doit_child;
DROP TABLE doit_parent;

CREATE TABLE doit_parent(col_1 INT PRIMARY KEY);
CREATE TABLE doit_child (col_1 INT);
ALTER TABLE doit_child ADD FOREIGN KEY (col_1) references doit_parent(col_1);

SHOW CREATE TABLE doit_child;

ALTER TABLE doit_child
DROP CONSTRAINT doit_child_ibfk_1; 

DROP TABLE doit_parent;
DROP TABLE doit_child;

USE doitsql;
CREATE TABLE doit_float (col_1 FLOAT);
INSERT INTO doit_float VALUES (0.7);

SELECT * FROM doit_float WHERE col_1 = 0.7;

CREATE TABLE doit_collation(

col_latin1_general_ci VARCHAR(10) COLLATE latin1_general_ci,
col_latin1_general_cs VARCHAR(10) COLLATE latin1_general_cs,
col_latin1_bin VARCHAR(10) COLLATE latin1_bin,
col_latin7_general_ci VARCHAR(10) COLLATE latin7_general_ci
);
INSERT INTO doit_collation VALUES ('a','a','a','a');
INSERT INTO doit_collation VALUES ('b','b','b','b');
INSERT INTO doit_collation VALUES ('A','A','A','A');
INSERT INTO doit_collation VALUES ('B','B','B','B');
INSERT INTO doit_collation VALUES ('*','*','*','*');
INSERT INTO doit_collation VALUES ('_','_','_','_');
INSERT INTO doit_collation VALUES ('!', '!', '!', '!');
INSERT INTO doit_collation VALUES ('1','1','1','1');
INSERT INTO doit_collation VALUES ('2','2','2','2');

SELECT col_latin1_general_ci FROM doit_collation ORDER BY col_latin1_general_ci;
SELECT col_latin1_general_cs FROM doit_collation ORDER BY col_latin1_general_cs;
SELECT col_latin1_bin FROM doit_collation ORDER BY col_latin1_bin;
SELECT col_latin7_general_ci FROM doit_collation ORDER BY col_latin7_general_ci;