package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FavoriteDAO;
import com.model.FavoriteDTO;

/**
 * Servlet implementation class favoriteService
 */
@WebServlet("/favoriteService")
public class favoriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String car_num= request.getParameter("car_num");
		String id=request.getParameter("id");
		System.out.println(id +" : "+car_num);
		FavoriteDTO dto = new FavoriteDTO(id, car_num);
		FavoriteDAO dao = new FavoriteDAO();
		int cnt=dao.insert(dto);
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			System.out.println("Âò ¼º°ø");
			out.print("ÂòÇÏ±âÇØÁ¦");
		} else {
			System.out.println("Âò ½ÇÆĞ");
			out.print("ÂòÇÏ±â");
		}
		
	}

}
