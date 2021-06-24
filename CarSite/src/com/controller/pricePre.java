package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.GoodsDAO;
import com.model.JoinDTO;
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
		String car_num=dao.select_car_num(dto);
		GoodsDAO goodsDAO = new GoodsDAO();
		
		ArrayList<JoinDTO> carinfo = goodsDAO.select_all3(car_num);
		
		if (carinfo != null) {
			session.setAttribute("carinfo1", carinfo);
			session.setAttribute("caryear", dto);
			session.setAttribute("pricepre", pre);
			response.sendRedirect("carprice.jsp");
		}else {
			session.setAttribute("carinfo1", carinfo);
			response.sendRedirect("carprice.jsp");
		}

		
	}

}
