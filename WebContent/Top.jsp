<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ������ �̿��� �α��� ó�� -->
	<%
		String id = (String)session.getAttribute("id");
		//�α����� �Ǿ����� �ʴٸ�
		if(id==null){
			id="GUEST";
		}
	%>
	
	<table width="1000">
		<tr height="70">
			<td colspan="4">
				<a href="RentcarMain.jsp" style="text-decoration:none">
				<img alt="" src="img/RENT.png" height="65">
				</a>
			</td>
			<td align="center" width="200">
			<%=id %> �� 
			<%
			if(id.equals("GUEST")){
				%>
				<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">�α���</button>
			<%}else{%>
				<button onclick="location.href=MemberLogin.jsp'">�α׾ƿ�</button>
			<%
			}
			%>
			</td>
		</tr>
		<tr height="50" bgcolor="teal">
			<td align="center" width="200">
				<a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none"><font color="white" size="4">�����ϱ�</font></a>
			</td>
			<td align="center" width="200" >
				<a href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration:none"><font color="white" size="4">����Ȯ��</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">�����Խ���</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">�̺�Ʈ</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">������</font></a>
			</td>
		</tr>
	</table>

</body>
</html>