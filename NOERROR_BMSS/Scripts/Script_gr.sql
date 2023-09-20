SELECT *
FROM BOOK_GENRE bg ;
SELECT *
FROM BOOK_STATUSCODE bs ;
SELECT *
FROM BOOKINFO b ;
SELECT *
FROM BOOK_STATUS bs ;
SELECT *
FROM BOOK_BORROW bb ;
SELECT *
FROM BOOK_RESERVE br ;
SELECT *
FROM BOOK_USERINFO bu ;
SELECT *
FROM BOOK_SOCIALINFO bs ;

SELECT bs.BOOK_SEQ, USER_ID, STATUS_TITLE, BORROW_STATUS 
FROM BOOK_BORROW bb RIGHT JOIN BOOK_STATUS bs 
ON bs.BOOK_SEQ = BB.BOOK_SEQ
ORDER BY BOOK_SEQ ;
ORDER BY USER_ID, BOOK_SEQ 

--도서등록(크롤링)
UPDATE BOOKINFO 
SET CONTENT='', INTRO='', REVIEW='', AUTHORINFO=''
WHERE BOOK_CODE=0;

--도서상태 도서등록
INSERT INTO BOOK_STATUS
(BOOK_SEQ, STATUS_TITLE, STATUS_CODE, BOOK_CODE)
VALUES(BOOK_SEQ.NEXTVAL, '', 'A' , 0);

--크롤링 후 상태 변경
--UPDATE BOOK_STATUS
--	SET STATUS_CODE='A'
--	WHERE BOOK_CODE='2';


--장르수정
UPDATE BOOKINFO
SET GENRE_CODE=500
WHERE BOOK_CODE=8;


--도서조회(장르별 전체조회) --회원
SELECT GENRE_NAME, THUMBNAIL , BOOK_CODE
FROM (
		SELECT GENRE_CODE, GENRE_NAME, ISBN, TITLE, AUTHOR, PUBLISHER, PUBLISH_DATE, THUMBNAIL, BOOK_CODE
		FROM BOOKINFO b JOIN BOOK_GENRE bg 
		USING (GENRE_CODE)
	)
ORDER BY GENRE_CODE, PUBLISH_DATE DESC ;

-----
SELECT GENRE_NAME, THUMBNAIL , AUTHOR, TITLE, PUBLISHER
	FROM (
			SELECT GENRE_CODE, GENRE_NAME, ISBN, TITLE, AUTHOR, PUBLISHER, PUBLISH_DATE, THUMBNAIL
			FROM BOOKINFO b JOIN BOOK_GENRE bg 
			USING (GENRE_CODE)
		)
	WHERE GENRE_CODE = '400'
	ORDER BY PUBLISH_DATE DESC; 


--도서조회(장르별 전체조회) --관리자
SELECT BOOK_CODE, GENRE_CODE, GENRE_NAME, ISBN, TITLE, AUTHOR, PUBLISHER, PUBLISH_DATE, THUMBNAIL
FROM BOOKINFO b 
JOIN BOOK_GENRE bg USING (GENRE_CODE)
JOIN BOOK_STATUS bs USING (BOOK_CODE)
ORDER BY BOOK_CODE, GENRE_CODE ;

--도서 상세조회
SELECT BOOK_CODE, BOOK_SEQ, STATUS_CODE,THUMBNAIL,
ISBN, TITLE, AUTHOR, GENRE_NAME, GENRE_CODE, PUBLISHER, TO_CHAR(PUBLISH_DATE,'YYYY-MM-DD') AS PUBLISH_DATE , 
CONTENT, INTRO, REVIEW, AUTHORINFO,
BORROW_STATUS, RETURN_DATE, RESERVE_STATUS
FROM  BOOK_STATUS bs
JOIN BOOKINFO b  USING (BOOK_CODE)
JOIN BOOK_GENRE bg USING (GENRE_CODE)
LEFT JOIN BOOK_BORROW bb USING (BOOK_SEQ)
LEFT JOIN BOOK_RESERVE br USING (BOOK_SEQ)
WHERE BOOK_CODE='1'
ORDER BY BOOK_SEQ ;

