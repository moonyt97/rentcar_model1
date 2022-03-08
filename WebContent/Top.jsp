<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션을 이용한 로그인 처리 -->
	<%
		String id = (String)session.getAttribute("id");
		//로그인이 되어있지 않다면
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
			<%=id %> 님 
			<%
			if(id.equals("GUEST")){
				%>
				<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>
			<%}else{%>
				<button onclick="location.href=MemberLogin.jsp'">로그아웃</button>
			<%
			}
			%>
			</td>
		</tr>
		<tr height="50" bgcolor="teal">
			<td align="center" width="200">
				<a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none"><font color="white" size="4">예약하기</font></a>
			</td>
			<td align="center" width="200" >
				<a href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration:none"><font color="white" size="4">예약확인</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">자유게시판</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">이벤트</font></a>
			</td>
			<td align="center" width="200" >
				<a href="#" style="text-decoration:none"><font color="white" size="4">고객센터</font></a>
			</td>
		</tr>
	</table>

</body>
</html>