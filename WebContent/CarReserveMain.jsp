<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ������ ���̽��� �����Ͽ� �ֽż� �ڵ��� 3�븸 �ѷ��ִ� �����͸� ������ -->
<%
	RentcarDAO rdao = new RentcarDAO();
	//���͸� �̿��Ͽ� �ڵ����� ����
	Vector<CarListBean> v = rdao.getSelectCar();
%>
<center>
<table width="1000">
	<tr height="60">
	<td align="center" colspan="3">
		<font size="5" color="gray">
			�ֽ��� �ڵ���
		</font>
	</td>
	</tr>
	<tr height="240">
	<% for(int i = 0 ; i < v.size() ; i++){
		CarListBean bean =v.get(i);
		%>
	
		<td width="333" align="center">
		<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
		</a>
		<p>
		������ : <%=bean.getName() %>
		</td>
		<%} %>
	</tr>
</table>
<p>
	<font size="4" color="gray">���� �˻� �ϱ�</font><br>
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
	<font size="4" color="gray"><b>���� �˻�</b></font>&nbsp;&nbsp;
	<select name="category">
			<option value="1">����</option>
			<option value="2">����</option>
			<option value="3">����</option>		
	</select>&nbsp;&nbsp;
	<input type="submit" value="�˻�">&nbsp;&nbsp;
	</form>
	<br>
	<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">��ü�˻�</button>
</center>
</body>
</html>