-------------------
--책상세
SELECT BOOK_CODE, ISBN, TITLE, AUTHOR, GENRE_NAME, PUBLISHER, PUBLISH_DATE, THUMBNAIL, CONTENT, INTRO, REVIEW, AUTHORINFO
FROM BOOKINFO JOIN BOOK_GENRE bg 
USING (GENRE_CODE)
WHERE BOOK_CODE='1';

-- 책이 여러권
SELECT BOOK_SEQ , STATUS_CODE, BOOK_CODE  
	FROM BOOK_STATUS bs ;

-- 대출
SELECT BORROW_SEQ , RETURN_DATE , BORROW_STATUS , BOOK_SEQ 
	FROM BOOK_BORROW bb ;

-- 예약
SELECT RESERVE_SEQ , RESERVE_STATUS , BOOK_SEQ 
	FROM BOOK_RESERVE br 

SELECT bi.BOOK_CODE, ISBN, TITLE, AUTHOR, GENRE_NAME, PUBLISHER, PUBLISH_DATE, THUMBNAIL, CONTENT, INTRO, REVIEW, AUTHORINFO,
     STATUS_CODE,
	BORROW_SEQ 대출정보, RETURN_DATE , BORROW_STATUS,
	RESERVE_SEQ 예약정보,  RESERVE_STATUS
FROM BOOKINFO bi JOIN BOOK_GENRE bg 
	USING (GENRE_CODE) 
			  JOIN BOOK_STATUS bs
	ON bi.BOOK_CODE  = bs.BOOK_CODE 
			  LEFT JOIN  BOOK_BORROW bb
	ON bs.BOOK_SEQ = bb.BOOK_SEQ 
			  LEFT JOIN  BOOK_RESERVE br
	ON bs.BOOK_SEQ = br.BOOK_SEQ 
WHERE bi.BOOK_CODE ='1';
	
	

	

	
--도서 상태변경(C:분실 D:파손)
SELECT *
FROM BOOK_STATUS bs 

UPDATE BOOK_STATUS
SET STATUS_CODE='D'
WHERE BOOK_SEQ=1;

--희망도서신청
--(SELECT USER_ID,USER_NAME, USER_PHONE
--FROM(
--	SELECT SOCIAL_ID AS USER_ID, SOCIAL_NAME AS USER_NAME, SOCIAL_PHONE AS USER_PHONE, 'SOCIAL' AS GUBUN
--		FROM BOOK_SOCIALINFO bs
--	UNION
--	SELECT USER_ID , USER_NAME, USER_PHONE, 'USER'
--		FROM BOOK_USERINFO bu 
--	));

--희망도서신청 게시판
--조회(관리자의 전체 회원조회)
SELECT HO_SEQ, HO_TITLE, HO_AUTHOR, HO_PUBLISHER, HO_REGDATE, USER_ID
FROM HOPE_BOARD
JOIN BOOK_USERINFO bu USING (USER_ID );

--회원의 자신의 신청 조회
SELECT HO_SEQ, HO_TITLE, HO_AUTHOR, HO_PUBLISHER, HO_REGDATE
FROM HOPE_BOARD
JOIN BOOK_USERINFO bu USING (USER_ID );
WHERE USER_ID = '2';

--답변 조회(관리자)
SELECT hb.HO_SEQ, HO_TITLE, HO_AUTHOR, HO_PUBLISHER, USER_ID, HO_REGDATE, RH_SEQ ,HO_STATUS ,REASON 
FROM REHOPE_BOARD rb JOIN HOPE_BOARD hb 
ON rb.HO_SEQ =hb.HO_SEQ ;

