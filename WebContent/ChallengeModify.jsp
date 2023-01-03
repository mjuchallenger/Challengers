<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="dataAccessObject.*, valueObject.*, constants.Constants"
		 pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("isLogOn") != null) {
		if (!(boolean)session.getAttribute("isLogOn")) response.sendRedirect("index.html");
		if(!(((String)session.getAttribute("user_status")).equals("ADMIN"))) response.sendRedirect("index.jsp");
	} else response.sendRedirect("index.html");
%>
<%
	request.setCharacterEncoding("UTF-8");
	String challenge_id = request.getParameter("ChallengeID");
	String challenge_name = request.getParameter("ChallengeName");
	String challenge_startDate = request.getParameter("ChallengeStartDate");
	String challenge_endDate = request.getParameter("ChallengeEndDate");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<link rel='stylesheet' href='admin/css/list.css'>
	<script src='https://kit.fontawesome.com/a4d2993e00.js'crossorigin='anonymous'></script>
	<title>챌린지 수정하기</title>
</head>
<body>

<form method="post" action="SChallenger_Modify" enctype="UTF-8">
	<label for="challenge list">
		챌린지명: <%= challenge_name%><br>
		시작일: <%= challenge_startDate%><br>
		종료일: <%= challenge_endDate%><br>
	</label><br><br>
	시작일: <input type="date" name="startDate" required oninvalid="this.setCustomValidity('시작일을 입력해주세요')"
				oninput="this.setCustomValidity('')"><br><br>
	마감일: <input type="date" name="endDate" required oninvalid="this.setCustomValidity('마감일을 입력해주세요')"
				oninput="this.setCustomValidity('')"><br><br>
	<input type="hidden" name="challenge_id" value="<%= challenge_id%>">
	<input class="btn" type="submit" id="submit_btn" value="수정하기">
	<!-- 추가 시 list.html 파일에 챌린지 리스트 추가 -->
</form>

</body>
</html>
