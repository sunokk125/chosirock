<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mypage.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script>
function check_searchId()
{
	if(document.searchId.name.value=="")
	{
		alert("�̸��� �Է��� �ּ���.");
    	document.searchId.name.focus();
    	return;		
	}
	if(document.searchId.rrn1.value=="")
	{
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���.");
    	document.searchId.rrn1.focus();
    	return;		
	}
	if(document.searchId.rrn2.value=="")
	{
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���.");
    	document.searchId.rrn2.focus();
    	return;		
	}
	document.searchId.submit();
}

	</script>
</head>
<body>
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%
			String id = (String)session.getAttribute("sid");

			if(id == null){
		%>
            <a href="join.jsp"> ȸ������ </a> | <a href="login.jsp"> �α��� </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> ���������� </a> | <a href="logout.jsp">�α׾ƿ�</a>
		<%
			}	
		%>
		
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">�����Ұ�</a></li>
                <li><a href="map.jsp">������ġ</a></li>
                <li><a href="countChoice.jsp">���ö� ����</a></li>
            </ul>
        </div>
    </div>
    <div id="container2">
        <div id="contentTitle">
            <h2 id="title">���̵� ã��</h2>
        </div>
        <div id="content">
            <form name="searchId" method="post" action="searchIdResult.jsp"> 


				 <table border=0 cellpadding=5 style="font-size:10pt;font-family:���� ���">
					
					 <tr>
						<td><font size=2>�̸� :  </font></td>
						<td><input type="text" name="name"></td>
					 </tr>
					 <tr>
						<td><font size=2>�ֹε�Ϲ�ȣ : </font></td>
						<td><input type="text" name="rrn1"> - <input type="password" name="rrn2"></td>
					 </tr>
				  </table><p>       
					 <input type="button" value="ã  ��" onClick="check_searchId()">&nbsp&nbsp&nbsp&nbsp<input type="reset" value="��  ��">
			  </form>
        </div>
    </div>
    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        ������ 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        �ּ� : ��û���� õ�Ƚ� ���ϱ� ��ȯ�� ���з� 91 | <a href="manager_login.html">������ �α���</a>
    </div>
</div>

</body>
</html>