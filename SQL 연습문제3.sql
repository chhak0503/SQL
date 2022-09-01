#날짜 : 2022/09/01
#이름 : 김철학
#내용 : SQL 연습문제3

#실습3-1
CREATE DATABASE `java1_College`;
CREATE USER 'java1_admin3'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON java1_College.* TO 'java1_admin3'@'%';
FLUSH PRIVILEGES;

#실습3-2
CREATE TABLE `Student` (
	`stdNo`		CHAR(8) PRIMARY KEY,
	`stdName`	VARCHAR(20) NOT NULL,
	`stdHp`		CHAR(13) NOT NULL,
	`stdYear`	TINYINT NOT NULL,
	`stdAddress` VARCHAR(100)
);

CREATE TABLE `Lecture` (
	`lecNo`		INT PRIMARY KEY,
	`lecName`	VARCHAR(20) NOT NULL,
	`lecCredit`	TINYINT NOT NULL,
	`lecTime`	INT NOT NULL,
	`lecClass`	VARCHAR(10) DEFAULT NULL
);

CREATE TABLE `Register` (
	`regStdNo`			CHAR(8),
	`regLecNo`			INT,
	`regMidScore`		TINYINT,
	`regFinalScore`	TINYINT,
	`regTotalScore`	TINYINT,
	`regGrade`			CHAR(1)
);

#실습3-3
INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, NULL);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO `Lecture` VALUES (234, '무역영문', 3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론', 3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본B01');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');
INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론', 3, 25, '본B05');

INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 234);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 248);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 253);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 239);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210216', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210326', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 167);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20220416', 349);

# 실습 3-4. 강좌를 조회하시오.
SELECT * FROM `Lecture`;

# 실습 3-5. 학생을 조회하시오.
SELECT * FROM `Student`;

# 실습 3-6. 수강신청 내역을 조회하시오.
SELECT * FROM `Register`;

# 실습 3-7. 3학년 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdYear`=3;

# 실습 3-8. 2학점 짜리 강좌를 조회하시오.
SELECT * FROM `Lecture` WHERE `lecCredit`=2;

# 실습 3-9. 아래와 같이 중간고사, 기말고사 점수를 입력하시오.
UPDATE `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;

# 실습 3-10. 아래와 같이 총점과 등급을 입력하시오.
UPDATE `Register` SET 
							`regTotalScore`= `regMidScore` + `regFinalScore`,
							`regGrade` = if(`regTotalScore` >= 90, 'A', 
  										 	 if(`regTotalScore` >= 80, 'B',
											 if(`regTotalScore` >= 70, 'C',
											 if(`regTotalScore` >= 60, 'D', 'F'))));						

# 실습 3-11. 점수가 큰 순서로 정렬하시오.
SELECT * FROM `Register` ORDER BY `regTotalScore` DESC;

# 실습 3-12. 강좌번호가 349번 가운데 총점가 가장 큰 순서로 조회하시오.
SELECT * FROM `Register` WHERE `regLecNo`=349 ORDER BY `regTotalScore` desc;

# 실습 3-13. 30시간 이상인 강좌를 조회하시오.
SELECT * FROM `Lecture` WHERE `lecTime` >= 30;

# 실습 3-14. 강좌명과 강의실을 조회하시오.
SELECT `lecName`, `lecClass` FROM `Lecture`;

# 실습 3-15. 학번과 이름을 조회하시오.
SELECT `stdNo`, `stdName` FROM `Student`;

# 실습 3-16. 주소를 입력하지 않은 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdAddress` IS NULL;

# 실습 3-17. 부산에 거주하는 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdAddress` LIKE '%부산%';

# 실습 3-18. 학생테이블과 수강 테이블을 결합하시오. 단 수강신청 하지 않아 점수가 없어도 같이 조회 되도록 할것
SELECT * FROM `Student` AS a
left JOIN `Register` AS b
ON a.stdNo = b.regStdNo;

# 실습 3-19. 아래와 같이 조회하시오.
SELECT 
	`stdNo`,
	`stdName`,
	`regLecNo`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a, `Register` AS b 
WHERE a.stdNo = b.regStdNo;

# 실습 3-20. 강좌번호 349를 수강 신청한 학생의 이름과 학번을 조회하시오.
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
WHERE `regLecNo`=349;

# 실습 3-21. 아래와 같이 학생별 수강신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오.
SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`	
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
GROUP BY `stdNo`;


# 실습 3-22. 수강 테이블과 강좌 테이블을 결합하시오.
SELECT * FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo;

# 실습 3-23. 아래와 같이 조회하시오.
SELECT 
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo;

# 실습 3-24. '사회복지 마케팅' 강좌를 신청한 건수와 평균을 조회하시오.
SELECT
	COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
	AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo
WHERE `lecName`='사회복지 마케팅';

# 실습 3-25. 'A' 등급을 받은 학번과 강좌명을 조회하시오.
SELECT 
	`regStdNo`,
	`lecName`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo
WHERE `regGrade`='A';

# 실습 3-26. 학생테이블과 수강테이블 그리고 강좌테이블을 결합하시오.
SELECT * FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo;

# 실습 3-27. 아래와 같이 조회하시오.
SELECT
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`	
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
ORDER BY `regGrade`;

# 실습 3-28. 'F' 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
SELECT 
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
WHERE `regGrade` = 'F';

# 실습 3-29. 아래와 같이 학생별 이수학점을 조회하시오. 단 F등급은 받은 과목은 학점으로 인정되지 않음
SELECT 
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
WHERE `regTotalScore` >=60
GROUP BY `stdNo`;

# 실습 3-30. 아래와 같이 신청과목과 이수과목을 조회하시오. 단 F등급은 받은 과목은 이수과목으로 인정되지 않음
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;