--답변 조회(회원)
SELECT hb.HO_SEQ, HO_TITLE, HO_AUTHOR, HO_PUBLISHER, HO_REGDATE, RH_SEQ ,HO_STATUS ,REASON 
FROM REHOPE_BOARD rb JOIN HOPE_BOARD hb 
ON rb.HO_SEQ =hb.HO_SEQ
WHERE USER_ID = '2';

--회원의 신청
INSERT INTO HOPE_BOARD
(HO_SEQ, HO_TITLE, HO_AUTHOR, HO_PUBLISHER, HO_REGDATE, USER_ID)
VALUES(HO_SEQ.NEXTVAL, '쿼리테스트', '이니', '참고', SYSDATE , 3);

--답변 등록
INSERT INTO REHOPE_BOARD
(RH_SEQ, HO_SEQ, HO_STATUS, REASON)
VALUES(RH_SEQ.NEXTVAL, 3, 'B', '이미 있는책 ');

--도서 상태 변경


--회원의 신청취소(게시글삭제) ----관리자의 답변이 없을때만?
DELETE FROM HOPE_BOARD
WHERE HO_SEQ=3;

----------------------
--DROP SEQUENCE BORROW_SEQ;
--CREATE SEQUENCE BORROW_SEQ START WITH 29 INCREMENT BY 1;

SELECT bs.BOOK_SEQ, USER_ID, STATUS_TITLE, BORROW_STATUS 
FROM BOOK_BORROW bb RIGHT JOIN BOOK_STATUS bs 
ON bs.BOOK_SEQ = BB.BOOK_SEQ
--ORDER BY BOOK_SEQ ;
ORDER BY USER_ID, BOOK_SEQ ;

SELECT bs.BOOK_SEQ, bb.USER_ID, bs.STATUS_TITLE, bb.BORROW_STATUS, bs.STATUS_CODE
FROM BOOK_BORROW bb
RIGHT JOIN BOOK_STATUS bs ON bs.BOOK_SEQ = bb.BOOK_SEQ
WHERE bs.STATUS_CODE = 'A'
ORDER BY bs.BOOK_SEQ;


SELECT bs.BOOK_SEQ, bs.STATUS_TITLE , bs.STATUS_CODE ,
		bb.START_DATE, bb.RETURN_DATE, bb.BORROW_STATUS , bb.RENEW, bb.USER_ID, 
		br.USER_ID AS RESERVE_USER_ID, br.RESERVE_STATUS ,br.RESERVE_DATE
FROM BOOK_STATUS bs LEFT OUTER JOIN BOOK_BORROW bb
ON BS.BOOK_SEQ =BB.BOOK_SEQ 
LEFT OUTER JOIN BOOK_RESERVE br 
ON BS.BOOK_SEQ =br.BOOK_SEQ ;


--대출신청(기존 목록에 없으면)
INSERT INTO BOOK_BORROW
(BORROW_SEQ, BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, BORROW_STATUS , USER_ID, BOOK_SEQ)
VALUES(BORROW_SEQ.NEXTVAL, '희망의 끈', SYSDATE , SYSDATE+14, 'N' , 'Y' , 10, 58);

INSERT INTO BOOK_BORROW
(BORROW_SEQ, BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, borrow_status, USER_ID, BOOK_SEQ)
VALUES(BORROW_SEQ.NEXTVAL, '구멍여행', TO_DATE('2023-09-09', 'YYYY-MM-DD') , TO_DATE('2023-09-11', 'YYYY-MM-DD'), 'Y' , 'N' , 
10, 30);

------조건

--연체회원여부 확인(이 경우 대출 불가)
SELECT MAX(PENALTY_DATE) PENALTY_DATE
FROM BOOK_BORROW bb 
	 JOIN BOOK_USERINFO bu ON bb.USER_ID = bu.USER_ID
WHERE bu.USER_ID ='15'
;

--예약, 대출여부 확인(이 경우 대출 불가)
SELECT BOOK_SEQ 
FROM BOOK_STATUS bs
LEFT JOIN BOOK_BORROW bb USING(BOOK_SEQ)
LEFT JOIN BOOK_RESERVE br USING(BOOK_SEQ)
WHERE (bb.BORROW_STATUS ='Y'
OR br.RESERVE_STATUS ='Y')
OR bs.STATUS_CODE !='A';

