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
		<h1>ȸ������</h1>
		<form action="JoinService" method="post">
			<table align="center">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" placeholder="���̵� �Է��ϼ���"></td>
					<td><input type="button" value="ID�ߺ�üũ" onclick="checkId()"></td>
					
				</tr>
				
				<tr>
					<td>PW</td>
					<td><input type="password" name="pw" placeholder="��й�ȣ�� �Է��ϼ���"></td>
				</tr>
				
				<tr>
					<td>PW Ȯ��</td>
					<td><input type="password" name="pw2" placeholder="��й�ȣ�� �Է��ϼ���"></td>
				</tr>
				
				<tr>
					<td>ADDRESS</td>
					<td><input type="text" name="address" placeholder="�ּҸ� �Է��ϼ���"></td>
				</tr>
				
				<tr>
					<td>TEL</td>
					<td><input type="tel" name="tel" placeholder="��ȭ��ȣ�� �Է��ϼ���" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
				</tr>
				
				
				<tr>
				<td colspan="2">
					<input type="reset" value="�ʱ�ȭ">
					<input type="submit" value="ȸ������">
				</td>
			
			</table>
		
		</form>
	
	</div>

</body>
</html>