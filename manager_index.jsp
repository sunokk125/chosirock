<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
    <title>Title</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        #title {
            text-align: center;
			font-size:32px;
            font-weight: bold;
            margin: 20px 0;
        }
        #container {
			width: 300px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
            padding: 30px 60px 50px 60px;
        }
		#box{margin-bottom:80px;}
		td{width:300px;text-align: center;}
        
    </style>
</head>
<body>
<%
	String id = (String)session.getAttribute("sid");
%>
<div id="wrap">
    <div id="container">
        <p id="title">���ö� ������ ���</p>
        <table>
			<tr>
                <td>
                    <h3 id="box">���� ���̵� : <%=id%> <a href="logout.jsp">�α׾ƿ�</a>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 id="box"><a href="member.html">< ȸ������ ></a>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 id="box"><a href="product.html">< ��ǰ���� ></a>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 id="box"><a href="order.html">< �ֹ����� ></a>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>