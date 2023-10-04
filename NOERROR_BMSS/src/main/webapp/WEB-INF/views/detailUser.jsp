<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="./js/payment.js"></script>
</head>
<%@include file="header.jsp"%>
<body>
<input type="hidden" id="loginVo" value="${loginVo}">
<c:choose>
<c:when test="${loginVo eq null}">
<button style="display: none;" id="pay_btn" onclick="requestPay()">결제하기</button>
</c:when>
<c:otherwise>
<button id="pay_btn" onclick="requestPay()">결제하기</button>
</c:otherwise>
</c:choose>
	<div style="margin-left: 5%; margin-right: 5%;">
	<h2>내 정보</h2>
		<table class="table table-hover" style="margin-top: 5%; border-top: 2px solid #e1e1e1">
			<thead>
				<tr>
					<th scope="col" class="text-center">이름</th>
					<th scope="col" class="text-center">이메일</th>
					<th scope="col" class="text-center">전화번호</th>
					<th scope="col" class="text-center">생년월일</th>
					<th scope="col" class="text-center">주소</th>
					<th scope="col" class="text-center">가입날짜</th>
					<th scope="col" class="text-center">패널티 현황</th>
					<th scope="col" class="text-center"></th>
				</tr>
			</thead>
			<tbody>

					<tr>
						<!-- 				<td style="width: 5%"><a class="text-reset">asdasd</a></td> -->
						<td style="width: 10%" class="text-center">${loginVo.user_name}</td>
						<td style="width: 20%" class="text-center">${loginVo.user_email}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_phone}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_birth}</td>
						<td style="width: 20%" class="text-center">${loginVo.user_address}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_joindate}</td>
						<c:choose>
						<c:when test="${loginVo.penalty_date eq null}">
							<td style="width: 10%" class="text-center"><b>없음</b></td>
						</c:when>
						<c:otherwise>
						<td style="width: 10%; color: red;" class="text-center">${loginVo.penalty_date}</td>
						</c:otherwise>
						</c:choose>
						<td style="width: 3%" class="text-center">

						<input type="button" value="내 서재" onclick="location.href='./myLibrary.do?user_id=${sessionScope.loginVo.user_id}'"> 
            <input type="button" value="결제정보" onclick="location.href='./payInfo.do'"></td>

					</tr>
			</tbody>
		</table>

		<p class="text-center">
				<button id="modifyBtn" name="modify" onclick="location.href='./modifyUser.do'">정보수정</button>
				<button id="deleteBtn" name="delete" onclick="location.href='./deleteUser.do'">회원탈퇴</button>
			<a class="text-reset" href="/boardChat?requestedPage="></a>&nbsp;&nbsp;
		</p>
		
<!--     <a href="./myLibrary.do">내 서재</a> -->
    

	</div>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
var email = '${loginVo.user_email}';
var name = '${loginVo.user_name}';
var address = '${loginVo.user_address}';
var phone = '${loginVo.user_phone}';
var merchant_uid = merchant_uid + 1;
var point = '100000'; // 아직 구현 안해서 값을 못가져옴 임시지정 
var IMP = window.IMP;
IMP.init("imp46250334");
console.log("유저정보", loginVo.value);

function requestPay() {
    IMP.request_pay(
        {
            pg: "kakaopay", 
            pay_method: "kakaopay", 
            merchant_uid: merchant_uid,
            name: "결제테스트",
            amount: point,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: phone,
            buyer_addr: address,
            buyer_postcode: '4868282',
        },
        function (rsp) {
            console.log(rsp);
            console.log(point);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                alert(msg);
                var pay_method = rsp.pay_method;
                var amount = rsp.paid_amount;
                var imp_uid = rsp.imp_uid;
                $.ajax({
                    type: "POST",
                    url: "./payForm.do",
                    data: {
                        amount: amount,
                        pay_method: pay_method,
                        imp_uid:imp_uid
                    },
                    success: function(data) {
                        console.log('성공',data);
                        localStorage.setItem('payInfo',data);
                        location.href='./payInfo.do'; 
                    },
                    error: function(xhr, status, error) {
                        console.log('에러 :', status, error);
                        console.log('에러 :', amount, pay_method);
                    }
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                console.log('결제실패');
                alert(msg);
            }
        }
    );
}

</script>
</html>