--대출 권수
SELECT COUNT(*)
	FROM BOOK_BORROW bb 
	JOIN BOOK_USERINFO bu USING(USER_ID)
	WHERE USER_ID ='7'
	AND BORROW_STATUS ='Y'
	;
	


---------------------------
--예약대출자만 (대출신청가능)
SELECT BOOK_SEQ, br.USER_ID, RESERVE_DATE
FROM BOOK_STATUS bs
LEFT JOIN BOOK_BORROW bb USING(BOOK_SEQ)
LEFT JOIN BOOK_RESERVE br USING(BOOK_SEQ)
WHERE bb.BORROW_STATUS ='N'
AND br.RESERVE_STATUS ='Y'
AND STATUS_CODE ='A';

DELETE FROM BOOK_RESERVE
WHERE RESERVE_SEQ=0;

--SELECT 
--B.STATUS_TITLE,
--B.RETURN_DATE,
--ABS(TRUNC(RETURN_DATE) - TRUNC(CURRENT_TIMESTAMP)) AS ABS_DATE
--FROM(
--SELECT * FROM ( 
--	SELECT * FROM BOOK_STATUS bs
--	LEFT JOIN BOOK_BORROW bb 
--	ON bs.STATUS_TITLE = bb.BORROW_TITLE
--	) 
--)B
--ORDER BY B.STATUS_TITLE, ABS_DATE 
--;
--
--WITH RankedResults AS (
--  SELECT
--    bs.STATUS_TITLE,
--    bb.RETURN_DATE,
--    ABS(bb.RETURN_DATE - CURRENT_TIMESTAMP) AS ABS_DIFF,
--    ROW_NUMBER() OVER(PARTITION BY bs.STATUS_TITLE ORDER BY ABS(bb.RETURN_DATE - CURRENT_TIMESTAMP)) AS rn
--  FROM
--    BOOK_STATUS bs
--    LEFT JOIN BOOK_BORROW bb ON bs.STATUS_TITLE = bb.BORROW_TITLE
--)
--SELECT
--  STATUS_TITLE,
--  RETURN_DATE
--FROM
--  RankedResults
--WHERE
--  rn = 1;
----------------------------
SELECT *
FROM 
(SELECT bs.BOOK_SEQ, bs.STATUS_TITLE , bs.STATUS_CODE ,
		bb.START_DATE, bb.RETURN_DATE, bb.BORROW_STATUS , bb.RENEW, bb.USER_ID, 
		br.USER_ID AS RESERVE_USER_ID, br.RESERVE_STATUS ,br.RESERVE_DATE
FROM BOOK_STATUS bs LEFT OUTER JOIN BOOK_BORROW bb
ON BS.BOOK_SEQ =BB.BOOK_SEQ 
LEFT OUTER JOIN BOOK_RESERVE br 
ON BS.BOOK_SEQ =br.BOOK_SEQ 
)
WHERE BORROW_STATUS = 'Y' AND RESERVE_STATUS = 'Y';



--대출현황조회(관리자의 전체회원)
SELECT USER_ID ,BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, BORROW_STATUS , BOOK_SEQ
FROM BOOK_BORROW
JOIN BOOK_USERINFO bu 
USING(USER_ID)
WHERE RETURN_DATE >SYSDATE 
AND BORROW_STATUS ='Y'
ORDER BY USER_ID, BORROW_SEQ ;

--대출현황조회(관리자의 특정회원)
SELECT BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, BORROW_STATUS, USER_ID, BOOK_SEQ
FROM BOOK_BORROW
JOIN BOOK_USERINFO bu 
USING(USER_ID)
WHERE RETURN_DATE >SYSDATE 
AND BORROW_STATUS ='Y'
AND USER_ID ='2'
ORDER BY BORROW_SEQ ;

