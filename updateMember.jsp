<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>회원 정보 수정 </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<script language="javascript" src="js/js_package.js">
</script>
<body>

<%	 
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";  
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("id");   
	 String jsql = "select * from users where id = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	String id = rs.getString("id");
    String pwd =  rs.getString("password");	
	String name = rs.getString("name");
    String rrn =  rs.getString("rrn");	
    String sex =  rs.getString("sex");	
    String email =  rs.getString("email");	
    String phone =  rs.getString("phone");
    String zipcode =  rs.getString("zipcode");
    String address1 =  rs.getString("address1");
    String address2 =  rs.getString("address2");
%>

<center>
<font color="blue" size='6'><b>[회원 정보 수정] </b></font><p>
	<form method="post" action="updateMemberResult.jsp" name="newMem">
	<table>
		<tr>
			<td width=100>ID</td>
			<td><input type="hidden" name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pwd" value="<%=pwd%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td>
<%
	    	String[] rrnArr = rrn.split("-");
%>		
		    <input type="text" name="rrn1" value="<%=rrnArr[0]%>" size="6"> -
			<input type="text" name="rrn2" value="<%=rrnArr[1]%>" size="7">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
<%
		if(sex.equals("남"))
		{
%>
				<input type="radio" name="sex" value="남" checked>남
				<input type="radio" name="sex" value="여">여
<%
		}	
		else
		{
%>
				<input type="radio" name="sex" value="남">남
				<input type="radio" name="sex" value="여" checked>여
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
<%
	    	String[] emailArr = email.split("@");  

			String[] emailSelected = new String[3]; 

			if(emailArr[1].equals("naver.com"))
			{
				emailSelected[0] = "selected";
			}  
			else if(emailArr[1].equals("gmail.com"))
			{
				emailSelected[1] = "selected";
			}
			else if(emailArr[1].equals("daum.net"))
			{
				emailSelected[2] = "selected";
			}

%>
		    <input type="text" name="email1" value="<%=emailArr[0]%>">
			<select name="email2">      
				<option value="naver.com" <%=emailSelected[0]%>>naver.com
				<option value="gmail.com" <%=emailSelected[1]%>>gmail.com
				<option value="daum.net" <%=emailSelected[2]%>>daum.net
			</select>		
			</td>	
		</tr>
		
		<tr>
			<td>휴대폰번호</td>
			<td>
<%
	    	String[] phoneArr  = phone.split("-");  

			String[]  phoneSelected = new String[3]; 

			if(phoneArr[0].equals("010"))
			{
				phoneSelected[0] = "selected";
			}  
			else if(phoneArr[0].equals("011"))
			{
				phoneSelected[1] = "selected";
			}
			else if(phoneArr[0].equals("016"))
			{
				phoneSelected[2] = "selected";
			}

%>
			<select name="phone1">      
				<option value="010" <%=phoneSelected[0]%>>010
				<option value="011" <%=phoneSelected[1]%>>011
				<option value="016" <%=phoneSelected[2]%>>016
			</select>		
		    <input type="text" name="phone2" value="<%=phoneArr[1]%>" size="4">-
		    <input type="text" name="phone3" value="<%=phoneArr[2]%>" size="4">
			</td>	
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="zipcode"readOnly value="<%=zipcode%>">
				<input type="button" value="우편번호검색" onClick="zipCheck()" ><br><br>
				<input type="text" name="address1" placeholder="주소" readOnly value="<%=address1%>"><br><br>
				<input type="text" name="address2" placeholder="상세 주소" value="<%=address2%>">
			</td>
		</tr>
		
		
	</table>
	<p><input type=submit value=수정완료>
	</form>

</center>
</body>
</html>