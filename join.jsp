<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/join.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script src="js/js_package.js" language="javascript">
	</script>
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
    <div id="container2">
        <h2 id="title">ȸ�� ����</h2>
        <form method="post" action="joinOK.jsp" name="newMem" id="joinForm">
            <p id="j_title">���̵�</p>
            <input type="text" name="id" style="width:50%;height: 24px; padding:4px" placeholder="���̵�">
			<input type="button" value="���̵� �ߺ� Ȯ��" onClick="checkID()" style="width:30%;height: 36px; padding:4px">

            <p id="j_title">��й�ȣ</p>
            <input type="password" name="pwd" style="width:100%;height: 24px; padding:4px" placeholder="��й�ȣ">

            <p id="j_title">��й�ȣ Ȯ��</p>
            <input type="password" name="pwdCk" style="width:100%;height: 24px; padding:4px" placeholder="��й�ȣ Ȯ��">

            <p id="j_title">�̸�</p>
            <input type="text" name="name" style="width:100%;height: 24px; padding:4px" placeholder="�̸�">

            <p id="j_title">�ֹι�ȣ</p>
            <input type="text" name="rrn1" style="width:40%;height: 24px; padding:4px" placeholder="�ֹι�ȣ ���ڸ�"> -
            <input type="password" name="rrn2" style="width:40%;height: 24px; padding:4px; margin-bottom:10px;" placeholder="�ֹι�ȣ ���ڸ�">

            <div id="sDiv">
                <span id="j_title">����</span>
                <input type="radio" name="sex" value="��" style="margin-right: 10px;" checked>��<input type="radio" name="sex" value="��" style="margin-left: 50px; margin-right: 10px;">��
            </div>

            <p id="j_title">�̸���</p>
            <input type="text" name="email1" style="width:30%;height: 24px; padding:4px" placeholder="�̸���">@
            <select  name="email2" style="width:30%;height: 36px; padding:4px">
                <option selected>naver.com</option>
                <option>gmail.com</option>
                <option>daum.net</option>
            </select>

            <p id="j_title">�޴��� ��ȣ</p>
            <select name="phone1" style="width:20%;height: 36px; padding:4px">
                <option selected>010</option>
                <option>011</option>
                <option>016</option>
            </select>
            -<input type="text" name="phone2" style="width:20%;height: 24px; padding:4px">-<input type="text" name="phone3" style="width:20%;height: 24px; padding:4px">

            <p id="j_title">�ּ�</p>
            <input type="text" name="zipcode" style="width:30%; height: 24px; padding:4px" readOnly>
			<input type="button" value="�����ȣ�˻�" onClick="zipCheck()" style="width:30%;height: 36px; padding:4px"><br><br>
            <input type="text" name="address1" style="width:100%; height: 24px; padding:4px" placeholder="�ּ�" readOnly><br><br>
            <input type="text" name="address2" style="width:100%; height: 24px; padding:4px" placeholder="�� �ּ�">
            <div id="submitForm">
                <input type="button" value="ȸ������" onClick="checkUserValue()" style="width: 103%; height: 36px">

            </div>
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