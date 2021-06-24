<%@page import="java.util.ArrayList"%>
<%@page import="com.model.carinfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

</head>
<body>
 <%
 		request.setCharacterEncoding("UTF-8");
 		ArrayList<carinfoDTO> info = (ArrayList<carinfoDTO>)session.getAttribute("carinfo");
 		
 		String price = "";
 		String brand = "";
		String model = "";
		String d_model = "";
		String grade = "";
		String year = "";
		String url = "";
		String site ="";
		int oldprice =0;
		String pricePre="";
		
		String carinfo = "";
 		if(info != null){
 			brand = info.get(0).getBrand();
 			model = info.get(0).getModel();
 			d_model = info.get(0).getD_model();
 			grade = info.get(0).getGrade();
 			year = info.get(0).getYear();
 			
 			pricePre = (String)session.getAttribute("pricepre");  			
 			price = brand+" "+model+" "+d_model+" "+grade+" "+year+" 년식 : "+pricePre+" 만원";
 		}else{
 			price = "차량을 선택해주세요";
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
                     <h2 id="preprice" align="right"><%=price %></h2>
                  </div>
               </section>
               <section class="wrapper">
                     <div class="inner">

                     <form action="http://localhost:9000/carpred" method="post" name="form">

                     
                     <select name="brand" id="brand" onchange="changes('m')">
                        <option value="">-제조사-</option>
                         <option value="기아">기아</option>
                         <option value="현대">현대</option>
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
                     
                     <input type="button" value="검색하기" calss="small_btn" onclick="serch_car()">
                     <input type="submit" value="예측하기" calss="small_btn" >
                     <hr>
                     <input type = "text" name ="car_type" id="car_type" value="e">
                     <input type = "text" name ="gear" id="gear" value="e">
                     <input type = "text" name ="fuel" id="fuel" value="e">
                     <input type = "text" name ="fe" id="fe" value="e">
                     <input type = "text" name ="cc" id="cc" value="e">
                     <input type = "text" name ="output" id="output" value="e">
                     <input type = "text" name ="torque" id="torque" value="e">
                     <input type = "text" name ="drivesys" id="drivesys" value="e">
                     <input type = "text" name ="people" id="people" value="e">
                     <input type = "text" name ="wheel" id="wheel" value="e">
                     <input type = "text" name ="tire" id="tire" value="e">
                     
                     
                     </form>
                  </div>
               </section >
               
               <section class="wrapper style1 fade-up">
               <div class="inner">
               		<table>
               			
               			<%
               			if(info != null){
	               			for(int i=0;i<info.size();i++){
	            	 			brand = info.get(i).getBrand();
	            	 			model = info.get(i).getModel();
	            	 			d_model = info.get(i).getD_model();
	            	 			grade = info.get(i).getGrade();
	            	 			year = info.get(i).getYear();
	            	 			url = info.get(i).getUrl();
	            	 			site = info.get(i).getSite();
	            	 			oldprice = Integer.parseInt(info.get(i).getOldprice());
	            	 			carinfo = brand+" "+model+" "+d_model+" "+grade+" "+year;
	            	 			
	            	 			
	            	 			if(oldprice < Integer.parseInt(pricePre)*0.5 || oldprice > Integer.parseInt(pricePre)*1.5){
            	 		%>	
            	 		<tr>
            	 			<td><%=carinfo %> </td>
            	 			<td><%=oldprice %> 허위 매물 주의!!<td>
               				<td><a href="<%=url %>"><%=site %></a></td>
               				
               			</tr>
            	 			
            	 		<%		}else{ %>
            	 		<tr>
            	 			<td><%=carinfo %></td>
            	 			<td><%=oldprice %><td>
               				<td><a href="<%=url %>"><%=site %></a></td>
               				
               			</tr>
            	 			
            	 			
            	 		<%}
	            	 		}
               			}else{ %>
               			<tr>
            	 			<td></td>
            	 			<td></td>
               				<td></td>
               			</tr>
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
                  $("#preprice").text("선택(2/5)");
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
                  $("#preprice").text("선택(3/5)");
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
            	   $("#preprice").text("선택(5/5)");
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

   </script>
</body>
</html>