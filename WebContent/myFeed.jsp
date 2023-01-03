<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="java.util.*, dataAccessObject.*, valueObject.*, constants.Constants"
		 pageEncoding="UTF-8" errorPage="oops.jsp"%>
<%
	if (session.getAttribute("isLogOn")!=null) {
		if (!(boolean)session.getAttribute("isLogOn"))
			response.sendRedirect("index.html");
	} else response.sendRedirect("index.html");
%>

<%
	request.setCharacterEncoding("UTF-8");
	DAO dao = new DAO();
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png"/>
	<link rel="stylesheet" href="css/feed.css">
	<script>window.onpageshow=function(event){if(event.persisted){document.location.reload();}};</script>
	<title>MyFeed</title>
</head>

<body>
<!-- Navigation Bar -->
<div class="topnav" id="myTopnav">
	<a href="main.html" class="active">챌린저스</a>
	<a href="list.jsp">리스트</a>
	<a href="rate.jsp?CHALLENGER_ID=<%= dao.get(Constants.Challenger_thisWeekID) %>">전체 성공률</a>
	<a href="profile.jsp">프로필</a>
	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
		<i class="fa fa-bars"></i>
	</a>
</div>

<section class="main_feed">
	<center>
		<%for (ParentVO parentVO : dao.getList(new String[]{(String)session.getAttribute("user_#")}, FeedVO.class, Constants.Feed_MyFeedList)) {%>
		<div class="student_name">
			<p>
					<%ParentVO userInfo = dao.getList(new String[]{((FeedVO) parentVO).getUserNum()}, UserVO.class, Constants.User_info).firstElement();%>
					<%=((UserVO) userInfo).getName()%> <%=((UserVO) userInfo).getMajor()%> <%=((FeedVO) parentVO).getUploadTime().substring(5, ((FeedVO) parentVO).getUploadTime().length()-3)%>
			<form method="get" action="DELETE">
				<input type="submit"  style="background-color: blue; border: 0; color: white; border-radius: 10px" value="삭제" onClick="return confirming()">
				<input type="hidden" name="CHALLENGE_ID" value="<%=((FeedVO) parentVO).getFeed_id()%>">
				<input type="hidden" name="USER_#" value="<%=((FeedVO) parentVO).getUserNum()%>">
				<input type="hidden" name="FILENAME" value="<%=((FeedVO) parentVO).getFileName()%>">
				<input type="hidden" name="UPLOADTIME" value="<%=((FeedVO) parentVO).getUploadTime()%>">
				<input type="hidden" name="DESTINATION" value="myFeed.jsp">
			</form>
			</p>
		</div>

		<div class="card" style="width: 20rem;">
			<%
				String filename=((FeedVO)parentVO).getFileName();
				if(filename==null)%><img src="img/Challengers Logo -2.png" class="card-img-top" alt="..."><%
			else{
			if(filename.contains("jpeg")||filename.contains("JPEG")||filename.contains("PNG")||filename.contains("svg")||filename.contains("jpg")||filename.contains("png")||filename.contains("jfif")) {
		%><img src="files/<%=filename%>" class="card-img-top"  alt="..."><%
		} else if(filename.contains("https")){%> <%
			if(!filename.contains(", ")){%>
			<input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=filename %>'">
			<%} else {
				String temp ="";
				for(int i=0; i<filename.length(); i++)
					if(filename.charAt(i)==','){
			%><input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'"><%
					temp="";
				} else temp =temp+filename.charAt(i);
		%><input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'"><%
			}} else{
		%><video src="files/<%=filename%>"width="320" height="240" controls class="card-img-top"></video><%
				}}%>
			<div class="card-body">
				<p class="card-text"><%=((FeedVO) parentVO).getText()%></p>
			</div>
		</div>

		<hr>
		<%}%>
	</center>
</section>

</body>

<script>
	/* Toggle BTN on Nav Bar */
	function _0x415d(_0x3cc92f,_0x2b0fe9){var _0x244d2d=_0x244d();return _0x415d=function(_0x415d6e,_0x5048d7){_0x415d6e=_0x415d6e-0x16e;var _0x450062=_0x244d2d[_0x415d6e];return _0x450062;},_0x415d(_0x3cc92f,_0x2b0fe9);}(function(_0x400fbc,_0x4d0a3d){var _0x241d6f=_0x415d,_0x4219ac=_0x400fbc();while(!![]){try{var _0x49e37c=parseInt(_0x241d6f(0x171))/0x1+parseInt(_0x241d6f(0x172))/0x2*(parseInt(_0x241d6f(0x16e))/0x3)+parseInt(_0x241d6f(0x170))/0x4*(parseInt(_0x241d6f(0x17c))/0x5)+-parseInt(_0x241d6f(0x179))/0x6+parseInt(_0x241d6f(0x17d))/0x7*(parseInt(_0x241d6f(0x176))/0x8)+-parseInt(_0x241d6f(0x17a))/0x9+-parseInt(_0x241d6f(0x16f))/0xa;if(_0x49e37c===_0x4d0a3d)break;else _0x4219ac['push'](_0x4219ac['shift']());}catch(_0x20b690){_0x4219ac['push'](_0x4219ac['shift']());}}}(_0x244d,0xd90c9));function myFunction(){var _0x502d21=_0x415d,_0x4179b4=document[_0x502d21(0x17b)](_0x502d21(0x177));_0x4179b4['className']===_0x502d21(0x174)?_0x4179b4[_0x502d21(0x173)]+=_0x502d21(0x178):_0x4179b4[_0x502d21(0x173)]='topnav';}function _0x244d(){var _0x2372c1=['\x20responsive','5677914eWryyg','5430114TNeAMR','getElementById','15jVDctP','8078455aNhtfG','1257897LukPww','18223580gojwrT','565024XTRhzU','1006027VanqIw','8BoURTo','className','topnav','삭제하시겠습니까?','8gBQzJc','myTopnav'];_0x244d=function(){return _0x2372c1;};return _0x244d();}function confirming(){var _0x445de5=_0x415d,_0x38dd6d=window['confirm'](_0x445de5(0x175));return _0x38dd6d?!![]:![];}
</script>

</html>