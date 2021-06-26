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
import com.model.GoodsDTO;
import com.model.GoodsInfoDAO;
import com.model.GoodsInfoDTO;
import com.model.JoinDTO;
import com.model.carDAO;
import com.model.carinfoDTO;

@WebServlet("/carRegistration")
public class carRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String d_model = request.getParameter("d_model");
		String grade = request.getParameter("grade");
		String year = request.getParameter("year");
		String color = request.getParameter("color");
		String price = request.getParameter("price");
		String km = request.getParameter("km");
		String fuel = request.getParameter("fuel");
		String site = "차나와";
		String url = "http://localhost:8082/CarSite/goodslist.jsp?&car_num=";
		
		carinfoDTO dto = new carinfoDTO(brand, model, d_model, grade, year);
		
		carDAO dao = new carDAO();
		GoodsDAO gdao = new GoodsDAO();
		String car_num = dao.select_car_num(dto);
		System.out.println(car_num);
		
		String[] numColor = {car_num, color, price, km, fuel};
		// car_goods에 추가
		GoodsDTO gdto = new GoodsDTO(car_num, year, km, price, fuel, site, url);
		
		// goods_info에 추가
		String id = request.getParameter("id");
		String car_id = request.getParameter("car_id");
		String smartkey = request.getParameter("smartkey");
		String sunroof = request.getParameter("sunroof");
		String navi = request.getParameter("navi");
		String insurance = request.getParameter("insurance");
		
		GoodsInfoDTO gidto = new GoodsInfoDTO(id, car_id, smartkey, sunroof, navi, insurance);
		GoodsInfoDAO gidao = new GoodsInfoDAO();
		
		int cnt = gdao.insertGoods(gdto);
		int cnt2 = gidao.insertRegis(gidto);
		
		
		String goods_num = "";
		if(cnt > 0 && cnt2>0) {
			System.out.println("매물등록성공");
			GoodsDTO gdto2 = new GoodsDTO(car_num, year, km, price, fuel);
			goods_num = gdao.select_goodsNum(gdto2);
			System.out.println();
			url = url+goods_num;
			GoodsDTO gdto3 = new GoodsDTO(car_num, year, km, price, fuel, site, url);
			int cnt3 = gdao.update_good_num(gdto3);
			if(cnt3 > 0) {
				System.out.println("업데이트성공");
			}
			
			
		}else {
			System.out.println("매물등록실패");
		}
		
		
		if (dto != null) {
			session.setAttribute("car_info", dto);
			session.setAttribute("numColor", numColor);
			
		}else {

		}
		response.sendRedirect("registration.jsp");
		
		
		
		
		
	}
	

}
