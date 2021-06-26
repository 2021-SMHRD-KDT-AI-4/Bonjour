<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.carinfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	carinfoDTO carinfo = (carinfoDTO)session.getAttribute("car_info");
	String[] numColor = (String[])session.getAttribute("numColor");
	MemberDTO mdto = (MemberDTO)session.getAttribute("info");
	String car_num;
	String brand;
	String model;
	String d_model;
	String grade;
	String year;
	String fuel;
	String color;
	String price;
	String km;
    String id = "";
%>
              
<!-- Header -->
         <header id="header">
            <a href="testmain.jsp" class="title">Bonjour</a>
         </header>
         
         <!-- Wrapper -->
         <div id="wrapper">
            
         <!-- Main -->
               <section id="main" class="wrapper">
                  <div class="inner">
                     <h1 class="major">차량 매물 등록</h1>
                     
                     <form action="carRegistration" method="post" name="form">
                     
                     <select name="brand" id="brand" onchange="changes('m')">
                         <option value="">-제조사-</option>
                         <option value="현대">현대</option>
                         <option value="기아">기아</option>
                         <option value="르노삼성">르노삼성</option>
                         <option value="한국GM">한국GM</option>
                         <option value="제네시스">제네시스</option>
                         <option value="쌍용">쌍용</option>
                     </select>
                     
                     <select name="model" id="model" onchange="changes('d')">모델
                        <option value="">-모델-</option>
                        
                     </select>
                     
                     <select name="d_model" id="d_model" onchange="changes('g')">세부모델
                        <option value="">-세부모델-</option>
                     </select>
                     
                     <select name="grade" id="grade" onchange="changes('y')">등급
                        <option value="">-등급-</option>
                     </select>
                     
                     <select name="year" id="year" onchange="changes()">연식
                        <option value="">-연식-</option>
                     </select>
                     <select name="fuel" id="fuel" >연료
                        <option value="">-연료-</option>
                        <option value="가솔린">가솔린</option>
                        <option value="디젤">디젤</option>
                     </select>
                     <select name="color" id="color" ">색상
                        <option value="">-색상-</option>
                        <option value="흰색">흰색</option>
                        <option value="검정색">검정색</option>
                        <option value="회색">회색</option>
                        <option value="은색">은색</option>
                        <option value="진주색">진주색</option>
                        <option value="기타">기타</option>
                        
                     </select>
                     <input type="text" name="price" placeholder="차량가격입력 (만원)">
                   	 <input type="text" name="km" placeholder="주행거리입력 (Km)">
                     <input type="submit" value="등록" calss="small_btn">
                     
                     <input type="text" name="car_id" placeholder="차량번호입력 ">
                     <select name="smartkey">스마트키
                        <option value="">-스마트키 유/무-</option>
                        <option value="있음">있음</option>
                        <option value="없음">없음</option>
                     </select>
                     <select name="sunroof">썬루프
                        <option value="">-썬루프 유/무-</option>
                        <option value="있음">있음</option>
                        <option value="없음">없음</option>
                     </select>
                     <select name="navi" >네비게이션
                        <option value="">-네비게이션 유/무-</option>
                        <option value="있음">있음</option>
                        <option value="없음">없음</option>
                     </select>
                     <% if (mdto != null) { 
                     	id = mdto.getId();
                     }%>
                     
                     <input type="text" name="insurance" placeholder="보험이력입력 ">
                     <input type = "text" name ="id" value="<%= id %>" style="visibility: hidden;width: 0.9%">
                     
                     
                     
                     </form>
 
                  </div>
               
               </section>
               
               <section class="wrapper style1 fade-up">
               	<div class= "inner">
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
						brand = carinfo.getBrand();
						model = carinfo.getModel();
						d_model = carinfo.getD_model();
						grade = carinfo.getGrade();
						year = carinfo.getYear();
						car_num = numColor[0];
						color = numColor[1];
						price = numColor[2];
						km = numColor[3];
						fuel = numColor[4];
						
					
					%>
               			<tr>
               				<td><%= brand%></td>
               				<td><%= model%>&nbsp;<%= d_model%>&nbsp;<%= grade%></td>
               				<td><%= color %> </td>
               				<td><%= year %> </td>
               				<td><%= fuel %> </td>
               				<td><%= km %> </td>
               				<td><%= price %> </td>               			
               			</tr>
               			
               			
               		<%} %>
               		
               		</table>
               	</div>

               </section>

               
           </div>




      <!-- 스크립트릿 -->


      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         
         
         <script type="text/javascript">
                function changes(v) {
                                
                var brand = $("#brand").val();
                var model = $("#model").val();
                var d_model = $("#d_model").val();
                var grade = $("#grade").val();
                var year = $("#year").val();
               
               $.ajax({
               type : "POST",  // 데이터 전송 방식
               data : {"brand" : brand,
                     "model" : model,
                     "d_model" : d_model,
                     "grade" : grade,
                     "year" : year}, // 서버로 보내는 값
               url : "getModel",//서버 파일 이름
               //contentType : "application/json; charset : UTF-8",
               dataType : "json", //서버에서 오는 응답방식
               success : function(data){
                     console.log(data);               
               
               if(v=='m'){
                  $('#model').children("option").remove();
                  $('#d_model').children("option").remove();
                  $('#grade').children("option").remove();
                  $('#year').children("option").remove();
                  $('#model').html("<option value=''>-모델-</option>");
                  $('#d_model').html("<option value=''>-세부모델-</option>");
                  $('#grade').html("<option value=''>-등급--</option>");
                        $('#year').html("<option value=''>-연식--</option>");
                  for ( var i in data.brand) {
                              var option = "<option value='" + data.brand[i].value + "'>" + data.brand[i].value + "</option>";
                              console.log(option);
                              $('#model').append(option);
                        }      
               }
               else if (v=='d') {
                  $('#d_model').children("option").remove();
                  $('#grade').children("option").remove();
                  $('#year').children("option").remove();
                  $('#d_model').html("<option value=''>-세부모델-</option>");
                  $('#grade').html("<option value=''>-등급--</option>");
                        $('#year').html("<option value=''>-연식--</option>");
                  for ( var i in data.model) { 
                              var option = "<option value='" + data.model[i].value + "'>" + data.model[i].value + "</option>";
                              console.log(option);
                              $('#d_model').append(option);
                        }
               } else if (v=='g') {
                  $('#grade').children("option").remove();
                  $('#year').children("option").remove();
                  $('#grade').html("<option value=''>-등급--</option>");
                        $('#year').html("<option value=''>-연식--</option>"); 
                        for ( var i in data.d_model) { 
                              var option = "<option value='" + data.d_model[i].value + "'>" + data.d_model[i].value + "</option>";
                              console.log(option);
                              $('#grade').append(option);
                        }
               } else if (v=='y') {
                  $('#year').children("option").remove();
                  $('#year').html("<option value=''>-연식--</option>");
                  for ( var i in data.grade) { 
                              var option = "<option value='" + data.grade[i].value + "'>" + data.grade[i].value + "</option>";
                              console.log(option);
                              $('#year').append(option);
                        }
               }
               },
               error : function(){
                  alert("실패!");
               
               }
            })
          }

                
         	
         
   </script>
         
</body>
</html>