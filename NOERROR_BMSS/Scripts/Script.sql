CREATE OR REPLACE TRIGGER SOCIALINFO_INSERT_TRIGGER
AFTER INSERT ON BOOK_SOCIALINFO
FOR EACH ROW
BEGIN
    INSERT INTO BOOK_USERINFO (USER_ID, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_PHONE, GUBUN, USER_JOINDATE)
    VALUES (USER_SEQ_SEQUENCE.CURRVAL, :NEW.SOCIAL_NAME, :NEW.SOCIAL_EMAIL, 'NO PASSWORD', :NEW.SOCIAL_PHONE, :NEW.SOCIAL_GUBUN, SYSDATE);
END;


--회원가입
INSERT INTO BOOK_USERINFO(USER_ID, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_BIRTH, USER_PHONE, USER_ADDRESS, USER_AUTH, USER_DELFLAG, GUBUN, USER_JOINDATE,  PENALTY_DATE)
VALUES (USER_SEQ_SEQUENCE.NEXTVAL, '정심환', 'jsh@naver.com', '123123a!', '1997-04-06', '010-1234-5678', '서울특별시 금천구 가산동 KM타워2층 구디아카데미', 'U', 'N','nomal','2023-09-11','');

INSERT INTO BOOK_SOCIALINFO(SOCIAL_ID, SOCIAL_NAME, SOCIAL_EMAIL, SOCIAL_PHONE, SOCIAL_TOKEN, SOCIAL_AUTH, SOCIAL_GUBUN)
VALUES(USER_SEQ_SEQUENCE.CURRVAL, '김홍삼', 'ekgns20@gmail.com', '010-9479-2650', '123123123123123asdwq2dqd34', 'U', 'google');

-- 조회 쿼리
-- BOOK_USERINFO에서 일반회원 정보 조회
SELECT * FROM BOOK_USERINFO WHERE USER_ID = 4 AND GUBUN = 'nomal';

-- BOOK_USERINFO에서 소셜회원 정보 조회
SELECT * FROM BOOK_USERINFO WHERE USER_ID = 10 AND GUBUN IN ('kakao','naver','google');

SELECT bs.*
FROM BOOK_SOCIALINFO bs 
JOIN BOOK_USERINFO bu 
ON bs.SOCIAL_ID = bu.USER_ID 
WHERE bu.USER_ID = 10;


----개발중 테스트하고있음--
INSERT INTO NOER.BOOK_SOCIALINFO
(SOCIAL_ID, SOCIAL_NAME, SOCIAL_EMAIL, SOCIAL_PHONE, SOCIAL_TOKEN, SOCIAL_AUTH, SOCIAL_GUBUN)
VALUES(USER_SEQ_SEQUENCE.NEXTVAL, 'KDH' , 'cobynine2@nate.com', 'NO PHONE', 'pGcvRxIGHTnUzzITedgeOqHiwFztiU5XR6lUhMnqCisNHwAAAYqWib8Z', 'U', 'kakao' );


SELECT   USER_ID, USER_NAME ,RPAD('*', 4, '*') || SUBSTR(USER_EMAIL , 5) AS USER_EMAIL ,USER_AUTH ,USER_DELFLAG ,USER_ADDRESS,SUBSTR(USER_PHONE , 1, LENGTH(USER_PHONE)-6) || RPAD('*', 6, '*')  AS USER_PHONE,USER_BIRTH,PENALTY_DATE,TO_CHAR(USER_JOINDATE , 'YYYY-MM-DD') AS USER_JOINDATE,GUBUN 
		FROM BOOK_USERINFO u 
		
SELECT bu.*, bb.BORROW_STATUS ,br.RESERVE_STATUS 
	FROM BOOK_USERINFO bu 
	JOIN BOOK_RESERVE br 
	ON bu.USER_ID =br.USER_ID 
	JOIN BOOK_BORROW bb 
	ON bu.USER_ID = bb.USER_ID 
WHERE bu.USER_ID ='162' AND bb.BORROW_STATUS = 'Y' AND br.RESERVE_STATUS = 'Y'

--주문조회
SELECT  bu.*,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY,bp.PAY_TITLE
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 

--회원결제전체조회
SELECT bu.*,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.* 
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bu.USER_ID  =2	
	
--결제상세조회
SELECT bu.USER_ID ,bu.USER_NAME ,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.* 
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bp2.PAY_SEQ =78


--결제시 상태변경
UPDATE BOOK_ORDER  
SET PAY_STATUS = '2'
WHERE USER_ID ='2';

--관리자 결제승인 상태변경
UPDATE BOOK_ORDER 
SET PAY_STATUS ='3'
WHERE USER_ID ='2'

