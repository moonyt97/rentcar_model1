<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String center = request.getParameter("center");
	//ó�� ����ÿ��� center���� �Ѿ���� �ʱ⿡
	if(center==null){//nulló��
		center = "Center.jsp";//����Ʈ center���� �ο�
	}
%>
<center>
<table width="1000">
	<!-- Top -->
	<tr height="140" align="center">
	<td align="center"><jsp:include page="Top.jsp"/></td>
	</tr>
	<!-- Center -->
	<tr  align="center">
	<td align="center"><jsp:include page="<%=center %>"/></td>
	</tr>
	<!-- Bottom -->
	<tr height="100" align="center">
	<td align="center"><jsp:include page="Bottom.jsp"/></td>
	</tr>
</table>
</center>
</body>
</html>