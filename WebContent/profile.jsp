<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="java.util.*, dataAccessObject.*, valueObject.ChallengerVO, valueObject.ParentVO, constants.Constants"
		 pageEncoding="UTF-8" errorPage="oops.jsp"%>

<%
	if (session.getAttribute("isLogOn") != null) {
		if (!(boolean) session.getAttribute("isLogOn"))
			response.sendRedirect("index.html");
	} else
		response.sendRedirect("index.html");
%>
<%
	DAO dao = new DAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png" />
	<link rel="stylesheet" href="css/profile.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
	<script>window.onpageshow=function(event){if(event.persisted){document.location.reload();}};</script>
	<title>profile</title>
</head>

<body>
<!-- Navigation Bar -->
<div class="topnav" id="myTopnav">
	<a href="main.html" class="active">챌린저스</a> <a href="list.jsp">리스트</a>
	<a href="rate.jsp?CHALLENGER_ID=<%=dao.get(Constants.Challenger_thisWeekID)%>">전체성공률</a>
	<a href="profile.jsp">프로필</a>
	<a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
</div>

<!-- main Profile section -->
<section class="name_helloSection">
	<div class="name_studentHello">
		<p>안녕하세요
			<span class="server_studentName" id="server_studentName"><%=session.getAttribute("user_name")%>님</span>
		</p>
	</div>
</section>
<section>
	<div class="successrate">
		<p>이번 챌린지 성공률</p>
		<div class="progress" style="height: 50px;">
			<%String rate = dao.get((String) session.getAttribute("user_#"), Constants.User_Rate);%>
			<div class="progress-bar" role="progressbar" style="width:<%=rate%>%;" aria-valuenow="<%=rate%>"
				 aria-valuemin="0" aria-valuemax="100"><%=rate%></div>
		</div>
	</div>
</section>

<!-- 포스트 할때 마다 체크 표시가 늘어나게 하기 (html에서는 작동안하는 웹이 존재함) react로 작업 -->
<section>
	<div class="check_success"></div>
</section>

<!-- button group -->
<form action="PROFILE" method="get">
	<div class="d-grid gap-2 col-6 mx-auto">
		<input class="btn btn-primary" type="submit" value="My Feed" />
		<input class="btn btn-primary" type="hidden" name="myFeed" value="myFeed.jsp" />
		<input class="btn btn-primary" type="submit" name="logout" value="Logout" />
		<button class="btn btn-primary" type="submit" disabled="disabled">회원탈퇴</button>
		<br><br>
		<%if ((((String) session.getAttribute("user_status")).equals("ADMIN"))) {%>
		<input class="btn btn-primary" type="submit" name="adminPage" value="관리자페이지" />
		<%}%>
	</div>
</form>
</body>

<script>
	/* Toggle BTN on Nav Bar */
	function _0x42e8(){var _0x34c492=['56etjdAE','2000360OBMYaR','\x20responsive','511426rCePap','55bnFAoq','2784315qkBCUk','topnav','5041869xJsKcq','2235591vlssEj','4564536aPUogs','className','myTopnav','getElementById','945171zYziQf','4UbiWqb','4RVunun'];_0x42e8=function(){return _0x34c492;};return _0x42e8();}(function(_0x2fbd4b,_0x43e913){var _0xf7e0ea=_0x24b7,_0x2138dc=_0x2fbd4b();while(!![]){try{var _0x2bc3d8=parseInt(_0xf7e0ea(0x18a))/0x1*(parseInt(_0xf7e0ea(0x196))/0x2)+parseInt(_0xf7e0ea(0x18f))/0x3*(parseInt(_0xf7e0ea(0x195))/0x4)+parseInt(_0xf7e0ea(0x18c))/0x5+-parseInt(_0xf7e0ea(0x190))/0x6+-parseInt(_0xf7e0ea(0x18e))/0x7+-parseInt(_0xf7e0ea(0x197))/0x8*(-parseInt(_0xf7e0ea(0x194))/0x9)+-parseInt(_0xf7e0ea(0x188))/0xa*(parseInt(_0xf7e0ea(0x18b))/0xb);if(_0x2bc3d8===_0x43e913)break;else _0x2138dc['push'](_0x2138dc['shift']());}catch(_0x4658b4){_0x2138dc['push'](_0x2138dc['shift']());}}}(_0x42e8,0x8d51a));function _0x24b7(_0x39a81c,_0x4d5dad){var _0x42e8ee=_0x42e8();return _0x24b7=function(_0x24b783,_0x28b49d){_0x24b783=_0x24b783-0x188;var _0x4edd9b=_0x42e8ee[_0x24b783];return _0x4edd9b;},_0x24b7(_0x39a81c,_0x4d5dad);}function myFunction(){var _0x31f082=_0x24b7,_0x33f650=document[_0x31f082(0x193)](_0x31f082(0x192));_0x33f650[_0x31f082(0x191)]===_0x31f082(0x18d)?_0x33f650['className']+=_0x31f082(0x189):_0x33f650['className']=_0x31f082(0x18d);}
</script>

</html>