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
	int no = Integer.parseInt(request.getParameter("no"));
	//����
	int qty = Integer.parseInt(request.getParameter("qty"));
	//�̹���
	String img =request.getParameter("img");
%>
	<center>
	<form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
	<table width="1000">
			<tr height="100">
			<td align="center" colspan="3">
			<font size="6" color="gray">�ɼ� ����</font>
			</td>
			</tr>
			<tr>
			<td rowspan="7" width="500">
			<img alt="" src="img/<%=img%>" width="450">
			</td>
			<td width="250" align="center">�뿩�Ⱓ</td>
			<td width="250" align="center">
				<select name="dday">
					<option value="1">1��</option>
					<option value="2">2��</option>
					<option value="3">3��</option>
					<option value="4">4��</option>
					<option value="5">5��</option>
					<option value="6">6��</option>
					<option value="7">7��</option>
				</select>
			</td>
			</tr>
			<tr>
			<td width="250" align="center">�뿩��</td>
			<td width="250" align="center"><input type="date" name="rday" size="15"></td>
			</tr>
			<tr>
			<td width="250" align="center">���� ����</td>
			<td width="250" align="center">
			<select name="usein">
					<option value="1">����(1�� 1����)</option>
					<option value="2">������</option>
				</select>
				</td>
			</tr>
			<tr>
			<td width="250" align="center">WIFI����</td>
			<td width="250" align="center">
			<select name="usewifi">
					<option value="1">����(1�� 1����)</option>
					<option value="2">������</option>
				</select>
				</td>
			</tr>
			<tr>
			<td width="250" align="center">�׺���̼� ����</td>
			<td width="250" align="center">
			<select name="usenavi">
					<option value="1">����(����)</option>
					<option value="2">������</option>
				</select>
				</td>
			</tr>
			<tr>
			<td width="250" align="center">���̺��Ʈ ����</td>
			<td width="250" align="center">
			<select name="useseat">
					<option value="1">����(����)</option>
					<option value="2">������</option>
				</select>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center"><input type="submit" value="���������ϱ�">
				<input type="hidden" name="no" value="<%=no %>">
				<input type="hidden" name="qty" value="<%=qty %>">
			</td>
			</tr>
	</table>
	</form>
	</center>
</body>
</html>