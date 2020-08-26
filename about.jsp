<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ABOUT</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/about.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
    <div id="container1">
        <div id="header">
		<%
			request.setCharacterEncoding("euc-kr");
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
    <div id="keyimage1">
        <p>ABOUT</p>
    </div>
    <div id="container3">
        <div id="introLeft">
            <div id="introTitle">
                �ʽö��� ����
            </div>
            <div id="introContent">
                ���� CHOSI���� �ٻ� �ϻ�ӿ��� ���� �� �������ϴ� �����ε鿡�� ���� �Ļ縦 �����ϰ� �;����ϴ�.
                ���� �ڽ��� ��ȣ�� �´� ������ ���ö����� ������ �ٴ� �� �ֵ��� �����ڴ� �������� �����߽��ϴ�.
            </div>
        </div>
        <img src="images/brand_img2.jpg" id="introImg">
    </div>
    <div id="container3">
        <img src="images/brand_img.jpg" id="introImg">
        <div id="introRight">
            <div id="introTitle">
                �� ���� ���� �� ������ <br>���� �ֽ��ϴ�
            </div>
            <div id="introContent">
                �ʽö��� ���� ���� ������ ���Ͽ� ���������� ���� ������ rpc�� ���� ������ �׽�Ʈ�� ���Ͽ� �����ϰ� �ֽ��ϴ�. �Ұ��� û�� ȣ�ֻ� S���,
                A����� ��ɸ� ����Ͽ� ������ ǰ�������� ���� �ֻ��� ǰ���� �����մϴ�. ����, ���ֱ����� ���� �ܽľ��� ���� ö����
                �����ϸ� ������ �� ���� ���� ���� �� ����մϴ�. �������ٵ� �� ���� �������� ���ö��� ����մϴ�.
            </div>
        </div>
    </div>
    <div id="container3">
        <h2 id="title">CHOSI���� ����</h2>
        <div id="content">
            <img src="images/point_01.png">
            <p>�� ���� ��</p>
        </div>
        <div id="content">
            <img src="images/point_02.png">
            <p>���� ���̵�</p>
        </div>
        <div id="content">
            <img src="images/point_03.png">
            <p>û����</p>
        </div>
        <div id="content">
            <img src="images/point_05.png">
            <p>������ �Ļ�</p>
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