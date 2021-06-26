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

</head>
<body>
	<header id="header">
		<a href="testmain.jsp" class="title">Bonjour</a>
	</header>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<section id="main" class="wrapper">
			<div class="inner">
				<h1 class="major">My Page</h1>
				<h3>차종 찜목록</h3>
				<%
					MemberDTO member = (MemberDTO) session.getAttribute("info");
				FavoriteDAO FavoriteDAO = new FavoriteDAO();
				FavoriteGoodsDAO FavoriteGoodsDAO = new FavoriteGoodsDAO();
				ArrayList<JoinDTO> list = FavoriteGoodsDAO.select_goods(member.getId());
				ArrayList<carinfoDTO> list1 = FavoriteDAO.select_cars(member.getId());
				%>
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

				<h3>매물 찜목록</h3>
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