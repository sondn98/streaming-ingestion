CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE IF NOT EXISTS my_table_3(
	f1 INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	f2 TINYINT,
	f3 SMALLINT,
	f4 MEDIUMINT,
	f5 BIGINT,
	f6 FLOAT(10, 2),
	f7 DOUBLE(10, 2),
	f8 DECIMAL(15, 2),
	f9 DATE,
	f10 DATETIME,
	f11 TIMESTAMP,
	f12 TIME,
	f13 CHAR(255),
	f14 VARCHAR(255),
	f15 BLOB,
	f16 TINYBLOB,
	f17 MEDIUMBLOB,
	f18 LONGBLOB,
	f19 ENUM('A', 'B', 'C')
);
commit;