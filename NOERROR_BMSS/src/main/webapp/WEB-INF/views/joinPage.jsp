<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
        .a {
        border: 2px solid #D9E5FF;
/*         width: 1000px; margin: 0 auto;   */
         } 




    </style>
<%@include file="header.jsp"%>
<body>
	<body>


    <div class="container a">   

        <div id="main">
            <div class="mt-5 ">
                <div class="d-flex justify-content-between">
                    <h2><i class="bi bi-people-fill"></i> 회원가입</h2>
                    <nav>
                        <ol class="breadcrumb ">
                            <li class="breadcrumb-item ">
                                <span class="badge bg-success p-2">이용약관</span></li>
                            <li class="breadcrumb-item">
                                <span class="badge bg-light p-2 text-secondary">정보입력</span></li>
                            <li class="breadcrumb-item">
                                <span class="badge bg-light p-2 text-secondary">가입완료</span></li>
                        </ol>
                    </nav>
                </div>
                <hr>
            </div>  

            <div class="px-5">
                <h3><i class="bi bi-file-text"></i>사이트 이용약관</h3>
                <small class="text-muted">회원가입을 위해서 아래 사이트 이용약관, 개인정보 확인</small>
                <hr>
            </div>       
                <div class="card card-body bg-light mx-5">
                    <form>
                        <h4>사이트 이용약관</h4>
                        <div>
                            <textarea rows="10" class="form-control">
제 1 조 (목적)

 1. 본 약관은 TEAM NOERROR가 운영하는 온라인 도서관리판매 사이트 "http://localhost:8080"에서 제공하는 서비스
 	(이하 '서비스'라 합니다)를 이용함에 있어 당사자의 권리 의무 및 책임사항을 규정하는 것을 목적으로 합니다.
 
 2. PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 본 약관을 준용합니다.
 
 제 2 조 (정의)
 
  1. '회사'라 함은, 'TEAM NOERROR'가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화등을
  	 거래할 수 있도록 설정한 가상의 영업장을 운영하는 사업자를 말하며, 아울러 'http://localhost:8080'을 통해 제공되는
  	 전자상거래 관련 서비스의 의미로도 사용합니다
  	 
  2. '이용자'라 함은, '사이트'에 접속하여 본 약관에 따라 '회사'가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
  
  3. '회원'이라 함은, '회사'에 개인정보를 제공하고 회원으로 등록한 자로서, '회사'의 서비스를 계속하여 이용할 수 있는 자를 말합니다.
  
  4. '비회원'이라 함은, 회원으로 등록하지 않고, '회사'가 제공하는 서비스를 이용하는 자를 말합니다.
  
  5. '상품'이라 함은 '사이트'를 통하여 제공되는 재화 또는 용역을 말합니다.
  
  6. '구매자'라 함은 '회사'가 제공하는 '상품'에 대한 구매서비스의 이용을 청약한 '회원' 및 '비회원'을 말합니다.
  
  제 3 조 (약관 외 준칙)
  
   본 약관에서 정하지 아니한 사항은 법령 또는 회사가 정한 서비스의 개별 약관, 운영정책 및 규칙(이하 '세부지침' 이라 합니다) 의 규정에 따릅니다.
   또한 본 약관과 세부지침이 충돌할 경우에는 세부지침이 우선합니다.
   
 제 4 조(약관의 명시 및 개정)

  1. '회사'는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지, 전화번호, 모사전송번호(FAX), 전자우편주소, 사업자등록번호, 통신판매업신고번호 등을
      이용자가 쉽게 알 수 있도록 '회사'홈페이지의 초기 서비스화면에 게시합니다. 다만 본 약관의 내용은 '이용자'가 연결화면을 통하여 확인할 수 있도록 할 수 있습니다.
      
  2. '회사'는 '이용자'가 약관에 동의하기에 앞서 약관에 정해진 내용 중 청약철회, 배송책임, 환불조건 등과 같은 내용을 '이용자'가 이해할 수 있도록 별도의 연결화면 또는
      팝업화면 등을 통하여 '이용자'의 확인을 구합니다.
   
  3. '회사'는 '전자상거래 등에서의 소비자보호에 관한 법률','약관의 규제에 관한 법률', '전자거래기본법', '정보통신망 이용촉진등에 관한 법률', '소비자보호법'등 
      관련법렵(이하 '관계법령'이라 합니다)에 위배되지 않는 범위내에서 본 약관을 개정할 수 있습니다.
      
  4. '회사'가 본 약관을 개정하고자 할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 온라인 쇼핑몰의 초기화면에 그 적용일자 7일전부터 적용일자
  	  7일전부터 적용일자 전날까지 공지합니다. 다만 '이용자'에게 불리한내용으로 약관을 변경하는 경우 최소 30일 이상 유예기간을 두고 공지합니다.
  	  
  5. '회사'가 본 약관을 개정한 경우, 개정약관은 적용일자 이후 체결되는 계약에만 적용되며 적용일자 이전 체결된 계약에 대해서는 개정 전 약관이 적용됩니다.
      다만, 이미 계약을 체결한 '이용자'가 개정약관의 내용을 적용받고자 하는 뜻을 '회사'에 전달하고 '회사'가 여기에 동의한 경우 개정약관을 적용합니다.
      
  6. 본 약관에서 정하지 아니한 사항 및 본 약관의 해석에 관하여는 관계법령 및 건전한 상관례에 따릅니다.
  
