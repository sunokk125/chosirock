<%@ page contentType="text/html;charset=euc-kr" %>
<html><head><title> ���� �� ����   </title></head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">

	<script src="js/js_package.js" language="javascript">
	</script>
<body>
<center>
<font color="blue" size='6'><b>[���� �� ����]   </b></font><p>
<form action="manager_productChoice.jsp" method="post" name="countChoiceForm">
				<table>
					<tr>
						<td>���� �� �Է� : </td>
						<td><input type="text" name="count" placeholder="3~10���� ����"></td>
					</tr>
				</table>
				<input type="button" onClick="checkCount()" value="��  ��">
			</form>

</body>
</html>