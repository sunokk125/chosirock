<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
<title>    반찬 등록       </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>


<script language="javascript" src="js/js_package.js">
</script>

<body>
<center>
<font color="blue" size='6'><b> [신규 반찬 등록]   </b></font><p>
<form method="post" action="insertProductResult.jsp" name="newPrd">
<table>
	<tr>
		<td>반찬명 : </td>
		<td><input type="text" name="name" size=12></td>
	</tr>
	
	<tr>
		<td>가격 : </td>
		<td><input type="text" name="price" size=12></td>
	</tr>
	<tr>
		<td>칼로리 : </td>
		<td><input type="text" name="cal" size=12></td>
	</tr>
	
	<tr>
		<td>제공량(g) : </td>
		<td><input type="text" name="mass" size=12></td>
	</tr>
	
	<tr>
		<td>반찬 설명 : </td>
		<td><textarea name="description" rows="5" cols="30"></textarea></td>
	</tr>

	
	<tr>
		<td>이미지 : </td>
		<td><input type="text" name="imgPath" size=12></td>
	</tr>

</table>
<input type=button value="반찬등록" onClick="checkPrdValue()">  
<input type=reset value="취    소">
</form>
</center>
</body>
</html>
