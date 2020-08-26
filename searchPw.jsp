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
		alert("아이디를 입력해 주세요.");
    	document.searchPw.id.focus();
    	return;		
	}
	if(document.searchPw.name.value=="")
	{
		alert("이름을 입력해 주세요.");
    	document.searchPw.name.focus();
    	return;		
	}
	if(document.searchPw.rrn1.value=="")
	{
		alert("주민번호 앞자리를 입력해 주세요.");
    	document.searchPw.rrn1.focus();
    	return;		
	}
	if(document.searchPw.rrn2.value=="")
	{
		alert("주민번호 뒷자리를 입력해 주세요.");
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
            <a href="join.jsp"> 회원가입 </a> | <a href="login.jsp"> 로그인 </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> 마이페이지 </a> | <a href="logout.jsp">로그아웃</a>
		<%
			}	
		%>
		
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
        <div id="contentTitle">
            <h2 id="title">MyPage</h2>
        </div>
        <div id="content">
            <form name="searchPw" method="post" action="searchPwResult.jsp"> 

				 <table border=0 cellpadding=5 style="font-size:10pt;font-family:맑은 고딕">
					 
					 
					 <tr>
						<td><font size=2>아이디 : </font></td>
						<td><input type="text" name="id"></td>
					 </tr>
					 <tr>
						<td><font size=2>이름 :  </font></td>
						<td><input type="text" name="name"></td>
					 </tr>
					 <tr>
						<td><font size=2>주민등록번호 : </font></td>
						<td><input type="text" name="rrn1"> - <input type="password" name="rrn2"></td>
					 </tr>
				  </table><p>       
					 <input type="button" value="찾  기" onClick="check_searchPw()">&nbsp&nbsp&nbsp&nbsp<input type="reset" value="취  소">
			  </form>
        </div>
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