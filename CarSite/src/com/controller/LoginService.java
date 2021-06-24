package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO(id, pw);
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(dto);
		
		if (info != null) {
			// 로그인 성공한 사람의 이름을 쿠키에 name이라는  key값으로 저장
			// 로그인 성공한 사람의 이름을 세션에 저장하시오.
			HttpSession session = request.getSession();
			// 세션의 생명주기 넣기
			session.setMaxInactiveInterval(500);
			session.setAttribute("info",info);
			System.out.println("로그인 성공 ");
			response.sendRedirect("testmain.jsp");
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("login.html");
		}

	}

}