--관리자 회원의결제대기 조회
SELECT bu.USER_ID ,bu.USER_NAME ,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.* 
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bp.PAY_STATUS =2
	
--방금결제내역조회
	SELECT bu.USER_ID ,bu.USER_NAME ,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.* 
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bu.USER_ID ='2' AND PAY_SEQ = 1
	
	SELECT MAX(PAY_SEQ)
		FROM BOOK_PAY
	
	SELECT PAY_TITLE
		FROM BOOK_PAYSTATUS
	WHERE PAY_STATUS = 1
	
-- 아임포트고유번호찾기
	SELECT IMP_UID 
		FROM BOOK_PAY bp
	WHERE PAY_SEQ =79
	
--insertAskBoard
	INSERT INTO NOER.ASK_BOARD
(ASK_SEQ, ASK_TITLE, ASK_CONTENTS, ASK_REGDATE, USER_ID, DELFLAG,USER_NAME)
VALUES(ASK_SEQ.NEXTVAL, '3', '2', SYSDATE , 2, 'N' ,(SELECT USER_NAME FROM BOOK_USERINFO bu WHERE bu.USER_ID=2));
	
	
SELECT ASK_SEQ ,ASK_TITLE ,ASK_CONTENTS, ASK_REGDATE ,DELFLAG ,USER_ID ,USER_NAME 
	FROM ASK_BOARD  
WHERE ASK_SEQ =23
	
	
	SELECT MAX(ASK_SEQ) FROM ASK_BOARD
	
	UPDATE ASK_BOARD 
			SET ASK_TITLE = 123123 , ASK_CONTENTS=123123
			WHERE ASK_SEQ = 2
	
SELECT bp.PAY_TITLE
FROM BOOK_PAYSTATUS bp 
JOIN BOOK_PAY bp2 ON bp.PAY_STATUS = bp2.PAY_STATUS 
WHERE bp2.PAY_SEQ = 77
	
	
	SELECT bu.*,bp2.PAY_SEQ,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.PAY_MONEY,bp2.PAY_METHOD,bp2.PAY_TIME
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bp2.PAY_SEQ =80
	
	
	SELECT * FROM (
    SELECT ROWNUM AS rnum, 
           ab.ASK_SEQ, ab.ASK_TITLE, ab.ASK_CONTENTS, ab.ASK_REGDATE, 
           ab.DELFLAG, ab.USER_ID, ab.USER_NAME, bu.USER_ID AS BU_USER_ID,
           bu.USER_NAME AS BU_USER_NAME, bu.USER_email
    FROM ASK_BOARD ab
    JOIN BOOK_USERINFO bu ON ab.USER_ID = bu.USER_ID  
    WHERE ab.DELFLAG = 'N'
    ORDER BY ab.ASK_SEQ DESC
)
WHERE rnum >= 1 AND rnum <= 20;
	
	
	SELECT * FROM (
    SELECT 
        bu.*, b.TITLE, bo.ORDER_PRICE, bo.ORDER_QUANTITY, bp.PAY_TITLE, bp2.PAY_SEQ, bp2.PAY_MONEY, bp2.PAY_TIME, bp2.PAY_METHOD, bp2.PAY_STATUS, ROW_NUMBER() OVER (ORDER BY bp2.PAY_SEQ DESC) AS rm
    FROM 
        BOOK_USERINFO bu 
        JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
        JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
        JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
        JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
        JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
        JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
    WHERE 
        bu.USER_ID = 2
)
WHERE rm  BETWEEN 1 AND 5
	
	
	SELECT COUNT(*) 
		FROM BOOK_USERINFO bu 
        JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
        JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
        JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
        JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
        JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
        JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
		WHERE bu.USER_ID = 2
	
	
	SELECT bu.*,bp2.PAY_SEQ,b.TITLE ,bo.ORDER_PRICE,bo.ORDER_QUANTITY  ,bp.PAY_TITLE , bp2.PAY_MONEY,bp2.PAY_METHOD,bp2.PAY_TIME,b.THUMBNAIL 
FROM BOOK_USERINFO bu 
	JOIN BOOK_ORDER bo ON bu.USER_ID = bo.USER_ID 
	JOIN BOOK_STOCK bs ON bo.STOCK_NUMBER = bs.STOCK_NUMBER 
	JOIN BOOK_STATUS bs2 ON bs2.BOOK_SEQ = bs.BOOK_SEQ 
	JOIN BOOKINFO b ON b.BOOK_CODE = bs2.BOOK_CODE 
	JOIN BOOK_PAYSTATUS bp ON bp.PAY_STATUS = bo.PAY_STATUS 
	JOIN BOOK_PAY bp2 ON bp2.PAY_STATUS = bp.PAY_STATUS 
WHERE bu.USER_ID =2 AND PAY_SEQ = 30;
	
	
	
	