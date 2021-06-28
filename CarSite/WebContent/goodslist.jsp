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
		<div id="detail_info">
		<h3 style="color:white;"><a href="testmain.jsp">Bonjour</a></h3>
			<h1 style="color:white;"> 상세 정보</h1>
			<h1 class="major"></h1>
			<table>
				<tr>
					<td align="center">등록자 ID : </td>
					<td align="center"><%= dto.getId()%></td>
					
				</tr>
				<tr>
					<td align="center">차량 번호 : </td>
					<td align="center"><%= dto.getCar_id()%></td>
					
				</tr>
				<tr>
					<td align="center"> 스마트키 :</td>
					<td align="center"><%= dto.getSmartkey() %></td>
					
				</tr>
				<tr>
					<td align="center"> 썬루프 : </td>
					<td align="center"><%= dto.getSunroof() %></td>
					
				</tr>
				<tr>
					<td align="center"> 네이게이션 : </td>
					<td align="center"><%= dto.getNavi()%></td>
					
				</tr>
				<tr>
					<td align="center"> 보험이력 : </td>
					<td align="center"><%= dto.getInsurance() %></td>
					
				</tr>

				
			
			</table>
		</div>
	</section>
</body>
</html>