--대출내역조회(관리자의 전체회원)
SELECT BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, BORROW_STATUS, USER_ID, BOOK_SEQ
FROM BOOK_BORROW
JOIN BOOK_USERINFO bu 
USING(USER_ID)
ORDER BY BORROW_SEQ ;

--대출내역조회(관리자의 특정회원)
SELECT BORROW_TITLE, START_DATE, RETURN_DATE, RENEW, BORROW_STATUS, USER_ID, BOOK_SEQ
FROM BOOK_BORROW
JOIN BOOK_USERINFO bu 
USING(USER_ID)
WHERE USER_ID ='2'
ORDER BY BORROW_SEQ ;

--대출현황조회(회원)
SELECT BORROW_TITLE, AUTHOR, PUBLISHER, GENRE_NAME, START_DATE, RETURN_DATE, RENEW
FROM BOOK_BORROW bb  
JOIN BOOK_STATUS bs ON bb.BOOK_SEQ=bs.BOOK_SEQ  
JOIN BOOKINFO b ON b.BOOK_CODE =bs.BOOK_CODE 
JOIN BOOK_GENRE bg ON b.GENRE_CODE =bg.GENRE_CODE 
JOIN BOOK_USERINFO bu 
USING(USER_ID)
WHERE RETURN_DATE >SYSDATE 
AND BORROW_STATUS ='Y'
AND USER_ID ='7'
ORDER BY BORROW_SEQ ;

--대출내역조회(회원)
SELECT BORROW_TITLE, AUTHOR, PUBLISHER, GENRE_NAME, START_DATE, RETURN_DATE, BORROW_STATUS 
FROM BOOK_BORROW bb  
JOIN BOOK_STATUS bs ON bb.BOOK_SEQ=bs.BOOK_SEQ  
JOIN BOOKINFO b ON b.BOOK_CODE =bs.BOOK_CODE 
JOIN BOOK_GENRE bg ON b.GENRE_CODE =bg.GENRE_CODE
JOIN BOOK_USERINFO bu 
USING(USER_ID)
WHERE USER_ID ='2'
ORDER BY BORROW_SEQ ;



--반납
UPDATE BOOK_BORROW
SET RETURN_DATE= SYSDATE, BORROW_STATUS='N'
WHERE BOOK_SEQ=50;


--연장신청

--연장   ---?안됨
--UPDATE BOOK_BORROW
--SET RETURN_DATE = RETURN_DATE + 7, RENEW = 'Y'
--WHERE BOOK_SEQ = 8
-- AND BORROW_STATUS ='Y' AND RENEW ='N'
--AND BOOK_SEQ IN (
--    SELECT bb.BOOK_SEQ
--    FROM BOOK_BORROW bb
--    LEFT OUTER JOIN BOOK_RESERVE br ON br.BOOK_SEQ = bb.BOOK_SEQ
--    WHERE RESERVE_STATUS = 'N' OR RESERVE_STATUS IS NULL
--);


-- 대출 연장
-- 1) 해당 도서가 예약이 있는지 확인
-- 2) 연장이 되어 있는지
-- 3) 7일 미만일때

-- 책정보
SELECT *
	FROM BOOKINFO b ;

-- 대출정보
SELECT *
	FROM BOOK_BORROW bb 
	WHERE BOOK_SEQ ='46';

-- 예약정보 
SELECT *
	FROM BOOK_RESERVE br ;

--연장
UPDATE BOOK_BORROW
SET RETURN_DATE = RETURN_DATE + 7, RENEW = 'Y'
WHERE BOOK_SEQ = (SELECT BOOK_SEQ
					FROM BOOK_BORROW bb LEFT JOIN BOOK_RESERVE br 
					USING(BOOK_SEQ)
					WHERE (br.RESERVE_STATUS IS NULL OR br.RESERVE_STATUS ='N') AND RENEW = 'N'
					AND BORROW_STATUS ='Y'
					AND RETURN_DATE - SYSDATE < 7
					AND RETURN_DATE - SYSDATE > 0
					AND BOOK_SEQ = '6');


