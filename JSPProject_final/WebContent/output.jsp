<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>본인 여부 확인</h3>
<hr>
<%=request.getParameter("msg")%>
<br>
<br>
<a href="javascript:history.back();">뒤로이동</a>
<br>
<a href="login.html">로그인 페이지로 이동</a>
</body>
</html>