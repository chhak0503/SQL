#날짜 : 2022/09/02
#이름 : 김철학
#내용 : SQL 연습문제4

#실습4-1
CREATE DATABASE `java1_BookStore`;
CREATE USER 'java1_admin4'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java1_BookStore`.* TO 'java1_admin4'@'%';
FLUSH PRIVILEGES;

#실습4-2
CREATE TABLE `Customer`(
	`custId` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`address` VARCHAR(20),
	`phone` CHAR(13)
);

CREATE TABLE `Book` (
	`bookId`    INT NOT NULL PRIMARY KEY,
	`bookName`  VARCHAR(20) NOT NULL,
	`publisher` VARCHAR(20) NOT NULL,
	`price`     INT
);

CREATE TABLE `Order`(
	`orderId` INT PRIMARY KEY AUTO_INCREMENT,
	`custId`	INT NOT NULL,
	`bookId` INT NOT NULL,
	`salePrice` INT NOT NULL,
	`orderDate` DATE NOT NULL
);

#실습4-3
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타',   '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 1,6000,'2014-07-01');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 3,21000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2, 5,8000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 6,6000,'2014-07-04');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 7,20000,'2014-07-05');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 2,12000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 8,13000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 8,13000,'2014-07-10');

#실습4-4. 모든 회원의 회원번호, 이름, 주소를 조회하시오.
SELECT `custId`, `name`, `address` FROM `Customer`;

#실습4-5. 모든 도서의 이름과 가격을 검색하시오.
SELECT `bookName`, `price` FROM `Book`;

#실습4-6. 모든 도서의 가격과 이름을 검색하시오.
SELECT `price`, `bookName` FROM `Book`;

#실습4-7. 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회하시오.
SELECT * FROM `Book`;

#실습4-8. 도서 테이블에 있는 모든 출판사를 조회하시오.
SELECT `publisher` FROM `Book`;

#실습4-9. 도서 테이블에 있는 모든 출판사를 조회하시오. 단 조회 결과에서 중복을 제거하시오.
SELECT DISTINCT `publisher` FROM `Book`;

#실습4-10. 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` >= 20000;

#실습4-11. 가격이 20,000원 미만인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` < 20000;

#실습4-12. 가격이 10,000원 이상 20,000 이하인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;
SELECT * FROM `Book` WHERE `price` BETWEEN 10000 AND 20000;

#실습4-13. 가격이 15,000원 이상 30,000 이하인 도서의 도서번호, 도서명, 도서가격을 조회하시오.
SELECT `bookId`, `bookName`, `price` FROM `Book` WHERE `price` >= 15000 AND `price` <= 30000;

#실습4-14. 도서번호가 2, 3, 5인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;
SELECT * FROM `Book` WHERE `bookId` IN(2, 3, 5);

#실습4-15. 도서번호가 짝수번호인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookId` % 2 = 0;

#실습4-16. 박씨 성 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `name` LIKE '박%'; 

#실습4-17. 대한민국에 거주하는 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `address` LIKE '%대한민국%'; 

#실습4-18. 휴대폰 번호가 유효한 고객만 조회하시오.
SELECT * FROM `Customer` WHERE NOT `phone` IS NULL;

#실습4-19. 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR  `publisher`='대한미디어';

#실습4-20. ‘축구의 역사’를 출간한 출판사를 조회하시오.
SELECT `publisher` FROM `Book` WHERE `bookName`='축구의 역사';

#실습4-21. 도서이름에 ‘축구’가 포함된 출판사를 조회하시오.
SELECT `publisher` FROM `Book` WHERE `bookName` LIKE '%축구%';

#실습4-22. 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookName` LIKE '_구%';

#실습4-23. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `Book` WHERE `bookName` LIKE '%축구%' AND `price` >= 20000;

#실습4-24. 도서를 이름순으로 조회하시오.
SELECT * FROM `Book` ORDER BY `bookName`;

#실습4-25. 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회하시오.
SELECT * FROM `Book` ORDER BY `price` ASC, `bookName` ASC;

#실습4-26. 도서를 가격의 내림차순으로 조회하시오. 단 가격이 같다면 출판사를 오름차순으로 조회할 것
SELECT * FROM `Book` ORDER BY `price` DESC, `publisher` ASC;

#실습4-27. 도서가격이 큰 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `Book` ORDER BY `price` DESC LIMIT 3;

#실습4-28. 도서가격이 작은 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `Book` ORDER BY `price` ASC LIMIT 3;

#실습4-29. 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;

#실습4-30. 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
SELECT 
	SUM(`salePrice`) AS `총판매액`,
	AVG(`salePrice`) AS `평균값`,
	MIN(`salePrice`) AS `최저가`,
	MAX(`salePrice`) AS `최고가`
FROM 
	`Order`;

#실습4-31. 도서 판매 건수를 구하시오.
SELECT COUNT(*) AS `판매건수` FROM `Order`;

#실습4-32. 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
SELECT `bookId`, REPLACE(`bookName`, '야구', '농구') AS `bookName`, `publisher`, `price` FROM `Book`;

#실습4-33. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 조회할 것
SELECT `custId`, COUNT(*) AS `수량` FROM `Order` 
WHERE `salePrice` >= 8000
GROUP BY `custId`
HAVING `수량` >= 2;

#실습4-34. 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT * FROM `Customer` AS a JOIN `Order` AS b ON a.custNo = b.custNo;
SELECT * FROM `Customer` JOIN `Order` USING(`custId`);
SELECT * FROM `Customer`, `Order` WHERE `Customer`.custNo = `Order`.custNo;

#실습4-35. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT * FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo
		ORDER BY a.`custId`;
	
#실습4-36. 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오.
SELECT `name`, `salePrice` FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo;


#실습4-37. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT `name`, SUM(`salePrice`) FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo
		GROUP BY a.`custId`
			ORDER BY a.`name` ASC;

#실습4-38. 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오.
SELECT `name`, `bookName` FROM `Book` AS a
JOIN `Order` AS b ON a.bookNo = b.bookNo
JOIN `Customer` AS c ON b.custNo = c.custNo;

#실습4-39. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오.
SELECT `name`, `bookName` FROM `Book` AS a
JOIN `Order` AS b ON a.bookNo = b.bookNo
JOIN `Customer` AS c ON b.custNo = c.custNo
WHERE `price`=20000;

#실습4-40. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오.
SELECT `name`, `salePrice` FROM `Order` AS a
RIGHT JOIN `Customer` AS b ON a.custNo = b.custNo;
#실습4-41
select `bookName` from `Book` where `price`=(select max(`price`) from `Book`);

#실습4-42
select `name` from `Customer` where `custId` not in(select distinct `custId` from `Order`);

#실습4-43
select sum(`salePrice`) as `총합` from `Order` where `custId`=(select `custId` from `Customer` where `name`='김연아');

#실습4-44. Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO `Book`(`bookId`, `bookName`,`publisher`) VALUES(11, '스포츠의학','한솔의학서적');

#실습4-45. Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습4-46. Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE FROM `Customer` WHERE `custId`=5;