--SELECT *
--FROM BOOK_BORROW bb 


--예약신청
INSERT INTO BOOK_RESERVE
(RESERVE_SEQ, RESERVE_TITLE, RESERVE_DATE, RESERVE_STATUS, USER_ID, BOOK_SEQ)
VALUES(RESERVE_SEQ.NEXTVAL, '희망(지혜의 달인 탈무드)', TO_DATE('2023-09-09', 'YYYY-MM-DD'), 'Y' , 10, 52);

-------------------------조건

--연체회원여부 확인(이 경우 대출 불가)
SELECT MAX(PENALTY_DATE) PENALTY_DATE
FROM BOOK_BORROW bb 
	 JOIN BOOK_USERINFO bu ON bb.USER_ID = bu.USER_ID
WHERE bu.USER_ID ='15'
;
SELECT MAX(PENALTY_DATE) PENALTY_DATE
FROM BOOK_USERINFO bu
	 JOIN BOOK_BORROW bb  ON bb.USER_ID = bu.USER_ID
WHERE bu.USER_ID ='15'
;

--예약, 대출여부 확인(이 경우 예약 불가)
SELECT *
FROM BOOK_STATUS bs
LEFT JOIN BOOK_BORROW bb USING(BOOK_SEQ)
LEFT JOIN BOOK_RESERVE br USING(BOOK_SEQ)
WHERE ((bb.BORROW_STATUS ='N' OR bb.BORROW_STATUS IS NULL)
OR br.RESERVE_STATUS ='Y')
OR bs.STATUS_CODE !='A';

--예약, 대출여부 확인

SELECT BOOK_SEQ 
FROM BOOK_STATUS bs  
LEFT JOIN BOOK_BORROW bb USING(BOOK_SEQ)
LEFT JOIN BOOK_RESERVE br USING(BOOK_SEQ)
WHERE ( bb.BORROW_STATUS ='Y')
AND (br.RESERVE_STATUS IS NULL OR br.RESERVE_STATUS ='N')
AND bs.STATUS_CODE='A';

------


--예약 권수
SELECT COUNT(*)
	FROM BOOK_RESERVE br JOIN BOOK_USERINFO bu USING(USER_ID)
	WHERE  br.USER_ID ='2'
	AND RESERVE_STATUS = 'Y'
	



--예약취소
UPDATE BOOK_RESERVE
SET RESERVE_STATUS='N' 
WHERE BOOK_SEQ= (SELECT BOOK_SEQ
				FROM BOOK_RESERVE br
				JOIN BOOK_USERINFO bu USING(USER_ID)
				WHERE USER_ID = '10'
				AND BOOK_SEQ='31')
AND RESERVE_STATUS ='Y';


--스케줄러 자동 취소

UPDATE BOOK_RESERVE
SET RESERVE_STATUS='N' 
WHERE BOOK_SEQ =(SELECT br.BOOK_SEQ 
				FROM BOOK_RESERVE br JOIN BOOK_BORROW bb ON br.BOOK_SEQ =bb.BOOK_SEQ 
				WHERE RETURN_DATE+2 <SYSDATE
				AND RESERVE_STATUS='Y')	

SELECT *
FROM BOOK_RESERVE br 
		
--SELECT *
--FROM  BOOK_RESERVE br 
--WHERE RESERVE_DATE + 2  < SYSDATE;

------예약취소
DELETE FROM BOOK_RESERVE
WHERE RESERVE_STATUS = 'N';

SELECT COUNT(*)
FROM BOOK_RESERVE br 


