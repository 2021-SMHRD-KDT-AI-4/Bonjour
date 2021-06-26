<%@page import="com.model.GoodsInfoDTO"%>
<%@page import="com.model.GoodsInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
		<title>Hyperspace by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	
<style>
	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');

	*{
		font-family: 'Noto Serif KR', serif !important;
	}

</style>
	
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String car_num = request.getParameter("car_num");
	
	if(car_num == null){
		response.sendRedirect("carprice.jsp");
	}
	
	GoodsInfoDAO dao = new GoodsInfoDAO();
	GoodsInfoDTO dto = dao.select_goods(car_num);

%>

	<section class="wrapper">
		<div class="inner">
			<table>
				<tr>
					<td colspan="2">상세정보</td>
					
				</tr>
				<tr>
					<td>등록자 ID : </td>
					<td><%= dto.getId()%></td>
					
				</tr>
				<tr>
					<td>차량 번호 : </td>
					<td><%= dto.getCar_id()%></td>
					
				</tr>
				<tr>
					<td> 스마트키 :</td>
					<td><%= dto.getSmartkey() %></td>
					
				</tr>
				<tr>
					<td> 썬루프 : </td>
					<td><%= dto.getSunroof() %></td>
					
				</tr>
				<tr>
					<td> 네이게이션 : </td>
					<td><%= dto.getNavi()%></td>
					
				</tr>
				<tr>
					<td> 보험이력 : </td>
					<td><%= dto.getInsurance() %></td>
					
				</tr>

				
			
			</table>
		</div>
	</section>
</body>
</html>