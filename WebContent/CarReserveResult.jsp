<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty property="*" name="rbean"/>
</jsp:useBean>

<%
	String id =(String)session.getAttribute("id");
	if(id==null){
		%>
		<script type="text/javascript">
		alert("�α��� �� ������ �����մϴ�.");
		location.href="RentcarMain.jsp?center=MemberLogin.jsp";
		</script>
		<%
	}
	//��¥ �� 
	Date d1 = new Date();
	Date d2 = new Date();
	//��¥�� 2016-4-4  ���� ���ִ� Ŭ���� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	//��¥ �� �޼ҵ鸣 ��� 
	int compare = d1.compareTo(d2);
	//�����Ϸ��� ��¥���� ���糯¥�� ũ�ٸ� -1
	//�����Ϸ��� ��¥�� ���糯¥�� ���ٸ� 0
	//�����Ϸ��� ��¥�� �� ũ�ٸ� 1����
	if(compare<0){//���ú��� ���� ��¥��� ����Ұ�
		%>
		<script type="text/javascript">
		alert("���� �ý��� ��¥���� ���� ��¥�� ������ �� ����.");
		history.go(-1);
		</script>
		<%
	}
	//��������� �ƹ��� ������ ���ٸ� ������ ������ ��� ������ �����ֱ�
	//���̵� ���� ��Ŭ������ ���⿡
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	//������ ���̽��� ��Ŭ���� ����
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean);
	
	//�������� ��� ����
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	//���� �� �ݾ� 
	int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
	int usein = 0;
	if(rbean.getUsein()==1)usein=1;
	int useseat = 0;
	if(rbean.getUseseat()==1)useseat=1;
	int usewifi = 0;
	if(rbean.getUsewifi()==1)usewifi=1;
	//�ɼǱݾ�
	int totaloption = (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
	
%>

<center>
	<table width = "1000">
		<tr height="100">
			<td align="center">
			<font size="6" color="gray"> ���� ���� �Ϸ� ȭ��</font>
			</td>
		</tr>	
		<tr>
			<td align="center">
			<img alt="" src="img/<%=cbean.getImg() %>" width="470">
			</td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">���� �ѿ��� �ݾ� <%=totalcar %>���� </font>
			</td>
		</tr>	
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">���� �ѿɼ� �ݾ� <%=totaloption %>���� </font>
			</td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">���� �� �ݾ� <%=totaloption + totalcar %>���� </font>
			</td>
		</tr>		
	</table>
</center>



</body>
</html>