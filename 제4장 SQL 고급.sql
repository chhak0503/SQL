#날짜 : 2022/08/24
#이름 : 김철학
#내용 : 제4장 SQL 고급

#실습4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) NOT NULL,
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`seq`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT NOT NULL
);

#실습4-2
insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());


insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);

insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);

insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);

insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);

insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);

insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);
insert into `Sales` values ('', '', '', '', 98100);



#실습4-3
#실습4-4
#실습4-5
#실습4-6
#실습4-7
#실습4-8
#실습4-9
#실습4-10
#실습4-11
#실습4-12
#실습4-13
#실습4-14
#실습4-15
#실습4-16
#실습4-17


