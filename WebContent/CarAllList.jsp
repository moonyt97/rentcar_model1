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
<center>
<table width="1000">
<tr height="60">
	<td align="center" colspan="3">
		<font size="5" color="gray">
			��ü �ڵ���
		</font>
	</td>
	</tr>

<%
	//ī�װ� �з����� �޾ƿ�
	
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getAllCar();
	//tr�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� �ϴ� ����
	int j=0;
	for(int i =0; i<v.size();i++){
		//���Ϳ� ����Ǿ��ִ� ��Ŭ���� ����
		CarListBean bean = v.get(i);
		if(j%3==0){
			%>
			<tr height="220">
			<%} %>
			<td width="333" align="center">
			<a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			 <img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a><p>
			<font size="3"><b>������: <%=bean.getName() %></b></font>
			<%
			j=j+1;
	}
%>



</table>
</center>
</body>
</html>