package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.carDAO;
import com.model.carinfoDTO;

@WebServlet("/carDetailinfo")
public class carDetailinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String brand = request.getParameter("brand");
		System.out.println("�귣�� :"+brand);
		
		String model = request.getParameter("model");
		String d_model = request.getParameter("d_model");
		String grade = request.getParameter("grade");
		String year = request.getParameter("year");
		carinfoDTO dto = new carinfoDTO(brand, model, d_model, grade, year);
		carDAO dao = new carDAO();
		carinfoDTO carinfo = dao.select_all(dto);
		if (carinfo != null) {
			session.setAttribute("carinfo", carinfo);
			response.sendRedirect("cardetail.jsp");
		}else {
			response.sendRedirect("cardetail.jsp");
		}
		
		
		
	}

}
