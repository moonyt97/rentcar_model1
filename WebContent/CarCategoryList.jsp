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
<% int category=Integer.parseInt(request.getParameter("category"));
	String temp="";
	if(category==1){
		temp="소형";
	}else if(category==2)temp="중형";
	else if(category==3)temp="대형";
%>
<tr height="60">
	<td align="center" colspan="3">
		<font size="5" color="gray">
			<%=temp %> 자동차
		</font>
	</td>
	</tr>
<%
	//카테고리 분류값을 받아옴
	
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getCategoryCar(category);
	//tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록 하는 변수
	int j=0;
	for(int i =0; i<v.size();i++){
		//백터에 저장되어있는 빈클래스 추출
		CarListBean bean = v.get(i);
		if(j%3==0){
			%>
			<tr height="220">
			<%} %>
			<td width="333" align="center">
			<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			 <img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a><p>
			<font size="3"><b>차량명: <%=bean.getName() %></b></font>
			<%
			j=j+1;
	}
%>



</table>
</center>
</body>
</html>