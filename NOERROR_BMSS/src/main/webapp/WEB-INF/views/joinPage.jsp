<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



</head>
<body>
	  <table>
        <tr>
            <th>이름</th>
            <td><input type="text" name="user_name"></td>
        </tr>
        <tr>
            <th>주소</th>
            <td><input type="text" id="address" name="address" readonly /><input type="button" id="address_kakao" value="검색"></td>
        </tr>
        <tr>
            <th>상세 주소</th>
            <td><input type="text" name="address_detail" /></td>
        </tr>
    </table>
</body>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ 
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("address").value = data.address; 
                document.querySelector("input[name=address_detail]").focus(); 
            }
        }).open();
    });
}
</script>
</html>