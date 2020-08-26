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
            <a href="join.jsp"> 회원가입 </a> | <a href="login.jsp"> 로그인 </a>
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">반찬소개</a></li>
                <li><a href="map.jsp">매장위치</a></li>
                <li><a href="countChoice.jsp">도시락 제작</a></li>
            </ul>
        </div>
    </div>
    <div id="container2">
        <h2 id="title">회원 가입</h2>
        <form method="post" action="joinOK.jsp" name="newMem" id="joinForm">
            <p id="j_title">아이디</p>
            <input type="text" name="id" style="width:50%;height: 24px; padding:4px" placeholder="아이디">
			<input type="button" value="아이디 중복 확인" onClick="checkID()" style="width:30%;height: 36px; padding:4px">

            <p id="j_title">비밀번호</p>
            <input type="password" name="pwd" style="width:100%;height: 24px; padding:4px" placeholder="비밀번호">

            <p id="j_title">비밀번호 확인</p>
            <input type="password" name="pwdCk" style="width:100%;height: 24px; padding:4px" placeholder="비밀번호 확인">

            <p id="j_title">이름</p>
            <input type="text" name="name" style="width:100%;height: 24px; padding:4px" placeholder="이름">

            <p id="j_title">주민번호</p>
            <input type="text" name="rrn1" style="width:40%;height: 24px; padding:4px" placeholder="주민번호 앞자리"> -
            <input type="password" name="rrn2" style="width:40%;height: 24px; padding:4px; margin-bottom:10px;" placeholder="주민번호 뒷자리">

            <div id="sDiv">
                <span id="j_title">성별</span>
                <input type="radio" name="sex" value="남" style="margin-right: 10px;" checked>남<input type="radio" name="sex" value="여" style="margin-left: 50px; margin-right: 10px;">여
            </div>

            <p id="j_title">이메일</p>
            <input type="text" name="email1" style="width:30%;height: 24px; padding:4px" placeholder="이메일">@
            <select  name="email2" style="width:30%;height: 36px; padding:4px">
                <option selected>naver.com</option>
                <option>gmail.com</option>
                <option>daum.net</option>
            </select>

            <p id="j_title">휴대폰 번호</p>
            <select name="phone1" style="width:20%;height: 36px; padding:4px">
                <option selected>010</option>
                <option>011</option>
                <option>016</option>
            </select>
            -<input type="text" name="phone2" style="width:20%;height: 24px; padding:4px">-<input type="text" name="phone3" style="width:20%;height: 24px; padding:4px">

            <p id="j_title">주소</p>
            <input type="text" name="zipcode" style="width:30%; height: 24px; padding:4px" readOnly>
			<input type="button" value="우편번호검색" onClick="zipCheck()" style="width:30%;height: 36px; padding:4px"><br><br>
            <input type="text" name="address1" style="width:100%; height: 24px; padding:4px" placeholder="주소" readOnly><br><br>
            <input type="text" name="address2" style="width:100%; height: 24px; padding:4px" placeholder="상세 주소">
            <div id="submitForm">
                <input type="button" value="회원가입" onClick="checkUserValue()" style="width: 103%; height: 36px">

            </div>
        </form>
    </div>

    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        고객센터 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        주소 : 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_login.html">관리자 로그인</a>
    </div>

</div>
</body>
</html>