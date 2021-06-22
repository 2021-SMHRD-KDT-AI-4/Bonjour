package com.controller;

import java.io.DataOutput;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;



@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		MemberDTO dto = new MemberDTO(id, pw, address, tel);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		if(cnt > 0){
			response.sendRedirect("testmain.jsp");
		}else{
			response.sendRedirect("join.html");
		}
	
	}

}
