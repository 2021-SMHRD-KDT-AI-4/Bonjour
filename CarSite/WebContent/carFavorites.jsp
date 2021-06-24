<%@page import="java.net.URI"%>
<%@page import="com.model.carinfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.FavoriteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	 FavoriteDAO dao = new FavoriteDAO();
	ArrayList<carinfoDTO> list  =dao.select_cars("1");
	%>
	
	<table>
		<%
		for(int i=0; i<list.size();i++){
			String brand =  list.get(i).getBrand();
			String model =  list.get(i).getModel();
			String d_model =  list.get(i).getD_model();
			String grade =  list.get(i).getGrade();
			String year =  list.get(i).getYear();
			%> <tr><td>	 <a href="carDetailinfo?brand=<%=brand%>&model=<%=model%>&d_model=<%=d_model%>&grade=<%=grade%>&year=<%=year%>">
			<%=
			brand+" "+model+" "+d_model+" "+grade+" "+year
			%> </a> </td> </tr>	<%
		}
		%>
	</table>
</body>
</html>