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
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		RentcarDAO rdao = new RentcarDAO();
		//�ش� ȸ���� �ִ��� ���θ� ���ڷ� ǥ��
		int result = rdao.getMember(id,pass);
		if(result==0){
			%>
			<script type="text/javascript">
				alert("�߸��� ���̵�� ��й�ȣ�Դϴ�.");
				location.href="RentcarMain.jsp?center=MemberLogin.jsp";
			</script>
			<%
		}else{
			//�α��� ó���� �Ǿ��ٸ�
			session.setAttribute("id", id);
			response.sendRedirect("RentcarMain.jsp");
		}
	%>

</body>
</html>