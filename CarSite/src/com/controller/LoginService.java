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
	
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO(id, pw);
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(dto);
		
		if (info != null) {
			// �α��� ������ ����� �̸��� ��Ű�� name�̶��  key������ ����
			// �α��� ������ ����� �̸��� ���ǿ� �����Ͻÿ�.
			HttpSession session = request.getSession();
			// ������ �����ֱ� �ֱ�
			session.setMaxInactiveInterval(500);
			session.setAttribute("info",info);
			response.sendRedirect("testmain.jsp");
		} else {
			response.sendRedirect("login.html");
		}

	
	
	}

}