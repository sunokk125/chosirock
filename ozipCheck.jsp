<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head><title>�����ȣ�˻�/�ּ��ڵ��Է�</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<script language="javascript">	
	function getFocus()     //  �ε����ڸ��� ���� �Է��ϴ� �ؽ�Ʈ�ʵ忡 Ŀ���� ��ġ���� ��
	{
		document.zipForm.dong.focus();      //  zipForm.dong.focus(); �� ����ص� ������
	}

	function dongCheck()
	{		
		if(document.zipForm.dong.value =="")
		{
			alert("���̸��� �Է��ϼ���");
			document.zipForm.dong.focus();
			return;
		}
		document.zipForm.submit(); 
	}
</script>
<body onLoad="getFocus()"> <!-- �ε����ڸ��� ���� �Է��ϴ� �ؽ�Ʈ�ʵ忡 Ŀ���� ��ġ���� �� -->
  <center>
   <b><�����ȣ�˻�></b>
   <form name="zipForm" method="post" action="ozipCheckOK.jsp">
     <table> 
      <tr>                         <!-- ime-mode:active�� �����Ǹ� �ڵ����� �ѱ��Է¸��� ��ȯ��   -->
        <td>���̸� �Է� : <input name="dong" type="text" style="ime-mode:active">
          <input type="button" value="�˻�" onclick= "dongCheck();"></td>        
      </tr>
     </table>
   </form>
  </center>
 </body>
</html>