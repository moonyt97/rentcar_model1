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
		alert("로그인 후 예약이 가능합니다.");
		location.href="RentcarMain.jsp?center=MemberLogin.jsp";
		</script>
		<%
	}
	//날짜 비교 
	Date d1 = new Date();
	Date d2 = new Date();
	//날짜를 2016-4-4  포맷 해주는 클래스 선언
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	//날짜 비교 메소들르 사용 
	int compare = d1.compareTo(d2);
	//예약하려는 날짜보다 현재날짜가 크다면 -1
	//예약하려는 날짜와 현재날짜가 같다면 0
	//예약하려는 날짜가 더 크다면 1리턴
	if(compare<0){//오늘보다 이전 날짜라면 예약불가
		%>
		<script type="text/javascript">
		alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음.");
		history.go(-1);
		</script>
		<%
	}
	//결과적으로 아무런 문제가 없다면 데이터 저장후 결과 페이지 보여주기
	//아이디 값이 빈클래스에 없기에
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	//데이터 베이스에 빈클래스 저장
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean);
	
	//차량정보 얻어 오기
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	//차량 총 금액 
	int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
	int usein = 0;
	if(rbean.getUsein()==1)usein=1;
	int useseat = 0;
	if(rbean.getUseseat()==1)useseat=1;
	int usewifi = 0;
	if(rbean.getUsewifi()==1)usewifi=1;
	//옵션금액
	int totaloption = (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
	
%>

<center>
	<table width = "1000">
		<tr height="100">
			<td align="center">
			<font size="6" color="gray"> 차량 예약 완료 화면</font>
			</td>
		</tr>	
		<tr>
			<td align="center">
			<img alt="" src="img/<%=cbean.getImg() %>" width="470">
			</td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">차량 총예약 금액 <%=totalcar %>만원 </font>
			</td>
		</tr>	
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">차량 총옵션 금액 <%=totaloption %>만원 </font>
			</td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="gray">차량 총 금액 <%=totaloption + totalcar %>만원 </font>
			</td>
		</tr>		
	</table>
</center>



</body>
</html>