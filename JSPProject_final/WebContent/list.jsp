<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.song.persistence.DataAccessor" %>

<%
	String dept = request.getParameter("dept");
	List<Map<String, String>> memberList = null;
	
	if (dept == null || "".equals(dept)) {
		memberList = new DataAccessor().executeQueryList("SELECT * FROM tbl_member");
	} else {
		memberList = new DataAccessor().executeQueryList("SELECT * FROM tbl_member WHERE dept = ?", dept);
	}
	
	int cnt = 1;
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
    <!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 목록</h2>
			
			<div class="notice margin-top">				
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th>&nbsp;이름</th>
						</tr>
					</thead>
					<tbody>
	
					<% for (Map<String, String> member : memberList) { %>
					<tr>
						<td><%= cnt++ %></td>
						<td><a href="detail.jsp?id=<%= member.get("id") %>"><%= member.get("id") %> </a></td>
						<td>&nbsp;&nbsp; <%= member.get("name") %></td>												
					</tr>
					<% } %>		

					</tbody>
				</table>
			</div>
			
			<div class="search-form margin-top first align-right">
			<br>	
				<form action="list.jsp" method=get>
					<fieldset>
						<legend class="hidden">학생 분류</legend>
						<label class="hidden">학과</label>
						<select name="dept">
							<option value="">전체</option>
							<option value="Computer" <%= "Computer".equals(dept) ? "selected" : "" %>>컴퓨터공학부</option>
							<option value="Communications" <%= "Communications".equals(dept) ? "selected" : "" %>>정보통신학부</option>
							<option value="Contents" <%= "Contents".equals(dept) ? "selected" : "" %>>IT콘텐츠학과</option>
							<option value="Korean" <%= "Korean".equals(dept) ? "selected" : "" %>>국어국문학과</option>							
						</select> 
						<input type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
		</main>
		
			
		</div>
	</div>

    </body>
    
    </html>