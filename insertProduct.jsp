<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
<title>    ���� ���       </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>


<script language="javascript" src="js/js_package.js">
</script>

<body>
<center>
<font color="blue" size='6'><b> [�ű� ���� ���]   </b></font><p>
<form method="post" action="insertProductResult.jsp" name="newPrd">
<table>
	<tr>
		<td>������ : </td>
		<td><input type="text" name="name" size=12></td>
	</tr>
	
	<tr>
		<td>���� : </td>
		<td><input type="text" name="price" size=12></td>
	</tr>
	<tr>
		<td>Į�θ� : </td>
		<td><input type="text" name="cal" size=12></td>
	</tr>
	
	<tr>
		<td>������(g) : </td>
		<td><input type="text" name="mass" size=12></td>
	</tr>
	
	<tr>
		<td>���� ���� : </td>
		<td><textarea name="description" rows="5" cols="30"></textarea></td>
	</tr>

	
	<tr>
		<td>�̹��� : </td>
		<td><input type="text" name="imgPath" size=12></td>
	</tr>

</table>
<input type=button value="�������" onClick="checkPrdValue()">  
<input type=reset value="��    ��">
</form>
</center>
</body>
</html>
