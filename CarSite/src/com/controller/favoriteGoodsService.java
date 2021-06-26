package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FavoriteGoodsDAO;
import com.model.FavoriteGoodsDTO;
import com.model.JoinDTO;

/**
 * Servlet implementation class favoriteGoodsService
 */
@WebServlet("/favoriteGoodsService")
public class favoriteGoodsService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int goods_num= Integer.parseInt(request.getParameter("goods_num"));
		ArrayList<JoinDTO> carinfo1 = (ArrayList<JoinDTO>)request.getSession().getAttribute("carinfo1");
		goods_num=Integer.parseInt(carinfo1.get(goods_num).getGoods_num());
		String id=request.getParameter("id");
		System.out.println(id +" : "+goods_num);
		FavoriteGoodsDTO dto = new FavoriteGoodsDTO(id, goods_num);
		FavoriteGoodsDAO dao = new FavoriteGoodsDAO();
		int cnt=dao.insert(dto);
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			System.out.println("Âò ¼º°ø");
			out.print("ÂòÇÏ±âÇØÁ¦");
		} else {
			System.out.println("Âò ½ÇÆÐ");
			out.print("ÂòÇÏ±â");
		}
	}

}
