<%@page import="com.model.carinfoDTO"%>
<%@page import="com.model.FavoriteDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.JoinDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.FavoriteGoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

<style>
	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');

	*{
		font-family: 'Noto Serif KR', serif !important;
	}

</style>


</head>
<body>
	<header id="header">
		<a href="testmain.jsp" class="title">Bonjour</a>
	</header>

	<!-- Wrapper -->
	<div id="wrapper">
		<%
				MemberDTO member = (MemberDTO) session.getAttribute("info");
				FavoriteDAO FavoriteDAO = new FavoriteDAO();
				FavoriteGoodsDAO FavoriteGoodsDAO = new FavoriteGoodsDAO();
				ArrayList<JoinDTO> list = FavoriteGoodsDAO.select_goods(member.getId());
				ArrayList<carinfoDTO> list1 = FavoriteDAO.select_cars(member.getId());
				String mem_id = "";
				if (member != null){
					mem_id = member.getId();
				}else{
					mem_id = "로그인을 해주세요";
				}
				
				carinfoDTO carinfo = (carinfoDTO)session.getAttribute("car_info");
				String[] numColor = (String[])session.getAttribute("numColor");
				
				String car_num2;
				String brand2;
				String model2;
				String d_model2;
				String grade2;
				String year2;
				String fuel2;
				String color2;
				String price2;
				String km2;
			    
			%>
		
		<!-- Main -->
		<section id="main" class="wrapper">
			<div class="inner">
				<h1 class="major"><%=mem_id %>&nbsp;님의 페이지</h1>
				<h3 style="color:white;">차종 찜목록</h3>
				
	<table>
	
		<%
		for(int i=0; i<list1.size();i++){
			String brand =  list1.get(i).getBrand();
			String model =  list1.get(i).getModel();
			String d_model =  list1.get(i).getD_model();
			String grade =  list1.get(i).getGrade();
			String year =  list1.get(i).getYear();
			%> <tr><td>	 <a href="carDetailinfo?brand=<%=brand%>&model=<%=model%>&d_model=<%=d_model%>&grade=<%=grade%>&year=<%=year%>">
			<%=
			brand+" "+model+" "+d_model+" "+grade+" "+year
			%> </a> </td> </tr>	<%
		}
		%>
	</table>
				<h1 class="major"></h1>
				<h3 style="color:white;">매물 찜목록</h3>
				<%
					
				%>

				<table>
					<%
						for (int i = 0; i < list.size(); i++) {
						String brand = list.get(i).getBrand();
						String model = list.get(i).getModel();
						String d_model = list.get(i).getD_model();
						String grade = list.get(i).getGrade();
						String year = list.get(i).getYear();
					%>
					<tr>
						<td><a
							href="<%= list.get(i).getUrl() %> ">
								<%=brand + " " + model + " " + d_model + " " + grade + " " + year%>
						</a></td>
					</tr>
					<%
						}
					%>
				</table>
				
				<h1 class="major"></h1>
				<h3 style="color:white;">나의 등록 매물 </h3>
					<table>
						<tr>
               				<td> 제조사 </td>
               				<td> 모델 </td>
               				<td> 색상 </td>
               				<td> 연식 </td>
               				<td> 연료 </td>
               				<td> 주행거리 </td>
               				<td> 가격 </td>               			
               			</tr>
					<%
					//String model
					
					
					if (carinfo != null) {
						brand2 = carinfo.getBrand();
						model2 = carinfo.getModel();
						d_model2 = carinfo.getD_model();
						grade2 = carinfo.getGrade();
						year2 = carinfo.getYear();
						car_num2 = numColor[0];
						color2 = numColor[1];
						price2 = numColor[2];
						km2 = numColor[3];
						fuel2 = numColor[4];
						
					
					%>
               			<tr>
               				<td><%= brand2%></td>
               				<td><%= model2%>&nbsp;<%= d_model2%>&nbsp;<%= grade2%></td>
               				<td><%= color2 %> </td>
               				<td><%= year2 %> </td>
               				<td><%= fuel2 %> </td>
               				<td><%= km2 %> </td>
               				<td><%= price2 %> </td>               			
               			</tr>
               			
               			
               		<%} %>
               		
               		</table>
               	</div>

               </section>

			</div>

		</section>
	</div>




	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>