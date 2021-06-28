<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.carDAO"%>
<%@page import="com.model.JoinDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.carinfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');

	*{
		font-family: 'Noto Serif KR', serif !important;
	}
	
	

</style>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
     <style type="text/css">
      #market{
	height : 400px;
	width: 160px;
	border:3px solid #b74e91;
	background-color: lightgray;
	text-align: center;
	position: fixed;
	right: 0px;
	top: 80px;
	z-index : 1;
}
      #market_goods_fav{
	height : 40px;
	width: 160px;
	background-color: lightgray;
	border-bottom : 3px solid #b74e91;
	border-left : 3px solid #b74e91;
	border-right : 3px solid #b74e91;
	text-align: center;
	position: fixed;
	right: 0px;
	top: 480px;
	z-index : 1;
	
}

 	.fav_go {
 	display:block;
 	}
      </style>
</head>
<body>
<div id="market"> 
		<h4>최근 본 목록</h4>
<% 
			carDAO dao = new carDAO();
			
			request.setCharacterEncoding("UTF-8");
			Cookie [] cookies = request.getCookies();
			if(cookies != null){
				for(int i=0; i<cookies.length;i++){
					if(cookies[i].getName().length()>6){
					if(cookies[i].getName().subSequence(0, 7).equals("car_num")){
						carinfoDTO dto= dao.select_carinfo(cookies[i].getValue()); 
						if(dto != null){%>
					 	<img class=back width="80px" height="50px" alt="<%= dto.getUrl() %>" src= "images/Car_img/<%= dto.getUrl() %>" >
						<div style="color: black;"> <%= dto.getBrand()+"\n"+dto.getModel()+"\n"+dto.getD_model()+"\n"+dto.getGrade() %>  </div>
				<% 	}}
					}
				}
			}
		%>
		</div>
		<div id="market_goods_fav" OnClick="location.href ='myPage.jsp'" style="cursor:pointer; color: black;" >마이페이지</div>
 <%
 		request.setCharacterEncoding("UTF-8");
 		ArrayList<JoinDTO> info = (ArrayList<JoinDTO>)session.getAttribute("carinfo1");
 		carinfoDTO carinfo = (carinfoDTO)session.getAttribute("caryear");
 		String pastPrice = (String)session.getAttribute("price");
 		ArrayList<String> pre_list =(ArrayList<String>)session.getAttribute("pricepre"); 
 		String car_num;
 		String brand;
 		String model;
 		String d_model;
 		String grade;
 		String goods_num;
 		String year;
 		String km;
 		int price;
 		String fuel;
 		String site;
 		String url;
 		String pricePre = "";
		String total ="";
		String name;
		if(pre_list != null){
			if(pre_list.size()!=0){
				pricePre=pre_list.get(0);
			}
		}
		if(info != null){
	          if(info.size()!=0){
	             brand = info.get(0).getBrand();
	              model = info.get(0).getModel();
	              d_model = info.get(0).getD_model();
	              grade = info.get(0).getGrade();
	              year = info.get(0).getYear();
	              
	              //pricePre = (String)session.getAttribute("pricepre");           
	              total = brand+" "+model+" "+d_model+" "+grade+" "+carinfo.getYear()+" 년식 : "+pricePre+" 만원";
	           }
	          }
	          else{
	          total = "차량을 선택해주세요";
	       }
 		
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
                  
                     <h1 class="major">차량 가격 예측 </h1>
                     <h2 id="preprice" align="left"><%= total %></h2>
                  </div>
               </section>
               <section class="wrapper">
                     <div class="inner">

                     <form action="http://localhost:9000/carpred" method="post" name="form">

                     
                     <select name="brand" id="brand" onchange="changes('m')">
                        <option value="">-제조사-</option>
                         <option value="기아">기아</option>
                         <option value="현대">현대</option>
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
                     <span style="color:#222222">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                     <input type="button" value="검색하기" calss="small_btn" onclick="serch_car()">
                     
                     <select name="grade" id="grade" onchange="changes('y')">등급
                        <option value="">-등급-</option>
                     </select>
                     
                     <select name="year" id="year" onchange="changes('f')">연식
                        <option value="">-연식-</option>
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
                     
                     <span style="color:#222222">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                     <input type="submit" value="예측하기" calss="small_btn" >
                     <h1 class="major"></h1>
                     <!-- padding: 1em 6em 1em 1em 변경하기 -->
                     <input type = "text" name ="car_type" id="car_type" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="gear" id="gear" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="fuel" id="fuel" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="fe" id="fe" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="cc" id="cc" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="output" id="output" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="torque" id="torque" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="drivesys" id="drivesys" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="people" id="people" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="wheel" id="wheel" value="e" style="visibility: hidden;width: 0.9%">
                     <input type = "text" name ="tire" id="tire" value="e" style="visibility: hidden;width: 0.9%">
                     
                     
                     </form>
                  </div>
               </section >
               
               <section class="wrapper style1 fade-up">
               <div class="inner">
               


	<%
	if(pre_list != null){
		if(pre_list.size() != 0){
			%>
			<div align="center">
			<div style="display: inline-block; ">
			<canvas id="myChart1" width="500px" height="400" ></canvas></div>
			<div style="display: inline-block;">
			<canvas id="myChart" width="500px" height="400"></canvas>
			</div>
			</div>
			<script>
   var ctx = document.getElementById('myChart1');
   var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
         labels: ['신차가격', '중고차가격(예측)'],
         datasets: [{
            label: '가격 비교',
            data: [<%= pastPrice %>,<%= pricePre %>],
            backgroundColor: [
	              // 'rgba(255, 99, 132, 0.2)',
	              // 'rgba(54, 162, 235, 0.2)',
	              // 'rgba(255, 206, 86, 0.2)',
	               //'rgba(75, 192, 192, 0.2)',
	               'rgba(255, 255, 255, 0.8)',
	               'rgba(255, 255, 255, 0.8)'
	            ],
            fill:false,

            borderWidth: 1
         }]
      },
      options: {
         responsive: false,
         legend: {
				labels: {
					fontColor: "white",
					fontSize: 26
				}
			},
         scales: {
        	 
        	 xAxes: [{
                 ticks: {
              	  fontSize : 20,
              	  fontColor : 'rgba(255, 255, 255, 0.8)',
                    beginAtZero: true
                 }
              }],
            yAxes: [{
               ticks: {
            	  fontSize : 20,
            	  fontColor : 'rgba(255, 255, 255, 0.8)',
                  beginAtZero: true
               }
            }]
         },
      }
   });
