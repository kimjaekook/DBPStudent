<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.song.persistence.DataAccessor" %>

<%
	String id = request.getParameter("id");
	Map<String, String> member = new DataAccessor().executeQueryOne("SELECT * FROM tbl_member WHERE id = ?", id);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
</head>

<body>
    <div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 정보</h2>
			
			<div class="notice margin-top">				
				<p>id: <%= member.get("id") %></p>		
				<p>name: <%= member.get("name") %></p>		
				<p>tel: <%= member.get("tel") %></p>		
				<p>email: <%= member.get("email") %></p>		
				<p>dept: <%= member.get("dept") %></p>		
				<p>gender: <%= member.get("gender") %></p>		
				<p>birth: <%= member.get("birth") %></p>		
				<p>introduction: <%= member.get("introduction") %></p>
			</div>
			
			<div class="search-form margin-top first align-right">
			<input type="button" value="목록" onclick="location.href='list.jsp'"/>
			<input type="button" value="수정" onclick="location.href='pwcheck.jsp?id=<%= id %>'"/>
			</div>
		</main>
		
			
		</div>
	</div>

    </body>
    
    </html>