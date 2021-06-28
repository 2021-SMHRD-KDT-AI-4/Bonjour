<%@page import="com.model.JoinDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.carinfoDTO"%>
<%@page import="com.model.MemberDTO"%>
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
<body class="is-preload">
							<% 
							MemberDTO info = (MemberDTO)session.getAttribute("info");
							%>

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
						<% if(info != null){%>
							<li><%= info.getId()%>&nbsp;님 </li>
							<li><a href="LogoutService">로그아웃</a></li>
						<%}else{%>
							<li><a href="login.html">로그인</a></li>
							<li><a href="join.html">회원가입</a></li>
						<% } %>
							<li><a href="#lookcar">중고차 검색</a></li>
							<li><a href="#lookdetail" >차량정보</a></li>
							<li><a href="#lookdetail2">매물등록</a></li>
							<li><a href="#mypage">마이페이지</a></li>
							
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/car111.jpg')" >
						<div class="inner">
							<h1>Pick your car !</h1>

							
							<% if(info == null){ %> <!-- 로그인 안했을 떄 -->
							<p style="color:black;">머신러닝 기반 중고차 가격 예측 서비스<br/>
							봉주르</p>
							<% }else{ %> <!-- 로그인 했을 때 -->
							<p style="color:black;"><%=info.getId() %>&nbsp;님 환영합니다.</p>
							<%} %>
							<ul class="actions">
								<li><a href="#one" class="button scrolly">Go!</a></li>
							</ul>
						</div>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 spotlights">
						<%-- <section >
							<a href="#" class="image"></a>
							<div class="content">
								<div class="inner">
									<h2>  로그인 	/	회원가입</h2>
									<h2>			</h2>
									<h2>			</h2>
									<ul class="actions">
										<li><a href="join.html" class="button">회원가입</a></li>
										<% if(info == null){ %> <!-- 로그인 안했을 떄 -->
										
										<li><a href="login.html" class="button">로그인</a></li>
										
										<% }else{ %> <!-- 로그인 했을 때 -->
										
										<li><a href="LogoutService" class="button">로그아웃</a></li>
										
										<% } %>
										
									</ul>
								</div>
							</div>
						</section> --%>
						<section id="lookcar">
							<a href="#" class="image"><img src="images/car06.jpg"  data-position="top center" /></a>
							<div class="content">
								<div class="inner">
									<h2>가격 예측 보기</h2>
									<p style="color:white;">차량을 선택하여 예측 가격을 확인할 수 있습니다.</p>
									<ul class="actions">
										<li><a href="carprice.jsp" class="button">가격 예측 보기</a></li>
									</ul>
								</div>
							</div>
						</section>
						<section id="lookdatail">
							<a href="#" class="image"><img src="images/car03.jpg" alt="" data-position="25% 25%" /></a>
							<div class="content">
								<div class="inner">
									<h2>차량 정보 보기</h2>
									<p style="color:white;">차량 정보를 확인할 수 있습니다.</p>
									<ul class="actions">
										<li><a href="cardetail.jsp" class="button">차량 정보 보기</a></li>
									</ul>
								</div>
							</div>
						</section>
						
						<section id="lookdatail2">
							<a href="#" class="image"><img src="images/car02.jpg" alt="" data-position="25% 25%" /></a>
							<div class="content">
								<div class="inner">
									<h2>매물 등록 하기</h2>
									<p style="color:white;">자신의 차량을 등록할 수 있습니다.</p>
									<ul class="actions">
										<li><a href="registration.jsp" class="button">매물 등록 하기</a></li>
									</ul>
								</div>
							</div>
						</section>
						
						<section id="mypage">
							<a href="#" class="image"><img src="images/car04.jpg" alt="" data-position="25% 25%" /></a>
							<div class="content">
								<div class="inner">
									<h2>My page</h2>
									<p style="color:white;">찜한 목록을 확인할 수 있습니다.</p>
									<ul class="actions">
										<li><a href="myPage.jsp" class="button">My page</a></li>
									</ul>
								</div>
							</div>
						</section>
					</section>
<!-- 
				Two
					<section id="two" class="wrapper style3 fade-up">
						<div class="inner">
							<h2>What we do</h2>
							<p>Phasellus convallis elit id ullamcorper pulvinar. Duis aliquam turpis mauris, eu ultricies erat malesuada quis. Aliquam dapibus, lacus eget hendrerit bibendum, urna est aliquam sem, sit amet imperdiet est velit quis lorem.</p>
							<div class="features">
								<section>
									<span class="icon solid major fa-code"></span>
									<h3>Lorem ipsum amet</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
								<section>
									<span class="icon solid major fa-lock"></span>
									<h3>Aliquam sed nullam</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
								<section>
									<span class="icon solid major fa-cog"></span>
									<h3>Sed erat ullam corper</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
								<section>
									<span class="icon solid major fa-desktop"></span>
									<h3>Veroeros quis lorem</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
								<section>
									<span class="icon solid major fa-link"></span>
									<h3>Urna quis bibendum</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
								<section>
									<span class="icon major fa-gem"></span>
									<h3>Aliquam urna dapibus</h3>
									<p>Phasellus convallis elit id ullam corper amet et pulvinar. Duis aliquam turpis mauris, sed ultricies erat dapibus.</p>
								</section>
							</div>
							<ul class="actions">
								<li><a href="generic.html" class="button">Learn more</a></li>
							</ul>
						</div>
					</section> -->


			</div>

		
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>