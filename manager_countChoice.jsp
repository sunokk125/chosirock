<%@ page contentType="text/html;charset=euc-kr" %>
<html><head><title> 반찬 수 선택   </title></head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">

	<script src="js/js_package.js" language="javascript">
	</script>
<body>
<center>
<font color="blue" size='6'><b>[반찬 수 선택]   </b></font><p>
<form action="manager_productChoice.jsp" method="post" name="countChoiceForm">
				<table>
					<tr>
						<td>반찬 수 입력 : </td>
						<td><input type="text" name="count" placeholder="3~10까지 선택"></td>
					</tr>
				</table>
				<input type="button" onClick="checkCount()" value="다  음">
			</form>

</body>
</html>