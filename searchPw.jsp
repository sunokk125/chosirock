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
	
function check_searchPw()
{	
	if(document.searchPw.id.value=="")
	{
		alert("���̵� �Է��� �ּ���.");
    	document.searchPw.id.focus();
    	return;		
	}
	if(document.searchPw.name.value=="")
	{
		alert("�̸��� �Է��� �ּ���.");
    	document.searchPw.name.focus();
    	return;		
	}
	if(document.searchPw.rrn1.value=="")
	{
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���.");
    	document.searchPw.rrn1.focus();
    	return;		
	}
	if(document.searchPw.rrn2.value=="")
	{
		alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���.");
    	document.searchPw.rrn2.focus();
    	return;		
	}
	document.searchPw.submit();
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
            <h2 id="title">MyPage</h2>
        </div>
        <div id="content">
            <form name="searchPw" method="post" action="searchPwResult.jsp"> 

				 <table border=0 cellpadding=5 style="font-size:10pt;font-family:���� ���">
					 
					 
					 <tr>
						<td><font size=2>���̵� : </font></td>
						<td><input type="text" name="id"></td>
					 </tr>
					 <tr>
						<td><font size=2>�̸� :  </font></td>
						<td><input type="text" name="name"></td>
					 </tr>
					 <tr>
						<td><font size=2>�ֹε�Ϲ�ȣ : </font></td>
						<td><input type="text" name="rrn1"> - <input type="password" name="rrn2"></td>
					 </tr>
				  </table><p>       
					 <input type="button" value="ã  ��" onClick="check_searchPw()">&nbsp&nbsp&nbsp&nbsp<input type="reset" value="��  ��">
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