package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FavoriteDAO;
import com.model.FavoriteDTO;
import com.model.FavoriteGoodsDAO;
import com.model.FavoriteGoodsDTO;
import com.model.JoinDTO;

/**
 * Servlet implementation class disFavoriteGoodsService
 */
@WebServlet("/disFavoriteGoodsService")
public class disFavoriteGoodsService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int goods_num= Integer.parseInt(request.getParameter("goods_num"));
		String id=request.getParameter("id");
		ArrayList<JoinDTO> carinfo1 = (ArrayList<JoinDTO>)request.getSession().getAttribute("carinfo1");
		goods_num=Integer.parseInt(carinfo1.get(goods_num).getGoods_num());
		System.out.println("ÂòÇÏ±âÇØÁ¦"+id +" : "+goods_num);
		FavoriteGoodsDTO dto = new FavoriteGoodsDTO(id, goods_num);
		FavoriteGoodsDAO dao = new FavoriteGoodsDAO();
		int cnt=dao.delete(dto);
		System.out.println(cnt);
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			System.out.println("Âò ÇØÁ¦ ¼º°ø");
			out.print("ÂòÇÏ±â");
		} else {
			System.out.println("Âò ÇØÁ¦ ½ÇÆÐ");
			out.print("ÂòÇÏ±âÇØÁ¦");
		}
	}

}
