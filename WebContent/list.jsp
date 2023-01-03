<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="java.util.*, dataAccessObject.*, valueObject.ChallengerVO, valueObject.ParentVO, constants.Constants"
		 pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("isLogOn") != null) {
		if (!(boolean) session.getAttribute("isLogOn"))
			response.sendRedirect("index.html");
	} else response.sendRedirect("index.html");
%>
<%
	DAO dao = new DAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png"/>
	<!--===============================================================================================-->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--===============================================================================================-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!--===============================================================================================-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!--===============================================================================================-->
	<script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
	<!--===============================================================================================-->
	<link rel="stylesheet" href="css/list.css">
	<!--===========================================================================================================================-->
	<script>
		window.onpageshow = function (event) {
			if (event.persisted) {
				document.location.reload();
			}
		};
	</script>
	<!--===========================================================================================================================-->
	<title>list</title>
</head>
<body>

<!-- Navigation Bar -->
<div class="topnav" id="myTopnav">
	<a href="main.html" class="active">챌린저스</a>
	<a href="list.jsp">리스트</a>
	<a href="rate.jsp?CHALLENGER_ID=<%= dao.get(Constants.Challenger_thisWeekID) %>">전체 성공률</a>
	<a href="profile.jsp">프로필</a>
	<a href="javascript:void(0);" class="icon" onclick="myFunction()"> <i class="fa fa-bars"></i></a>
</div>

<!-- list group -->
<div class="list_group">
	<div class="list-group">
		<%for (ParentVO parentVO : dao.getList(ChallengerVO.class, Constants.Challenger_getList)) {%>
		<a href="feed.jsp?CHALLENGER_ID=<%=((ChallengerVO) parentVO).getId()%>" class="list-group-item list-group-item-action">
			<%=((ChallengerVO) parentVO).getName()%> </a>
		<%}%>
	</div>
</div>
</body>

<script>
	/* Toggle BTN on Nav Bar */
	function _0x4600(_0x1fcc19,_0x1c0b26){var _0x156c89=_0x156c();return _0x4600=function(_0x4600cd,_0x3dbf48){_0x4600cd=_0x4600cd-0x1f4;var _0x49225e=_0x156c89[_0x4600cd];return _0x49225e;},_0x4600(_0x1fcc19,_0x1c0b26);}(function(_0x44cd3a,_0x106eca){var _0x2944ff=_0x4600,_0x422d58=_0x44cd3a();while(!![]){try{var _0x5be6dc=parseInt(_0x2944ff(0x1fd))/0x1*(-parseInt(_0x2944ff(0x1fa))/0x2)+-parseInt(_0x2944ff(0x1fc))/0x3+-parseInt(_0x2944ff(0x1f9))/0x4*(-parseInt(_0x2944ff(0x200))/0x5)+-parseInt(_0x2944ff(0x1fe))/0x6+-parseInt(_0x2944ff(0x1f7))/0x7+parseInt(_0x2944ff(0x1f8))/0x8+parseInt(_0x2944ff(0x1f4))/0x9*(parseInt(_0x2944ff(0x1f6))/0xa);if(_0x5be6dc===_0x106eca)break;else _0x422d58['push'](_0x422d58['shift']());}catch(_0x3dac0e){_0x422d58['push'](_0x422d58['shift']());}}}(_0x156c,0xc7336));function _0x156c(){var _0x384090=['2334036tIMkks','12goGvNx','1707690QyxNVa','myTopnav','61855pZIkUL','9iLTkzw','topnav','35634180NJIRbw','10188486fmvvXd','2688640NxfwbQ','316ZNmCyh','257126EwXCGO','className'];_0x156c=function(){return _0x384090;};return _0x156c();}function myFunction(){var _0x2629d6=_0x4600,_0xe07c56=document['getElementById'](_0x2629d6(0x1ff));_0xe07c56[_0x2629d6(0x1fb)]===_0x2629d6(0x1f5)?_0xe07c56[_0x2629d6(0x1fb)]+='\x20responsive':_0xe07c56['className']=_0x2629d6(0x1f5);}
</script>
</html>