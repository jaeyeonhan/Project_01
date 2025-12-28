--- q1. world 데이터 베이스의 country 테이블에서 code가 KOR인 데이터 조회하는 쿼리 작성alter
USE world; --- 특정 db만 사용하려면 먼저 실행 필요
SELECT * FROM country WHERE Code = 'KOR';
--- q2. world 데이터 베이스의 country 테이블에서 Region 열에 Asia라는 글자를 포함하는 데이터를 조회하는 쿼리 작성
SELECT * FROM country WHERE Region LIKE'%Asia%';
--- q3 world 데이터 베이스의 country 테이블에서 Name 열의 데이터가 5글자인 데이터를 조회하는 쿼리 작성alter
SELECT * FROM country WHERE Name LIKE '_____';
--- q4 world 데이터 베이스의 country 테이블에서 Population 열을 숫자가 높은 순으로 정렬하여 조회하는 쿼리 작성alter
SELECT * FROM country ORDER BY Population DESC;
SELECT Population FROM country ORDER BY Population DESC;
--- q5 world 데이터 베이스의 country 테이블에서 LifeExpectancy 열의 데이터가 60 이상 70 이하인 데이터 조회
SELECT * FROM country WHERE LifeExpectancy >= 60 AND LifeExpectancy <= 70;
SELECT * FROM country WHERE LifeExpectancy BETWEEN 60 AND 70; 
--- q6 world 데이터 베이스의 country 테이블에서 Region 열의 데이터가 Asia를 포함하지 않으면서 name 열에서 g 또는 u 글자를 포함하는 데이터를 Population 열의 내림차순으로 조회
SELECT * FROM country WHERE Region NOT LIKE '%Asia%' AND name LIKE '%g%' 
OR name LIKE '%u%'
ORDER BY Population DESC;

SELECT * FROM country WHERE Region NOT LIKE '%Asia%' 
AND name REGEXP '[gu]' 
ORDER BY Population DESC; --- 글자 한글자 g또는 u인경우 ,또는 space 입력시 포함함 

SELECT * FROM country WHERE Region NOT LIKE '%Asia%' 
AND name REGEXP 'g|u'
ORDER BY Population DESC;   --- 단어 인경우, or의 의미로 처리 가능 go or up

--- q7 world 데이터 베이스의 country 테이블에서 Region 그룹별로 개수를 구하고 개수가 높은 순서대로 조회하는 쿼리 
SELECT Region, COUNT(*) AS cnt FROM country GROUP BY Region ORDER BY cnt DESC;


