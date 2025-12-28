USE doitsql;
CREATE TABLE doit_float(col_1 FLOAT);
INSERT INTO doit_float VALUES (0.7);
-- FLOAT 타입은 부동 소수점 숫자를 저장, 정확한 값이 아닌 근사치를 저장한다. 따라서 빈 결과를 반환 
SELECT * FROM doit_float WHERE col_1 = 0.7;

CREATE TABLE doit_char_varchar (
col_1 CHAR(5), col_2 VARCHAR(5));

INSERT INTO doit_char_varchar VALUES ('12345', '12345');
INSERT INTO doit_char_varchar VALUES ('ABCDE', 'ABCDE');
-- 숫자 영어 이외의 문자는 MYSQL에서 3바이트 사용
INSERT INTO doit_char_varchar VALUES ('가나다라마', '가나다라마'); 

SELECT 
col_1, CHAR_LENGTH(col_1) as char_length, LENGTH(col_1) as char_byte,
col_2, CHAR_LENGTH(col_2) as char_length, LENGTH(col_2) AS char_byte
FROM doit_char_varchar;


SELECT col_latin1_general_ci FROM doit_collation ORDER BY col_latin1_general_ci;
-- 대문자 소문자 먼저 정렬, A 다음 B AaBb
SELECT col_latin1_general_cs FROM doit_collation ORDER BY col_latin1_general_cs;
-- AB-ab
SELECT col_latin1_bin FROM doit_collation ORDER BY col_latin1_bin;
-- 특수 문자 먼저 정렬
SELECT col_latin7_general_ci FROM doit_collation ORDER BY col_latin7_general_ci;

CREATE TABLE date_table(
justdate DATE,
justtime TIME,
justdatetime DATETIME,
justtimestamp TIMESTAMP);

INSERT INTO date_table VALUEs (now(), now(), now(), now());

SELECT * FROM date_table;