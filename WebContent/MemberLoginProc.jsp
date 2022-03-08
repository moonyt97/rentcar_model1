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
		//해당 회원이 있는지 여부를 숫자로 표현
		int result = rdao.getMember(id,pass);
		if(result==0){
			%>
			<script type="text/javascript">
				alert("잘못된 아이디와 비밀번호입니다.");
				location.href="RentcarMain.jsp?center=MemberLogin.jsp";
			</script>
			<%
		}else{
			//로그인 처리가 되었다면
			session.setAttribute("id", id);
			response.sendRedirect("RentcarMain.jsp");
		}
	%>

</body>
</html>