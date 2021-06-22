<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<style type="text/css">
		#login_form {
          display: inline-block;
          text-align: center;
          position: relative;
        }
		
		</style>

<body>
<article >
	<div id="login_form">
		<h1>로그인</h1>
		<form action="LoginService" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id"></td>
				</tr>
				
				<tr>
					<td>PW</td>
					<td><input type="password" name="pw"></td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
</article>



</body>
</html>