<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.song.persistence.DataAccessor" %>

<%
	String id = request.getParameter("id");
	Map<String, String> member = new DataAccessor().executeQueryOne("SELECT * FROM tbl_member WHERE id = ?", id);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Form Example</title></head>
<body>
    <h3>회원 정보</h3>
    <form action="update.act" method="post">
    	<input type="hidden" name="id" value="<%= id %>">
	     ID : <%= id %><br/>
	        비밀번호 : <input type="password" name="pwd" /> <br/>
	        이름 :  <%= member.get("name") %> <br/>
	        전화번호 :  <input type="text" name="tel" value="<%= member.get("tel") %>" /> <br/>
	        이메일 :  <input type="text" name="email" value="<%= member.get("email") %>"/> <br/>
	        학부 : 
              <input type="radio" name="dept" value="Computer" <%= "Computer".equals(member.get("dept")) ? "checked" : "" %> /> 컴퓨터공학부 
              <input type="radio" name="dept" value="Communications" <%= "Communications".equals(member.get("dept")) ? "checked" : "" %> /> 정보통신학부  
              <input type="radio" name="dept" value="Contents" <%= "Contents".equals(member.get("dept")) ? "checked" : "" %> /> IT콘텐츠학과  
              <input type="radio" name="dept" value="Korean" <%= "Korean".equals(member.get("dept")) ? "checked" : "" %> /> 국어국문학과 <br/>
	        성별 :
              <input type="radio"  name="gender"  value="male" <%= "male".equals(member.get("gender")) ? "checked" : "" %> />남자 
              <input type="radio"  name="gender"  value="female" <%= "female".equals(member.get("gender")) ? "checked" : "" %>/>여자<br/>
	        
	        태어난 계절:
              <select name="birth">
                 <option value="Spring" <%= "Spring".equals(member.get("birth")) ? "selected" : "" %> > 봄 
                 <option value="Summer" <%= "Summer".equals(member.get("birth")) ? "selected" : "" %> > 여름 
                 <option value="Fall" <%= "Fall".equals(member.get("birth")) ? "selected" : "" %> > 가을 
                 <option value="Winter" <%= "Winter".equals(member.get("birth")) ? "selected" : "" %> > 겨울                 
              </select>  <br/>
	        자기소개:<br/>
              <textarea cols="30" rows="10" name="introduction"><%= member.get("introduction") %></textarea> <br/>
        <input type="submit" value="전송" />        
    </form>
</body>
</html>
