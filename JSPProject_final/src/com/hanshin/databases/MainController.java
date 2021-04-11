package com.hanshin.databases;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hanshin.finaldatabases.DataAccessor;

@WebServlet("*.act")
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final DataAccessor dao = new DataAccessor();
	
	public MainController() {
		super();
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String uri    = request.getRequestURI().split("/")[2].split("\\.")[0];
		String id     = request.getParameter("id");
		String pwd    = request.getParameter("pwd");
		String name   = request.getParameter("name");
		String tel    = request.getParameter("tel");
		String email  = request.getParameter("email");
		String dept   = request.getParameter("dept");
		String gender = request.getParameter("gender");
		String birth  = request.getParameter("birth");
		String intro  = request.getParameter("introduction");
		
		switch (uri) {
			case "login": {	
				Map<String, String> result = dao.executeQueryOne("SELECT * FROM databasetest.mydatabasefinal WHERE id = ? AND pwd = ?", id, pwd);
				if (result != null) {
					HttpSession session = request.getSession();
					session.setAttribute("id", result.get("id"));
					response.sendRedirect("list.jsp");
				} else {
					response.sendRedirect("output.jsp?msg=" + URLEncoder.encode("비밀번호가 일치하지 않거나 존재하지 않는 id입니다.", "UTF-8"));
				}
				break;
			}
			case "join": {
				int result = dao.executeUpdate("INSERT INTO databasetest.mydatabasefinal VALUES (?, ?, ?, ?, ?, ?, ?, ?)", id, pwd, name, tel, email, dept, gender, intro);
				if (result == 1) {
					response.sendRedirect("output.jsp?msg=" + URLEncoder.encode("우리의 회원이 되셨어요!.", "UTF-8"));
				} else {
					response.sendRedirect("output.jsp?msg=" + URLEncoder.encode("이미 회원이신데요?", "UTF-8"));
				}
				break;
			}
			case "pwcheck": {
				Map<String, String> result = dao.executeQueryOne("SELECT * FROM databasetest.mydatabasefinal WHERE id = ? AND pwd = ?", id, pwd);
				if (result != null) {
					response.sendRedirect("member.jsp?id=" + URLEncoder.encode(id, "UTF-8"));
				} else {
					response.sendRedirect("output.jsp?msg=" + URLEncoder.encode("패스워드가 올바르지 않습니다.", "UTF-8"));
				}
				break;
			}
			case "update": {
				dao.executeUpdate("UPDATE databasetest.mydatabasefinal SET pwd = ?, tel = ?, email = ?, dept = ?, gender = ?, introduction = ? WHERE id = ?", pwd, tel, email, dept, gender, intro, id);
				response.sendRedirect("detail.jsp?id=" + URLEncoder.encode(id, "UTF-8"));
			}
		}
		
	}


}
