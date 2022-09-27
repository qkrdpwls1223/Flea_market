CREATE TABLE IF NOT EXISTS jspstudydb.MEMBERS (
	EMAIL VARCHAR(30) NOT NULL PRIMARY KEY,
	PW VARCHAR(20) NOT NULL,
	NAME VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE IF NOT EXISTS jspstudydb.BOARD(
	NUM INT PRIMARY KEY,
	NAME VARCHAR(30),
	SUBJECT VARCHAR(50),
	CONTENT VARCHAR(3000),
	READCOUNT INT,
	DATE DATETIME
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE IF NOT EXISTS jspstudydb.BOARD2(
	NUM INT PRIMARY KEY,
	NAME VARCHAR(30),
	SUBJECT VARCHAR(50),
	CONTENT VARCHAR(3000),
	READCOUNT INT,
	DATE DATETIME
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

create table if not exists jspstudydb.COMMENT(
	commentID int primary key,
	bbsID int,
	userID varchar(30),
	commentText varchar(200),
	commentAvailable int,
	date datetime
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

create table if not exists jspstudydb.COMMENT2(
	commentID int primary key,
	bbsID int,
	userID varchar(30),
	commentText varchar(200),
	commentAvailable int,
	date datetime
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;