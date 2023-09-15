<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>재고</title>
</head>
<%@include file="header.jsp"%>


<style>
table{
	margin:200px auto;
}
</style>
<body>
	<form action="./changeStatus.do" method="get">
	<table>
		<tr>
			<td>재고목록</td>
			<td>도서명</td>
			<td>도서상태</td>
			<td>판매 가능여부</td>
			<td>관리번호</td>
			<td>도서 가격</td>
	</tr>
	
	
			<c:forEach var="a" items="${list}">
				<tr>
					<td id="stockNum">${a.stock_number}</td>
					<td>${a.status_title}</td>
					<td>${a.status_code}</td>
				   <td>
            <select id="chStatus" onchange="changeStatus()">
                <option value="N" ${a.sell_status == 'N' ? 'selected' : ''}>판매불가</option>
                <option value="Y" ${a.sell_status == 'Y' ? 'selected' : ''}>판매가능</option>
            </select>
        </td>
					<td><input id="price"type="number" name="price" value="${a.book_price}" ></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<script type="text/javascript">
	
	
	$(document).ready(function(){
	    
		
		$("input[name='price']").on("keyup", function(event) {
	        if (event.key === "Enter") {
	        	 var stockNum = $(this).closest("tr").find("#stockNum").text(); 
	             var price = $(this).val(); 

	            $.ajax({
	                url: "./changePrice.do",
	                type: "post",
	                data: { stockNum: stockNum, price: price },
	                success: function(data) {
	                    alert("값이 변경되었습니다.");
	                },
	                error: function() {
	                    response.alert("오류발생");
	                }
	            });
	        }
	    });
	});
	

	</script>
<script>
function changeStatus(){
var select=document.getElementById("chStatus")
var value =select.value;

$.ajax(function(){
	type:"post",
	url:"./".
	
})
}

</script>

</body>
<%@include file="footer.jsp"%>
</html>