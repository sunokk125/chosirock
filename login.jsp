<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/menu.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #title {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin: 20px 0;
        }

        #loginForm {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
            border: 1px solid #cccccc;
            padding: 30px 60px 50px 60px;
            background-color: white;
        }

        input {
            border-radius: 3px;
            width: 200px;
            height: 24px;
        }
    </style>
</head>
<body>
<div id="wrap2">
    <div id="container1">
        <div id="header">
            <a href="join.jsp"> ȸ������ </a> | <a href="login.jsp"> �α��� </a>
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
    <div style="min-height: 791px">
        <form name="login" method="post" action="loginOK.jsp" id="loginForm">
            <p id="title">�ʽö� �α���</p>
            <table>
                <tr>
                    <td>
                        <input type="text" name="id" placeholder="���̵�">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" name="pwd" placeholder="�н�����">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="�α���">
                    </td>
                </tr>
            </table>
            <p><a href="join.jsp">ȸ������</a></p><p><a href="searchId.jsp">���̵�</a>/<a href="searchPw.jsp">��й�ȣ ã��</a></p>
        </form>
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