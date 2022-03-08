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
	//처음 실행시에는 center값이 넘어오지 않기에
	if(center==null){//null처리
		center = "Center.jsp";//디폴트 center값을 부여
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