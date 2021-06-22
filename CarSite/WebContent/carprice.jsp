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
                     
                     <form action="pricePre" method="post" name="form">
                     
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
                     
                     <input type="button" value="검색" calss="small_btn">
                     
                     </form>
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
                          
               alert(brand,model,d_model,grade,year);
               
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