<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
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

	<%
		String id = (String) session.getAttribute("id");

		if (id == null) {
	%>
	<script type="text/javascript">
		alert("�α����� ���ּ���");
		location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
	</script>
	<%
		}
		//�α��εǾ� �ִ� ���̵� �о� ��
		RentcarDAO rdao = new RentcarDAO();
		Vector<CarViewBean> v = rdao.getAllReserve(id);
	%>
	<center>
		<table width="1000" border="1">
			<tr height="100" >
				<td align="center" colspan="11"><font size="6" color="gray"> ���� ����ȭ��</font>
				</td>
			</tr>
			<tr height="40">
				<td width="150" align="center">�̹���</td>
				<td width="150" align="center">������</td>
				<td width="150" align="center">�뿩��</td>
				<td width="60" align="center">�뿩�Ⱓ</td>
				<td width="100" align="center">�ݾ�</td>
				<td width="60" align="center">����</td>
				<td width="60" align="center">��������</td>
				<td width="60" align="center">wifi</td>
				<td width="60" align="center">���̺��Ʈ</td>
				<td width="60" align="center">�׺���̼�</td>
				<td width="90" align="center">����</td>
			</tr>
			<%
				
				for (int i = 0; i < v.size(); i++) {
					CarViewBean bean = v.get(i);
				String useIn = (bean.getUsein()==1)?"o":"x";
				String useWifi = (bean.getUsewifi()==1)?"o":"x";	
				String useSeat = (bean.getUseseat()==1)?"o":"x";	
				String useNavi = (bean.getUsenavi()==1)?"o":"x";	
			%>
			<tr height="70">
				<td width="150" align="center"><img alt="" src="img/<%=bean.getImg()%>" width="120" height="70"></td>
				<td width="150" align="center"><%=bean.getName() %></td>
				<td width="150" align="center"><%=bean.getRday() %></td>
				<td width="60" align="center"><%=bean.getDday() %></td>
				<td width="100" align="center"><%=bean.getPrice()%> ��</td>
				<td width="60" align="center"><%=bean.getQty() %></td>
				<td width="60" align="center"><%=useIn %></td>
				<td width="60" align="center"><%=useWifi %></td>
				<td width="60" align="center"><%=useSeat %></td>
				<td width="60" align="center"><%=useNavi %></td>
				<td width="90" align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>'">����</button></td>
			</tr>
			<%
				}
			%>

		</table>
	</center>
</body>
</html>