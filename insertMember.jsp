<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
<title>    회원가입       </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>


<script language="javascript" src="js/js_package.js">
</script>

<body>
<center>
<font color="blue" size='6'><b> [회원 가입]   </b></font><p>
<form method="post" action="insertMemberResult.jsp" name="newMem">
<table>
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="text" name="id" size=12>
			<input type="button" value="아이디 중복 확인" onClick="checkID()">
		</td>
	</tr>
	
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="pwd" size=12></td>
	</tr>
	
	<tr>
		<td>비밀번호 확인 : </td>
		<td><input type="password" name="pwdCk" size=12></td>
	</tr>
	
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" size=12></td>
	</tr>
	
	<tr>
		<td>주민번호 : </td>
		<td><input type="text" name="rrn1" size=8> - <input type="password" name="rrn2"size=9></td>
	</tr>
	
	<tr>
		<td>성별 : </td>
		<td><input type="radio" name="sex" value="남">남<input type="radio" name="sex" value="여">여</td>
	</tr>

	
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email1" size=12>@
			<select  name="email2">
				<option selected>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
			</select>
		</td>
	</tr>

	
	<tr>
		<td>휴대폰 번호 : </td>
		<td>
			<select name="phone1">
				<option selected>010</option>
				<option>011</option>
				<option>016</option>
			</select>
			-<input type="text" name="phone2" size=4>-<input type="text" name="phone3" size=4></td>
	</tr>
	
	<tr>
		<td>주소 : </td>
		<td><input type="text" name="zipcode"readOnly>
			<input type="button" value="우편번호검색" onClick="zipCheck()"><br>
            <input type="text" name="address1" placeholder="주소" size=30 readOnly><br>
            <input type="text" name="address2" placeholder="상세 주소" size=30></td>
	</tr>
</table>
<input type=button value="회원가입" onClick="checkUserValue()">  
<input type=reset value="취    소">
</form>
</center>
</body>
</html>
