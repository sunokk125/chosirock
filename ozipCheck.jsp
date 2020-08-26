<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head><title>우편번호검색/주소자동입력</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<script language="javascript">	
	function getFocus()     //  로딩되자마자 동을 입력하는 텍스트필드에 커서를 위치시켜 줌
	{
		document.zipForm.dong.focus();      //  zipForm.dong.focus(); 로 사용해도 무방함
	}

	function dongCheck()
	{		
		if(document.zipForm.dong.value =="")
		{
			alert("동이름을 입력하세요");
			document.zipForm.dong.focus();
			return;
		}
		document.zipForm.submit(); 
	}
</script>
<body onLoad="getFocus()"> <!-- 로딩되자마자 동을 입력하는 텍스트필드에 커서를 위치시켜 줌 -->
  <center>
   <b><우편번호검색></b>
   <form name="zipForm" method="post" action="ozipCheckOK.jsp">
     <table> 
      <tr>                         <!-- ime-mode:active로 설정되면 자동으로 한글입력모드로 전환됨   -->
        <td>동이름 입력 : <input name="dong" type="text" style="ime-mode:active">
          <input type="button" value="검색" onclick= "dongCheck();"></td>        
      </tr>
     </table>
   </form>
  </center>
 </body>
</html>