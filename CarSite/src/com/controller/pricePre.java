package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.carDAO;
import com.model.carinfoDTO;
import com.model.carinfoDTO2;

@WebServlet("/pricePre")
public class pricePre extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getRequestURI().toString());
		HttpSession session = request.getSession();
		
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String d_model = request.getParameter("d_model");
		String grade = request.getParameter("grade");
		String year = request.getParameter("year");
		String pre = null;
		if (request.getParameter("pre") != null) {
			 pre = request.getParameter("pre");
		}
		System.out.println(brand+"/"+ model+"/"+ d_model+"/"+ grade+"/"+ year +"/"+ pre);
		carinfoDTO dto = new carinfoDTO(brand, model, d_model, grade, year);
		
		carDAO dao = new carDAO();
		ArrayList<carinfoDTO> carinfo = dao.select_all2(dto);
		
		
		if (carinfo != null) {
			session.setAttribute("carinfo", carinfo);
			session.setAttribute("pricepre", pre);
			response.sendRedirect("carprice.jsp");
		}else {
			session.setAttribute("carinfo", carinfo);
			response.sendRedirect("carprice.jsp");
		}

		
	}

}
