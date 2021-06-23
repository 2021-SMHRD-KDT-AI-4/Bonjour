<%@page import="com.model.carinfoDTO"%>
<%@page import="java.util.ArrayList"%>
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

<!-- Header -->
         <header id="header">
            <a href="testmain.jsp" class="title">Bonjour</a>
         </header>
         
         <!-- Wrapper -->
         <div id="wrapper">
            
         <!-- Main -->
               <section id="main" class="wrapper">
                  <div class="inner">
                     <h1 class="major">차량 용어 설명</h1>
                     
                     <form action="carDetailinfo" method="post" name="form">
                     
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
                     
                     <select name="year" id="year" onchange="changes()">연식
                        <option value="">-연식-</option>
                     </select>
                     
                     <input type="submit" value="검색" calss="small_btn">
                     
                     </form>
                  </div>
               
               </section>
               
               <section class="wrapper style1 fade-up">
               <%
               		request.setCharacterEncoding("UTF-8");
               		carinfoDTO info = (carinfoDTO)session.getAttribute("carinfo");
               %>
               <div class="inner">
               <% if(info != null){ %>
               	<table>
               		<tr>
               			<td>연료 : <%=info.getFe() %></td>
               			<td>배기량 : <%=info.getCc() %></td>
               			<td>최대 출력 : <%=info.getMaxoutput() %></td>
               			<td>최대 토크 : <%=info.getMaxtorque() %></td>
               		</tr>
               		<tr>
               			<td>구동방식 : <%=info.getDrivesystem() %></td>
               			<td>승차인원 : <%=info.getPeople() %></td>
               			<td>휠 : <%=info.getWheel() %></td>
               			<td>타이어 : <%=info.getTire() %></td>	               			
               		</tr>
               		
               	</table>
               <% }else { %>
               		<section>
							<h1>차량 정보를 선택해 주세요</h1>
					</section>
               <% } %>
               
               </div>
               </section>
               
               <section class="wrapper style1 fade-up">
               	 <div class="features">
               		
						<section >
							<h3>배기량</h3>
							<p>엔진 실런더 내부의 피스톤이 왕복하는 구간의 총 용량(엔진의 크기)</p>
						</section>
						<section>
							<h3>최고출력</h3>
							<p>엔진이 낼 수 있는 최대 에너지의 양</p>
						</section>
						<section>
							<h3>최대토크 </h3>
							<p>엔진의 폭발 과정에서 크랭크 축에 발생하는 회전력</p>
						</section>
						<section>
							<h3>복합 연비 </h3>
							<p>도심연비와 고속도로주행 연비에 각각 55%, 45%의 가중치를 적용해 산출된 연비로, 복합연비를 기준으로 자동차의 연비등급을 부여합니다. </p>
						</section>
						<section>
							<h3>FF (Front engine - Front wheel drive)</h3>
							<p>엔진과 동력전달장치가 차량 앞에 장착되어 있습니다.</p>
						</section>
						<section>
							<h3>FR (Front engine - Rear wheel drive)</h3>
							<p>엔진은 차량 앞에 장착되고, 후륜이 구동되는 방식을 말합니다.</p>
						</section>
						<section>
							<h3>RR (Rear engine - Rear wheel drive)</h3>
							<p>엔진이 차량 뒤쪽에 배치되고, 후륜이 구동되는 방식입니다.</p>
						</section>
						<section>
							<h3>MR (Mid engine - Rear wheel drive)</h3>
							<p>엔진이 차량 가운데 배치되고, 후륜이 구동되는 방식입니다</p>
						</section>
						
						               		
               		
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