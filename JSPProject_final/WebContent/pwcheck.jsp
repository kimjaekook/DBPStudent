<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>본인 여부 확인</h3>
<hr>
<form action="pwcheck.act" method="post">
<input name="id" type="hidden" value="<%= id %>"><br>
사용자 ID : <%= id %><br>
비밀 번호 : <input name="pwd" type="password"><br>
           <input type="submit" value="수정">           
</form>
</body>
</html>