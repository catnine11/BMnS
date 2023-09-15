--도서 상세 더미
INSERT INTO BOOKINFO
(BOOK_CODE, ISBN,TITLE,AUTHOR,PRICE,THUMBNAIL,PUBLISHER,PUBLISH_DATE,GENRE_CODE)
VALUES(BOOK_CODE.NEXTVAL,1 , 'asdas','asdasd',123123,'sdsasad','sdsad',SYSDATE,400);


--재고내역 조회 SELECT --
SELECT STOCK_NUMBER,STATUS_TITLE,SELL_STATUS ,BT.BOOK_SEQ,STATUS_CODE,BOOK_CODE,BOOK_PRICE 
FROM BOOK_STOCK BT LEFT JOIN BOOK_STATUS bs ON BT.BOOK_SEQ =BS.BOOK_SEQ WHERE STATUS_CODE='B';
--재고내역 상세조회  ??후 인서트?
  SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'B' AND BT.STOCK_NUMBER = 1

--재고-> 단일 판매 가능 
UPDATE (
  SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'B' AND BT.STOCK_NUMBER = 1
) X
SET X.SELL_STATUS = 'Y';

--재고-> 다중 판매 가능 
UPDATE (
  SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'B' AND BT.STOCK_NUMBER IN(1,2,3,4)
) X
SET X.SELL_STATUS = 'Y';

--재고-> 상태 단일 변경 , 일반, 파손 ~~등등 질문하기  AND절이 WHERE 절로 왜 밖에 나가면 안되는지 
UPDATE (
  SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'B' AND BT.STOCK_NUMBER = 1
) X
SET X.STATUS_CODE = 'A';

--재고 상태 다중변경
UPDATE (
  SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'B' AND BT.STOCK_NUMBER IN(1,2,3,4)
) X
SET X.STATUS_CODE = 'A';

SELECT *FROM BOOK_STOCK bs ;

--책의 상태가 일반인 것들을 재고 목록에서 삭제 일반 변경 후 삭제 셀렉트키 사용
SELECT STOCK_NUMBER 
FROM BOOK_STOCK BT LEFT JOIN BOOK_STATUS bs ON BT.BOOK_SEQ =BS.BOOK_SEQ WHERE STATUS_CODE='A';
DELETE FROM BOOK_STOCK
WHERE STOCK_NUMBER=1;

--재고 책의 가격 변경 
UPDATE BOOK_STOCK SET BOOK_PRICE=10000 WHERE STOCK_NUMBER =2;

SELECT * FROM BOOK_USERINFO bu ;

------------------------------주문-------------------------------

--도서 주문 주문 버튼 클릭시 주문내역에 자동으로 들어감 
/*<SELECTKEY KeyProperty="order_price" order="before" >
SELECT BOOK_PRICE AS ORDER_PRICE FROM BOOK_STOCK bs WHERE STOCK_NUMBER =#{stock_number} ;
</SELECTKEY>*/
INSERT INTO BOOK_ORDER
(STOCK_NUMBER, ORDER_NUMBER, ORDER_QUANTITY, ORDER_PRICE, ORDER_DATE, PAY_STATUS, USER_ID)
VALUES(4, 1000, 1, 1, CURRENT_DATE, (1), 1);

--여러개 주문시 



--주문내역 삭제
DELETE FROM BOOK_ORDER bo WHERE STOCK_NUMBER =1;

--주문내역 조회
--도서 이름 
SELECT * FROM BOOK_ORDER bo WHERE USER_ID =1;

SELECT STOCK_NUMBER,STATUS_TITLE,SELL_STATUS ,BT.BOOK_SEQ,STATUS_CODE,BOOK_CODE,BOOK_PRICE 
FROM BOOK_STOCK BT LEFT JOIN BOOK_STATUS bs ON BT.BOOK_SEQ =BS.BOOK_SEQ WHERE STATUS_CODE='B';

--주문 주소지 조회 새창을 띄워서 주소지를 보여주자.
SELECT 
DISTINCT (USER_ADDRESS)
FROM BOOK_ORDER bo JOIN BOOK_USERINFO bu ON BO.USER_ID =BU.USER_ID ;
--주소지 변경
UPDATE BOOK_USERINFO SET USER_ADDRESS WHERE USER_ID =1;

 SELECT STOCK_NUMBER, STATUS_TITLE, SELL_STATUS, BT.BOOK_SEQ, STATUS_CODE, BOOK_CODE, BOOK_PRICE
  FROM BOOK_STOCK BT
  JOIN BOOK_STATUS bs ON BT.BOOK_SEQ = bs.BOOK_SEQ
  WHERE STATUS_CODE = 'A'



--INSERT 는 CRON을 통해 뭐엿지 ? INSERT 생각
--SELECT 재고 내역--
SELECT STOCK_NUMBER,SELL_STATUS,K.BOOK_SEQ,BOOK_PRICE,STATUS_TITLE,STATUS_CODE
FROM (
    SELECT K.STOCK_NUMBER, S.SELL_STATUS, K.BOOK_SEQ
    FROM BOOK_STOCK K
    RIGHT JOIN BOOK_STATUS S ON K.BOOK_SEQ = S.BOOK_SEQ
) X
RIGHT JOIN BOOKINFO A ON X.BOOK_SEQ = A.BOOK_CODE;



---검색----
SELECT TITLE,PUBLISHER,GENRE_NAME FROM BOOKINFO b  JOIN BOOK_GENRE bg  ON B.GENRE_CODE =BG.GENRE_CODE WHERE GENRE_NAME LIKE '종교' ;



SELECT '11초작동 -' ||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;

-----------------------------------------------------------------


--크론--

