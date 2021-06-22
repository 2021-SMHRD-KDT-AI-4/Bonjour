<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div>
		<h1>회원가입</h1>
		<form action="JoinService" method="post">
			<table align="center">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" placeholder="아이디를 입력하세요"></td>
					<td><input type="button" value="ID중복체크" onclick="checkId()"></td>
					
				</tr>
				
				<tr>
					<td>PW</td>
					<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				
				<tr>
					<td>PW 확인</td>
					<td><input type="password" name="pw2" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				
				<tr>
					<td>ADDRESS</td>
					<td><input type="text" name="address" placeholder="주소를 입력하세요"></td>
				</tr>
				
				<tr>
					<td>TEL</td>
					<td><input type="tel" name="tel" placeholder="전화번호를 입력하세요" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
				</tr>
				
				
				<tr>
				<td colspan="2">
					<input type="reset" value="초기화">
					<input type="submit" value="회원가입">
				</td>
			
			</table>
		
		</form>
	
	</div>

</body>
</html>