제 5 조 (회원가입)

  1. '회사'가 정한 양식에 따라 '이용자'가 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
  
  2. '회사'는 전항에 따라 회원가입을 신청한 '이용자'중 다음 각호의 사유가 없는 한 '회원'으로 등록합니다.
  		가. 가입신청자가 본 약관에 따라 회원자격을 상실한 적이 있는 경우, 다만, '회사'의 재가입 승낙을 얻은 경우에는 예외로 합니다.
  		
  		나. 회원정보에 허위,기재누락,오기 등 불완전한 부분이 있는 경우
  		
  		다. 기타 회원으로 등록하는 것이 '회사'의 가입승낙 안내가 '회원'에게 도달한 시점으로 합니다.
  		
제 6 조 (구매신청)

   '이용자'는 온라인 쇼핑몰 상에서 다음 방법 또는 이와 유사한 방법에 따라 구매를 신청할 수 있으며, '회사'는 '이용자'를 위하여 다음 각호의 내용을 알기 쉽게 제공하여야 합니다.
   
제 7 조 (환급)

 	'회사'는 '구매자'가 신청한 '상품'이 품절, 생산중단 등의 사유로 인도 또는 제공할 수 없게된 경우 지체없이 그 사유를 '구매자'에게 통지합니다. 이 때 
 	'구매자'가 재화 등의 대금을 지불한 경우 대금을 받은날 부터 3 영업일 이내에 환급하거나 이에 필요한 조치를 취합니다.
 	
제 8 조 (개인정보보호)

	1. '회사'는 '구매자'의 정보수집시 다음의 필수사항 등 구매계약 이행에 필요한 최소한의 정보만을 수집합니다.
		
		가. 성명
		나. 주민등록번호 또는 외국인등록번호
		다. 주소
		라. 전화번호(또는 이동전화번호)
		마. 아이디(ID)
		바. 비밀번호
		사. 전자우편(e-mail)주소
	2. '회사'가 개인정보보호법 상의 고유식별정보 및 민감정보를 수집하는 때에는 반드시 대상자의 동의를 받습니다.
	
	3. '회사'는 제공된 개인정보를 '구매자'의 동의 없이 목적외 이용, 또는 제3자 제공할 수 없으며 이에 대한 모든 책임은 '회사'가 부담합니다. 다만 다음 경우는 예외로 합니다.
		
		가. 배송업무상 배송업체에게 배송에 필요한 최소한의 정보(성명,주소,전화번호)를 제공하는 경우
		나. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
		다. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우
		라. 도용방지를 위하여 본인 확인이 필요한 경우
		마. 관계법령의 규정에 따른 경우
		