--대여일 +1~2개월이 크론을 통해서 지난 도서의 도서 상태가 재고로 업데이 트되면서 재고 테이블에 정보가 저장된다.
--이때 도서의 재고번호(pk)는 시퀀스를 통해서 1부터 들어가고 
--판매 가능여부는 N이 DEFAULT로 입력된다.관리 번호는 해당 도서와 동일한 것으로 들어간다.
 --로그인시 관리 자인 경우 (auth가 A )   재고 탭(href) 화면이 보이고  클릭 시 재고 내역 페이지로 이동한다.   
   --재고 페이지에는 테이블형태로 재고 목록이 노출되며 재고번호 도서명,가격,판매가능여부( 드롭다운)도서상태(드롭다운)
   --체크 박스 형태로  한번에 판매/도서 상태들을 변경 할 수 있다.
--도서 상태 테이블 셀렉트키 해서 찾고 그걸 재고에 insert 
--도서 상세정보 도서상태 조인   도서상태 재고 조인
--셀렉트 해서 도서 상태 변경 INSERT 진행  
-- 크론 발동 시간 설정 SELECT 를 통해서 특정 기간이 넘은 도서를 조회 그 도서의 상태를 재고로 업데이트후 재고 목록 인서트  
SELECT BOOK_CODE
ISBN,
TITLE,
AUTHOR,
GENRE_CODE,
PUBLISHER,
PRICE,
PUBLISH_DATE,
THUMBNAIL,
CONTENT,
INTRO,
REVIEW,
AUTHORINFO FROM BOOKINFO b WHERE PUBLIS;

--2달동  반납일 기준 2달동안 대출이없는 



INSERT INTO NOER.BOOK_ORDER
(STOCK_NUMBER, ORDER_NUMBER, ORDER_QUANTITY, ORDER_PRICE, ORDER_DATE, PAY_STATUS, USER_ID)
VALUES(1, 10000, 1, 1, (CURRENT_DATE), (1), 2);


SELECT * FROM BOOK_BORROW ;

SELECT * FROM BOOK_BORROW WHERE RETURN_DATE > (RETURN_DATE + NUMTODSINTERVAL(2, 'DAY'));


Oracle 데이터베이스에서 RETURN_DATE 컬럼보다 2일 이상 지난 레코드를 조회하는 쿼리는 다음과 같이 작성할 수 있습니다:

--
SELECT * FROM BOOK_BORROW WHERE RETURN_DATE <(RETURN_DATE  +2);
SELECT X.BOOK_SEQ ,X.STATUS_TITLE ,X.STATUS_CODE FROM(
SELECT A.BOOK_SEQ ,STATUS_TITLE ,STATUS_CODE FROM BOOK_BORROW A JOIN BOOK_STATUS B ON A.BORROW_SEQ =B.BOOK_SEQ  WHERE RETURN_DATE <(CURRENT_DATE-2 );
)X  WHERE X.STATUS_CODE ='A';

SELECT X.BOOK_SEQ, X.STATUS_TITLE, X.STATUS_CODE
FROM (
    SELECT A.BOOK_SEQ, B.STATUS_TITLE, B.STATUS_CODE,RETURN_DATE
    FROM BOOK_BORROW A
    JOIN BOOK_STATUS B ON A.BORROW_SEQ = B.BOOK_SEQ
    WHERE BORROW_STATUS='N'AND A.RETURN_DATE <= (CURRENT_DATE - 2)
) X
WHERE X.STATUS_CODE = 'A'AND != SELECT COUNT(STATUS_TITLE)
WHERE

--크론 쿼리
--셀렉트 키를 사용해서 현재 기준으로 상태가 일반이면서 몇일 이상 지난 것들의 BOOKSEQ를 조회 그후 BOOK_SEQ 를 사용해서 UPDATE를 통해 
--STATUS_CODE 를B로 변경한 후에 INSERT를 통해서 재고 목록으로 등록 
--셀렉트 키를 사용해서 현재 기준으로 상태가 일반이면서 몇일 이상 지난 것들의 BOOKSEQ를 조회 
--(단위테스트 완료)
 SELECT  X.BOOK_SEQ FROM
(SELECT  B.BOOK_SEQ, B.STATUS_TITLE, B.STATUS_CODE, A.RETURN_DATE, B.BOOK_CODE,
           COUNT(*) OVER (PARTITION BY B.BOOK_CODE) AS BOOK_COUNT
    FROM BOOK_BORROW A
    RIGHT JOIN BOOK_STATUS B ON A.BOOK_SEQ = B.BOOK_SEQ
    WHERE (RETURN_DATE <= TO_DATE('20230913' || '000000', 'YYYYMMDDHH24MISS') - 1
           OR RETURN_DATE IS NULL)
           AND STATUS_CODE = 'A') X
WHERE X.BOOK_COUNT > 1
  
SELECT * FROM BOOK_STOCK;
  SELECT * FROM BOOK_STATUS bs WHERE STATUS_CODE= 'B';
  

--BOOK_SEQ 를 사용해서 UPDATE를 통해 STATUS_CODE 를B로 변경 (단위테스트 완료) 
UPDATE BOOK_STATUS SET STATUS CODE='B' WHERE BOOK_SEQ IN('2','24','48','49');
UPDATE BOOK_STATUS SET STATUS_CODE='B' WHERE BOOK_SEQ IN(24);

SELECT * FROM BOOK_STATUS bs WHERE BOOK_SEQ =24;
--셀렉트 키로 생성한 SEQ를 받아오고 재고 목록에 INSERT
INSERT INTO BOOK_STOCK
(STOCK_NUMBER, SELL_STATUS, BOOK_SEQ, BOOK_PRICE)
VALUES(STOCK_NUMBER.NEXTVAL, ('N'), 24, (0));

SELECT * FROM BOOK_STOCK bs WHERE BOOK_SEQ =24;