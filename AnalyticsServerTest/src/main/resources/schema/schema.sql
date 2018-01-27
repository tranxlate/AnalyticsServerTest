
-- 시퀀스 테이블 생성
CREATE TABLE sequences ( name varchar(32), currval BIGINT UNSIGNED )
ENGINE=InnoDB;

-- 시퀀스 생성 프로시저
DELIMITER //
CREATE PROCEDURE `create_sequence`(IN the_name text)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DELETE FROM sequences WHERE name=the_name;
     INSERT INTO sequences VALUES (the_name, 0);
 END//
DELIMITER ;
 
-- 시퀀스 다음 값 가져오기 프로시저 생성
DELIMITER //
 CREATE FUNCTION `nextval`(the_name varchar(32))
 RETURNS BIGINT UNSIGNED
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret BIGINT UNSIGNED;
     UPDATE sequences SET currval=currval+1 WHERE name=the_name;
     SELECT currval INTO ret FROM sequences WHERE name=the_name limit 1;
     RETURN ret;
 END//
DELIMITER ;

-- 시간을 VARCHAR(14) 형태로 가져오기
DELIMITER //
 CREATE FUNCTION `now14`()
 RETURNS VARCHAR(14)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret VARCHAR(14);
     SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;


-- 이전 시간을 계산해서 VARCHAR(14) 형태로 가져오기
DELIMITER //
 CREATE FUNCTION `priv14`(privSec BIGINT)
 RETURNS VARCHAR(14)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret VARCHAR(14);
     SELECT DATE_FORMAT(DATE_ADD(now(), INTERVAL -privSec SECOND), '%Y%m%d%H%i%s') INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;

DELIMITER //
 CREATE FUNCTION `priv14_2`(t VARCHAR(14),privSec BIGINT)
 RETURNS VARCHAR(14)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret VARCHAR(14);
     SELECT DATE_FORMAT(DATE_ADD(TIME_FORMAT(t, '%Y%m%d%H%i%s'), INTERVAL -privSec SECOND), '%Y%m%d%H%i%s') INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;


-- 미래 시간을 계산해서 VARCHAR(14) 형태로 가져오기
DELIMITER //
 CREATE FUNCTION `next14`(nextSec BIGINT)
 RETURNS VARCHAR(14)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret VARCHAR(14);
     SELECT DATE_FORMAT(DATE_ADD(now(), INTERVAL nextSec SECOND), '%Y%m%d%H%i%s') INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;

-- VARCHAR(8) 또는 (14)형태의 시간 값을 형태에 맞게 출력
DELIMITER //
 CREATE FUNCTION `str_time`(timeStr VARCHAR(14), formatType INT)
 RETURNS VARCHAR(20)
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret VARCHAR(20);
     SELECT 
     	CASE
     		WHEN formatType = 8
     		THEN CONCAT(SUBSTR(timeStr,1,4),'-',SUBSTR(timeStr,5,2),'-',SUBSTR(timeStr,7,2))
     		WHEN formatType = 12
     		THEN CONCAT(SUBSTR(timeStr,1,4),'-',SUBSTR(timeStr,5,2),'-',SUBSTR(timeStr,7,2),
     				' ',SUBSTR(timeStr,9,2),':',SUBSTR(timeStr,11,2))
     		WHEN formatType = 14
     		THEN CONCAT(SUBSTR(timeStr,1,4),'-',SUBSTR(timeStr,5,2),'-',SUBSTR(timeStr,7,2),
     				' ',SUBSTR(timeStr,9,2),':',SUBSTR(timeStr,11,2),':',SUBSTR(timeStr,13,2))
     	END
     INTO ret
     FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;

 -- 시퀀스 값 가져오기 예제
-- select nextval('user_seq') from dual;

 
-- 함수 dhs.DEC_FILE 구조 내보내기
DROP FUNCTION IF EXISTS `DEC_FILE`;
DELIMITER //
CREATE  FUNCTION `DEC_FILE`(fileNm LONGTEXT, fileRaw LONGBLOB, k LONGTEXT) RETURNS longblob
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret LONGBLOB;
     SELECT IF(fileNm IS NULL OR LENGTH(fileNm) = 0, NULL, AES_DECRYPT(UNHEX(fileRaw), k)) INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;

-- 함수 dhs.DEC_MSG 구조 내보내기
DROP FUNCTION IF EXISTS `DEC_MSG`;
DELIMITER //
CREATE  FUNCTION `DEC_MSG`(msg LONGTEXT, k LONGTEXT) RETURNS longtext CHARSET utf8
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret LONGTEXT;
     SELECT IF(msg IS NULL OR LENGTH(msg) = 0, msg, AES_DECRYPT(UNHEX(msg), k)) INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;


-- 함수 dhs.ENC_FILE 구조 내보내기
DROP FUNCTION IF EXISTS `ENC_FILE`;
DELIMITER //
CREATE  FUNCTION `ENC_FILE`(fileNm LONGTEXT, fileRaw LONGBLOB, k LONGTEXT) RETURNS longblob
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret LONGBLOB;
     SELECT IF(fileNm IS NULL OR LENGTH(fileNm) = 0, NULL, HEX(AES_ENCRYPT(fileRaw, k))) INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;

-- 함수 dhs.ENC_MSG 구조 내보내기
DROP FUNCTION IF EXISTS `ENC_MSG`;
DELIMITER //
CREATE  FUNCTION `ENC_MSG`(msg LONGTEXT, k LONGTEXT) RETURNS longtext CHARSET utf8
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret LONGTEXT;
     SELECT IF(msg IS NULL OR LENGTH(msg) = 0, msg, HEX(AES_ENCRYPT(msg, k))) INTO ret FROM DUAL;
     RETURN ret;
 END//
DELIMITER ;


-- 그룹 시퀀스 생성
-- call create_sequence('seq');