제 9 조 (이용자 및 회원의 의무)

	1. '이용자'는 회원가입 신청 시 사실에 근거하여 신청서를 작성해야 합니다. 허위, 또는 타인의 정보를 등록한 경우
		'회사'에 대하여 일체의 권리를 주장할 수 없으며, '회사'는 이로 인하여 발생한 손해에 대하여 책임을 부담하지 않습니다.
		
	2. '이용자'는 본 약관에서 규정하는 사항과 기타 '회사'가 정한 제반 규정 및 공지사항을 준수하여야 합니다.
		또한 '이용자'는 '회사'의 업무를 방해하는 행위 및 '회사'의 명예를 훼손하는 행위를 하여서는 안됩니다.
		
	3. '이용자'는 주소, 연락처, 전자우편 주소 등 회원정보가 변경된 경우 즉시 이를 수정해야 합니다. 변경된 정보를 수정하지 않거나 수정을 게을리하여 발생하는 책임은 '이용자가 부담합니다.
	
	4. '이용자'는 다음의 행위를 하여서는 안됩니다.
		
		가. '회사'에 게시된 정보의 변경
		나. '회사'가 정한 정보 외의 다른 정보의 송신 또는 게시
		다. '회사' 및 제3자의 저작권 등 지식재산권에 대한 침해
		라. '회사' 및 제3자의 명예를 훼손하거나 업무를 방해하는 행위
		마. 외설 또는 폭력적인 메시지, 화상, 음성 기타 관계법령 및 공서양속에 반하는 정보를 '회사'의 '사이트'에 공개 또는 게시하는 행위
		
	5. '회원'은 부여된 아이디(ID)와 비밀번호를 직접 관리해야 합니다.
	
	6. '회원'이 자신의 아이디(ID) 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 '회사'에 통보하고 안내에 따라야 합니다.
	
	
	<b>부칙</b>
	
제 1 조 (시행일)
	
	본 약관은 2023.09.13부터 적용합니다.
                            </textarea>
                        </div>
                        <div class="text-end p-3">
                            <input type="checkbox" name="autolgn" id="myCheckbox" class="form-check-input border-primary"  onchange="checkAgree(this)">
                            <label class="form-check-label text-primary fw-bold"  id="chk">이용약관에 동의합니다.</label>
                        </div>
                    </form>
                </div>   

            <div class="card card-body bg-light mx-5">
                    <form>
                        <h4>개인정보 수집 및 이용에 대한 안내</h4>
                        <div>
                            <textarea rows="10" class="form-control">
제1조 [개인정보의 처리 목적]

	NOERROR 책check은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 
	「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

제2조 [개인정보의 처리 및 보유기간]

	NOERROR 책check은 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
	
제3조 [개인정보의 제3자 제공에 관한 사항]

	NOERROR 책check은 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 
	「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
	
제4조 [정보주체와 법정대리인의 권리·의무 및 행사방법]

	정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 NOERROR 책check가 보유하고 있는 개인정보에 대하여 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
	1항에 따른 권리 행사는 “개인정보 열람·정정·삭제·처리정지 요구”를 통하여 하실 수 있으며, 이에 대해 지체 없이 조치하겠습니다.
	개인정보 열람·정정·삭제·처리정지 요구 바로가기

	기관명은 NOERROR 책check으로, 파일명은 “도서대출회원정보” 검색

	1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.
	개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
	개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
	정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
	
제5조 [개인정보의 파기 절차 방법]

	NOERROR 책check은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 다만, 다른 법률에 따라 보존하여야 하는 경우에는 그러하지 않습니다.
	파기의 절차, 기한 및 방법은 다음과 같습니다.
	
	파기절차

	불필요한 개인정보 및 개인정보파일은 개인정보책임자의 책임 하에 내부방침 절차에 따라 다음과 같이 처리하고 있습니다.
	
	파기기한
	
	이용자의 개인정보는 개인정보의 보유기간이 경과된 경우 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리목적 달성 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.
	
	파기방법
	
	종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고, 전자적파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
	
제6조 [개인정보 자동 수집 장치의 설치·운영 및 거부]

	NOERROR 책check은 정보주체의 이용정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.
	쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들이 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
	쿠키의 사용목적
	이용자의 접속빈도나 방문시간 등을 파악하여 이용자에게 편리한 서비스를 제공하기 위해 사용됩니다.

	쿠키의 설치·운영 및 거부
		가. 브라우저 옵션 설정을 통해 쿠키 허용, 쿠키 차단 등의 설정을 할 수 있습니다.
		나. Internet Explorer : 웹브라우저 우측 상단의 도구 메뉴 > 인터넷 옵션 > 개인정보 > 설정 > 고급
		다. Edge: 웹브라우저 우측 상단의 설정 메뉴 > 쿠키 및 사이트 권한 > 쿠키 및 사이트 데이터 관리 및 삭제
		라. Chrome: 웹브라우저 우측 상단의 설정 메뉴 > 개인정보 및 보안 > 쿠키 및 기타 사이트 데이터
		쿠키 저장을 거부 또는 차단할 경우 서비스 이용에 어려움이 발생할 수 있습니다.
		
