package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		String pre2 = null;
		String pre3 = null;
		String pre4 = null;
		String pre5 = null;
		ArrayList<String> pre_list = new ArrayList<String>();
		if (request.getParameter("pre") != null) {
			pre = request.getParameter("pre");
			pre2 = request.getParameter("pre2");
			pre3 = request.getParameter("pre3");
			pre4 = request.getParameter("pre4");
			pre5 = request.getParameter("pre5");
			pre_list.add(pre);
			pre_list.add(pre2);
			pre_list.add(pre3);
			pre_list.add(pre4);
			pre_list.add(pre5);
		}
		System.out.println(brand+"/"+ model+"/"+ d_model+"/"+ grade+"/"+ year +"/"+ pre);
		carinfoDTO dto = new carinfoDTO(brand, model, d_model, grade, year);
		
		carDAO dao = new carDAO();
		String car_num = dao.select_car_num(dto);
		String price=dao.select_price(car_num);
		GoodsDAO goodsDAO = new GoodsDAO();
		boolean ck = true;
		ArrayList<JoinDTO> carinfo = goodsDAO.select_all3(car_num);
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			System.out.println(cookies.length);
			for (Cookie cookie1 : cookies) {
				if (cookie1.getName().length() > 7) {
					if (cookie1.getName().subSequence(0, 7).equals("car_num")) {
						String s1 = cookie1.getValue();
						System.out.println();
						if (s1.equals(car_num)) {
							System.out.println("asefaesfes");
							ck = false;
						}
						System.out.println(1);
					}
				}
			}
			System.out.println(ck);
			if (ck == true) {
				Cookie cookie = new Cookie("car_num" + (request.getCookies().length), car_num);
				response.addCookie(cookie);
			}

		}

		if (carinfo != null) {
			session.setAttribute("carinfo1", carinfo);
			session.setAttribute("caryear", dto);
			session.setAttribute("price", price);
			session.setAttribute("pricepre", pre_list);
			response.sendRedirect("carprice.jsp");
		} else {
			session.setAttribute("carinfo1", carinfo);
			response.sendRedirect("carprice.jsp");
		}

		
	}

}