</script>
				               				<script>
			   var ctx = document.getElementById('myChart');
			   var myChart = new Chart(ctx, {
			      type:'line',
			      data: {
			         labels: ['현재','1년 후','2년 후','3년 후','4년 후'],
			         datasets: [{
			            label: '차량 가격',
			            data: [<%=pre_list.get(0) %>, <%=pre_list.get(1) %>,<%=pre_list.get(2) %>, <%=pre_list.get(3) %>, <%=pre_list.get(4) %>],
			            backgroundColor: [
			            	'rgba(255, 255, 255, 0.3)',
			            	'rgba(255, 255, 255, 0.3)',
			            	'rgba(255, 255, 255, 0.3)',
			            	'rgba(255, 255, 255, 0.3)',
			            	'rgba(255, 255, 255, 0.3)'
			            ],
			            borderColor: [
			            	'rgba(255, 0, 0, 0.8)',
			            	'rgba(255, 0, 0, 0.8)',
			            	'rgba(255, 0, 0, 0.8)',
			            	'rgba(255, 0, 0, 0.8)',
			            	'rgba(255, 0, 0, 0.8)',
			            ],
			            borderWidth: 1.5
			         }]
			      },
			      options: {
			         responsive: false, // 차트 크기 조절
			         legend: {
							labels: {
								fontColor: "white",
								fontSize: 26
							}
						},
			         scales: {
			        	 xAxes: [{
			                 ticks: {
			              	  fontSize : 20,
			              	  fontColor : 'rgba(255, 255, 255, 0.8)',
			                    beginAtZero: true
			                 }
			              }],
			            yAxes: [{
			               ticks: {
			            	  fontSize : 20,
			            	  fontColor : 'rgba(255, 255, 255, 0.8)',
			                  beginAtZero: true
			               }
			            }]
			         },
			      }
			   });
			   </script><% 
		}
	}
	%>    			
	       	<h1 class="major"></h1>
	       	
	               		<table>

	               		<tr>
	               			<td>모델명</td>
	               			<td>가격</td>
	               			<td>&nbsp;&nbsp;&nbsp;사이트</td>
	               			<td align="center">알림</td>
	               			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜</td>
	               		</tr>
	<%
               			if(info != null ){
	               			if(info.size()!=0){
	               				%> 
	               					               				
	               				<%
	               				for(int i=0;i<info.size();i++){
		            	 			brand = info.get(i).getBrand();
		            	 			model = info.get(i).getModel();
		            	 			d_model = info.get(i).getD_model();
		            	 			grade = info.get(i).getGrade();
		            	 			year = info.get(i).getYear();
		            	 			
		            	 			url = info.get(i).getUrl();
		            	 			site = info.get(i).getSite();
		            	 			price = Integer.parseInt(info.get(i).getPrice());
		            	 			name = brand+" "+model+" "+d_model+" "+grade+" "+year;
		            	 			
		            	 			Integer.parseInt(pricePre);
		            	 			
		            	 			if(price < Integer.parseInt(pricePre)*0.5 ){
	            	 		%>	
	            	 		<tr style="background-color: #222222">
	            	 			<td><%=name %> </td>
	            	 			<td><%=price %></td>
	               				<td><a href="<%=url %>"><%=site %></a></td>
	               				<td><div style="color:white;background-color: red;text-align:center;">※주의※</div></td>
	               				<td> <input class="fav" type="button" value="찜하기" id="fav<%=i%>" onclick="favorite(this.id)"></td>
	               			</tr>
	            	 			
	            	 		<%		}else{ %>
	            	 		<tr style="background-color: #222222">
	            	 			<td><%=name %></td>
	            	 			<td><%=price %></td>
	               				<td><a href="<%=url %>"><%=site %></a></td>
	               				<td></td>
	               				<td> <input class="fav" type="button" value="찜하기" id="fav<%=i%>" onclick="favorite(this.id)"> </td>
	               				
	               			</tr>
	            	 			
	            	 			
	            	 		<%}
		            	 		}
	               			}
               			}else{ %>

	               		<!-- <tr>
	               			<td>모델명</td>
	               			<td>가격</td>
	               			<td>&nbsp;&nbsp;&nbsp;사이트</td>
	               			<td align="center">알림</td>
	               			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜</td>
	               		</tr> -->
								
               			<% } %>
               		
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
         		/* function sendurl(){
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
                        url : "http://localhost:9000/carpred",//서버 파일 이름
                        //contentType : "application/json; charset : UTF-8",
                        dataType : "json", //서버에서 오는 응답방식
                        success : function(data){
                              console.log(data);
                    
                    
         		},
                error : function(){
                    alert("실패!");
                 
                 }
              })
              } */
         
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
               //
               if(v=='m'){
                  $('#model').children("option").remove();
                  $('#d_model').children("option").remove();
                  $('#grade').children("option").remove();
                  $('#year').children("option").remove();
                  $('#model').html("<option value=''>-모델-</option>");
                  $('#d_model').html("<option value=''>-세부모델-</option>");
                  $('#grade').html("<option value=''>-등급--</option>");
                  $('#year').html("<option value=''>-연식--</option>");
                  $("#preprice").text("선택(1/5)");
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
                  $("#preprice").text("선택(2/5)             ");
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
                  $("#preprice").text("선택(3/5)             ");
                        for ( var i in data.d_model) { 
                              var option = "<option value='" + data.d_model[i].value + "'>" + data.d_model[i].value + "</option>";
                              console.log(option);
                              $('#grade').append(option);
                        }
               } else if (v=='y') {
                  $('#year').children("option").remove();
                  $('#year').html("<option value=''>-연식--</option>");
                  $("#preprice").text("선택(4/5)");
                  for ( var i in data.grade) { 
                              var option = "<option value='" + data.grade[i].value + "'>" + data.grade[i].value + "</option>";
                              console.log(option);
                              $('#year').append(option);
                        }
               }else if(v=='f'){
            	   $("#preprice").text("선택(5/5)             ");
               }
               },
               error : function(){
                  alert("실패!");
               
               }
            })
            }

            
              function serch_car() {
                  
                  var brand = $("#brand").val();
                  var model = $("#model").val();
                  var d_model = $("#d_model").val();
                  var grade = $("#grade").val();
                  var year = $("#year").val();
                  $("#preprice").text("차량검색완료");
         
                  $.ajax({
                      type : "POST",  // 데이터 전송 방식
                      data : {"brand" : brand,
                            "model" : model,
                            "d_model" : d_model,
                            "grade" : grade,
                            "year" : year}, // 서버로 보내는 값
                      url : "getModel2",//서버 파일 이름
                      //contentType : "application/json; charset : UTF-8",
                      dataType : "json", //서버에서 오는 응답방식
                      success : function(data){
                    	  console.log(data);
                    	  
                    	  
                    	  //$("#color").val(data.color[0].value);
                    	  $("#car_type").val(data.car_type[0].value);
                    	  $("#gear").val(data.gear[0].value);
                    	  $("#fuel").val(data.fuel[0].value);
                    	  
                    	  $("#fe").val(data.fe[0].value);
                    	  $("#cc").val(data.cc[0].value);
                    	  $("#output").val(data.output[0].value);
                    	  $("#torque").val(data.torque[0].value);
                    	  $("#people").val(data.people[0].value);
                    	  $("#wheel").val(data.wheel[0].value)
                    	  $("#tire").val(data.tire[0].value);
                    	  $("#drivesys").val(data.drivesys[0].value);
                    	  
                    	  
                    	  },
                          error : function(){
                        	  console.log("실패");
                          }
                      })
              }
              function favorite(v) {
            		var id =null;
            		var goods_num = v.substr(3);

                  <%
             		request.setCharacterEncoding("UTF-8");
                  ArrayList<JoinDTO> carinfo1 = (ArrayList<JoinDTO>)session.getAttribute("carinfo1");
             		MemberDTO member1 = (MemberDTO)session.getAttribute("info");
             		%>
             		<% if(member1 != null){%>
             		id ="<%= member1.getId()  %>";
             		<%} %>
            		if($("#"+v).val()=="찜하기"){
            			$.ajax({
            				type : "POST",
            				data : {
            					"goods_num" : goods_num,
            					"id" : id
            				},
            				url : "favoriteGoodsService",
            				dataType : "text",
            				success : function(data){
            					$("#"+v).val(data)
            				},
            				error : function(request,error){
            					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            				}
            			})
            	} else if($("#"+v).val()=="찜하기해제"){
            		$.ajax({
            			type : "POST",
            			data : {
            				"goods_num" : goods_num,
            				"id" : id
            			},
            			url : "disFavoriteGoodsService",
            			dataType : "text",
            			success : function(data){
            				$("#"+v).val(data)
            			},
            			error : function(){
            				alert("실패!!!!");
            			}
            		})
            	}
            	}
   </script>
</body>
</html>