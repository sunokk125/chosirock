<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
<title>    ȸ������       </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>


<script language="javascript" src="js/js_package.js">
</script>

<body>
<center>
<font color="blue" size='6'><b> [ȸ�� ����]   </b></font><p>
<form method="post" action="insertMemberResult.jsp" name="newMem">
<table>
	<tr>
		<td>���̵� : </td>
		<td>
			<input type="text" name="id" size=12>
			<input type="button" value="���̵� �ߺ� Ȯ��" onClick="checkID()">
		</td>
	</tr>
	
	<tr>
		<td>��й�ȣ : </td>
		<td><input type="password" name="pwd" size=12></td>
	</tr>
	
	<tr>
		<td>��й�ȣ Ȯ�� : </td>
		<td><input type="password" name="pwdCk" size=12></td>
	</tr>
	
	<tr>
		<td>�̸� : </td>
		<td><input type="text" name="name" size=12></td>
	</tr>
	
	<tr>
		<td>�ֹι�ȣ : </td>
		<td><input type="text" name="rrn1" size=8> - <input type="password" name="rrn2"size=9></td>
	</tr>
	
	<tr>
		<td>���� : </td>
		<td><input type="radio" name="sex" value="��">��<input type="radio" name="sex" value="��">��</td>
	</tr>

	
	<tr>
		<td>�̸��� : </td>
		<td><input type="text" name="email1" size=12>@
			<select  name="email2">
				<option selected>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
			</select>
		</td>
	</tr>

	
	<tr>
		<td>�޴��� ��ȣ : </td>
		<td>
			<select name="phone1">
				<option selected>010</option>
				<option>011</option>
				<option>016</option>
			</select>
			-<input type="text" name="phone2" size=4>-<input type="text" name="phone3" size=4></td>
	</tr>
	
	<tr>
		<td>�ּ� : </td>
		<td><input type="text" name="zipcode"readOnly>
			<input type="button" value="�����ȣ�˻�" onClick="zipCheck()"><br>
            <input type="text" name="address1" placeholder="�ּ�" size=30 readOnly><br>
            <input type="text" name="address2" placeholder="�� �ּ�" size=30></td>
	</tr>
</table>
<input type=button value="ȸ������" onClick="checkUserValue()">  
<input type=reset value="��    ��">
</form>
</center>
</body>
</html>
