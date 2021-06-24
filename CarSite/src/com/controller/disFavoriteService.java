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
 * Servlet implementation class disFavoriteService
 */
@WebServlet("/disFavoriteService")
public class disFavoriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String car_num= request.getParameter("car_num");
		String id=request.getParameter("id");
		System.out.println("찜하기해제"+id +" : "+car_num);
		FavoriteDTO dto = new FavoriteDTO(id, car_num);
		FavoriteDAO dao = new FavoriteDAO();
		int cnt=dao.delete(dto);
		System.out.println(cnt);
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			System.out.println("찜 해제 성공");
			out.print("찜하기");
		} else {
			System.out.println("찜 해제 실패");
			out.print("찜하기해제");
		}
	}

}