--예약현황조회(관리자의 전체회원)
SELECT bs.BOOK_SEQ , RESERVE_TITLE, AUTHOR, PUBLISHER, GENRE_NAME, RESERVE_DATE , br.USER_ID 
FROM BOOK_RESERVE br 
JOIN BOOK_STATUS bs ON br.BOOK_SEQ=bs.BOOK_SEQ  
JOIN BOOK_BORROW bb  ON bb.BOOK_SEQ =bs.BOOK_SEQ 
JOIN BOOKINFO b ON b.BOOK_CODE =bs.BOOK_CODE 
JOIN BOOK_GENRE bg ON b.GENRE_CODE =bg.GENRE_CODE 
JOIN BOOK_USERINFO bu ON br.USER_ID = bu.USER_ID 
WHERE RETURN_DATE+2 >SYSDATE
AND RESERVE_STATUS ='Y'
ORDER BY USER_ID;

--예약현황조회(회원)
SELECT RESERVE_TITLE, AUTHOR, PUBLISHER, GENRE_NAME, RESERVE_DATE
FROM BOOK_RESERVE br 
JOIN BOOK_STATUS bs ON br.BOOK_SEQ=bs.BOOK_SEQ  
JOIN BOOK_BORROW bb  ON bb.BOOK_SEQ =bs.BOOK_SEQ 
JOIN BOOKINFO b ON b.BOOK_CODE =bs.BOOK_CODE 
JOIN BOOK_GENRE bg ON b.GENRE_CODE =bg.GENRE_CODE 
JOIN BOOK_USERINFO bu ON br.USER_ID = bu.USER_ID 
WHERE RETURN_DATE >SYSDATE
AND RESERVE_STATUS ='Y'
AND br.USER_ID ='2';


SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM BOOK_BORROW bb 

SELECT TO_NUMBER(TO_DATE(SYSDATE, 'YYYY-MM-DD')-TO_DATE(RETURN_DATE, 'YYYY-MM-DD'))
FROM BOOK_BORROW bb 
WHERE BOOK_SEQ =75

SELECT TO_NUMBER(TO_DATE(SYSDATE, 'YYYY-MM-DD') - TO_DATE(SYSDATE, 'YYYY-MM-DD'))
    FROM BOOK_BORROW
    WHERE SYSDATE > RETURN_DATE AND USER_ID = '15'

--연체  
UPDATE BOOK_USERINFO
SET PENALTY_DATE = SYSDATE + 2+(
    SELECT SUM(TO_NUMBER(TRUNC(SYSDATE) - TRUNC(RETURN_DATE)))
    FROM BOOK_BORROW
    WHERE SYSDATE > RETURN_DATE AND USER_ID = '15'
)
WHERE USER_ID = '15';



--------------------
--알림

--반납일안내
SELECT *
FROM BOOK_BORROW bb 
WHERE RETURN_DATE -2 = SYSDATE
AND USER_ID = '1';

--예약자 대출


--대출기일초과 예약취소


--연체 패널티



----------------------------------------------
INSERT INTO BOOK_RESERVE
(RESERVE_SEQ, RESERVE_TITLE, RESERVE_DATE, RESERVE_STATUS, USER_ID, BOOK_SEQ)
VALUES(RESERVE_SEQ.NEXTVAL, '위화도 회군과 고려의 멸망(교과융합 삼국유사 삼국사기 74)(양장본 HardCover)', '2023-09-15', 'Y' , 5, 115);
INSERT INTO BOOK_RESERVE
(RESERVE_SEQ, RESERVE_TITLE, RESERVE_DATE, RESERVE_STATUS, USER_ID, BOOK_SEQ)
VALUES(RESERVE_SEQ.NEXTVAL, '위화도 회군과 고려의 멸망(교과융합 삼국유사 삼국사기 74)(양장본 HardCover)', '2023-09-17', 'Y' , 6, 116);
INSERT INTO BOOK_RESERVE
(RESERVE_SEQ, RESERVE_TITLE, RESERVE_DATE, RESERVE_STATUS, USER_ID, BOOK_SEQ)
VALUES(RESERVE_SEQ.NEXTVAL, '위화도 회군과 고려의 멸망(교과융합 삼국유사 삼국사기 74)(양장본 HardCover)', '2023-09-14', 'Y' , 7, 117);


