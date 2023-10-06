<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제상세정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	body{
	min-height: 100%;
	min-width: 100%;
 }
</style>
<link rel="stylesheet" href="./css/adminPage.css">
</head>
<%@include file="header.jsp"%>
<body>
	<table  class="table table-hover" style="margin-top: 5%;">
	<tr>
					<th scope="col" class="text-center">결제번호</th>
					<th scope="col" class="text-center">결제금액</th>
					<th scope="col" class="text-center">결제방법</th>
					<th scope="col" class="text-center">결제시간</th>
					<th scope="col" class="text-center"></th>
				</tr>
	<tr id="tr-hover">
						<td style="width: 10%" class="text-center">${detailPay.payVo[0].pay_seq}</td>
						<td style="width: 20%" class="text-center">${detailPay.payVo[0].pay_money}</td>
						<td style="width: 10%" class="text-center">${detailPay.payVo[0].pay_method}</td>
						<td style="width: 30%" class="text-center">${detailPay.payVo[0].pay_time}</td>
						<td style="width: 10%" class="text-center"><input class="custom-btn btn-8"  type="button" value="결제취소"  onclick="canclePay()"></td>
					</tr>
	
	</table>
	
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
		var pay_seq = '${detailPay.payVo[0].pay_seq}';
		console.log("seq값",pay_seq);
	function canclePay(){
		var cs = confirm("결제취소는 취소문의를 통해 가능합니다 \n 결제 취소 하시겠습니까?");
		if (cs) {
			location.href='./canclePay.do?pay_seq='+pay_seq;
		} else {
		  location.href='./detailUser.do';
		}
	}
</script>
</html>