제9조 [개인정보의 안전성 확보 조치]

	NOERROR 책check은「개인정보 보호법」제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적, 관리적, 물리적 조치를 하고 있습니다.
	
	내부관리계획의 수립 및 시행
	NOERROR 책check 총괄부서에서 내부관리계획 수립 및 시행하며 행정안전부의 내부관리 지침을 준수하여 시행합니다.
	개인정보 취급 담당자의 최소화 및 교육
	개인정보를 취급하는 담당자를 지정하고 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.
	개인정보에 대한 접근 제한
	개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
	접속기록의 보관 및 위·변조 방지
	개인정보처리시스템에 접속한 기록(웹 로그, 요약정보 등)을 최소 1년 이상 보관 관리하고 있으며, 접속 기록이 위·변조 및 도난, 분실되지 않도록 보안 기능을 사용하고 있습니다.
	개인정보의 암호화
	이용자의 개인정보는 암호화 되어 저장 및 관리되고 있으며, 또한 중요한 데이터는 저장 및 전송 시 암호화하여 사용하는 등의 별도 보안기능을 사용하고 있습니다.
	해킹 등에 대비한 기술적 대책
	해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며, 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적·물리적으로 감시 및 차단하고 있습니다. 또한 네트워크트래픽의 통제(Monitoring)는 물론 불법적으로 정보를 변경하는 등의 시도를 탐지하고 있습니다.
	비인가자에 대한 출입 통제
	개인정보를 보관하고 있는 개인정보시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.
	
제10조 [개인정보 처리방침의 변경]

	이 	정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 공지사항을 통하여 고지할 것입니다.

공고일자 : 2023년 9월 13일
시행일자 : 2023년 9월 13일
                            </textarea>
                        </div>
                        <div class="text-end p-3">
                            <input type="checkbox" name="autolgn" id="myCheckbox2" class="form-check-input border-primary"  onchange="checkAgree(this)">
                            <label class="form-check-label text-primary fw-bold"  id="chk2">개인정보 수집 및 이용에 동의합니다.</label>
                        </div>
                    </form>
                </div>    

            <div class="text-center m-3 ">
                <button type="button" id="okagree" class="btn btn-success" onclick="chkBox()">
                    <i class="bi bi-check"></i>모두 동의합니다</button>
                <button type="button" id="noagree" class="btn btn-danger">
                    <i class="bi bi-x"></i>모두 동의하지 않습니다</button>
            </div>  

        </div>   


        <footer>
            <h6>Copylight &copy; Lorem Ipsum 2022.
                All rights reserved.</h6>
        </footer>
    </div>   


    <script>
        var noagree = document.querySelector('#noagree');
        noagree.addEventListener('click', () => {
            if (confirm('정말로 동의하지 않으시겠습니다까?')) {
                location.href='http://localhost:8080/noerrorbmss';
            }
        });
        
        function chkBox() {
            var checkbox = document.getElementById('myCheckbox');
            var checkbox2 = document.getElementById('myCheckbox2');
            var isChecked = checkbox.checked;
            var isChecked2 = checkbox2.checked;

            if (isChecked && isChecked2) {
                location.href = './join2.do'; 
            } else {
                alert('약관 동의를 하지 않았습니다.'); 
            }
        }

        document.getElementById('chk').addEventListener('click', function() {
            var checkbox = document.getElementById('myCheckbox');
            checkbox.checked = !checkbox.checked;
        });
        function checkAgree(checkbox) {
            var label = document.getElementById('chk');
            label.classList.toggle('checked', checkbox.checked);
        }
        document.getElementById('chk2').addEventListener('click', function() {
            var checkbox = document.getElementById('myCheckbox2');
            checkbox.checked = !checkbox.checked;
        });
        function checkAgree2(checkbox) {
            var label = document.getElementById('chk2');
            label.classList.toggle('checked', checkbox.checked);
        }







</script>
</body>
</body>
<%@include file="footer.jsp"%>
</html>