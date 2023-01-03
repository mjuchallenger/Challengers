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
	String id = request.getParameter("CHALLENGER_ID");
	DAO dao = new DAO();
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/feed.css">
	<script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
	<script>
		window.onpageshow = function (event) {
			if (event.persisted) {
				document.location.reload();
			}
		};
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var lazyloadImages;

			if ("IntersectionObserver" in window) {
				lazyloadImages = document.querySelectorAll(".card-img-top");
				var imageObserver = new IntersectionObserver(function(entries, observer) {
					entries.forEach(function(entry) {
						if (entry.isIntersecting) {
							var image = entry.target;
							image.src = image.dataset.src;
							image.classList.remove("lazy");
							imageObserver.unobserve(image);
						}
					});
				});

				lazyloadImages.forEach(function(image) {
					imageObserver.observe(image);
				});
			} else {
				var lazyloadThrottleTimeout;
				lazyloadImages = document.querySelectorAll(".card-img-top");

				function lazyload () {
					if(lazyloadThrottleTimeout) {
						clearTimeout(lazyloadThrottleTimeout);
					}

					lazyloadThrottleTimeout = setTimeout(function() {
						var scrollTop = window.pageYOffset;
						lazyloadImages.forEach(function(img) {
							if(img.offsetTop < (window.innerHeight + scrollTop)) {
								img.src = img.dataset.src;
								img.classList.remove('lazy');
							}
						});
						if(lazyloadImages.length == 0) {
							document.removeEventListener("scroll", lazyload);
							window.removeEventListener("resize", lazyload);
							window.removeEventListener("orientationChange", lazyload);
						}
					}, 20);
				}

				document.addEventListener("scroll", lazyload);
				window.addEventListener("resize", lazyload);
				window.addEventListener("orientationChange", lazyload);
			}
		})
	</script>
	<title>Feed</title>
</head>

<body oncontextmenu="return false">
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

<%if(dao.get(id ,Constants.Challenger_getAdd).equals("true")) {%>
<div class="share_btn">
	<a href="add.jsp?CHALLENGER_ID=<%= id %>"><i class="fa-solid fa-square-plus"></i></a>
</div>
<%} %>
<br>

<section class="main_feed">
	<center>
		<%for (ParentVO parentVO : dao.getList(new String[]{id}, FeedVO.class, Constants.Feed_getList)) {%>
		<div class="student_name">
			<p>
					<%ParentVO userInfo = dao.getList(new String[]{((FeedVO) parentVO).getUserNum()}, UserVO.class, Constants.User_info).firstElement();%>
					<%=((UserVO) userInfo).getName()%> <%=((UserVO) userInfo).getMajor()%> <%=((FeedVO) parentVO).getUploadTime().substring(5, ((FeedVO) parentVO).getUploadTime().length()-3)%>
					<%if(((String)session.getAttribute("user_#")).equals(((FeedVO) parentVO).getUserNum())||((String)session.getAttribute("user_status")).equals(Constants.inFeedSt)) {%>
			<form method="get" action="DELETE">
				<input type="submit" style="background-color: blue; border: 0; color: white; border-radius: 10px" value="삭제" onClick="return confirming()">
				<input type="hidden" name="CHALLENGE_ID" value="<%=((FeedVO) parentVO).getFeed_id()%>">
				<input type="hidden" name="USER_#" value="<%=((FeedVO) parentVO).getUserNum()%>">
				<input type="hidden" name="FILENAME" value="<%=((FeedVO) parentVO).getFileName()%>">
				<input type="hidden" name="UPLOADTIME" value="<%=((FeedVO) parentVO).getUploadTime()%>">
				<input type="hidden" name="DESTINATION" value="feed.jsp?CHALLENGER_ID=<%= id %>">
			</form>
			<%} %>
			</p>
		</div>
		<div class="card" style="width: 20rem;">
			<%String filename=((FeedVO)parentVO).getFileName();
				if(filename==null) {%><img data-src="img/Challengers Logo -2.png" class="card-img-top" alt="...">
			<%} else {
				if(filename.contains("jpeg")||filename.contains("JPEG")||filename.contains("PNG")||filename.contains("svg")||filename.contains("jpg")||filename.contains("png")||filename.contains("jfif")||filename.contains("gif")) {
			%>
			<img data-src="files/<%=filename%>" class="card-img-top" alt="...">
			<%} else if(filename.contains("https")){
				if(!filename.contains(", ")){%>
			<input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=filename %>'">
			<%} else {
				String temp ="";
				for(int i=0; i<filename.length(); i++)
					if(filename.charAt(i)==','){
			%>
			<input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'">
			<%temp="";} else temp =temp+filename.charAt(i);%>
			<input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'">
			<%}} else{%>
			<video preload="metadata" data-src="files/<%=filename%>#t=0.5 " width="320" height="240" controls class="card-img-top"></video>
			<%}}%>
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
	function _0x2a78(_0x4b08f2,_0x27641b){var _0x48cf63=_0x48cf();return _0x2a78=function(_0x2a7829,_0x20dc2c){_0x2a7829=_0x2a7829-0x134;var _0x3f09db=_0x48cf63[_0x2a7829];return _0x3f09db;},_0x2a78(_0x4b08f2,_0x27641b);}(function(_0x59b993,_0x455445){var _0x49839a=_0x2a78,_0x4771ef=_0x59b993();while(!![]){try{var _0x3f0c72=-parseInt(_0x49839a(0x139))/0x1+-parseInt(_0x49839a(0x138))/0x2+parseInt(_0x49839a(0x13b))/0x3*(parseInt(_0x49839a(0x140))/0x4)+-parseInt(_0x49839a(0x13e))/0x5*(parseInt(_0x49839a(0x135))/0x6)+-parseInt(_0x49839a(0x141))/0x7*(parseInt(_0x49839a(0x136))/0x8)+parseInt(_0x49839a(0x13a))/0x9*(parseInt(_0x49839a(0x13f))/0xa)+parseInt(_0x49839a(0x134))/0xb;if(_0x3f0c72===_0x455445)break;else _0x4771ef['push'](_0x4771ef['shift']());}catch(_0x21dd68){_0x4771ef['push'](_0x4771ef['shift']());}}}(_0x48cf,0xabe66));function _0x48cf(){var _0x2d6c05=['className','4659127IJTiRl','1308984Vrrlrl','1190088fJtXIU','topnav','1046584ZuMqXP','185127jgTUCI','18wrDCzx','3864579iITaJs','\x20responsive','getElementById','5Awcmxn','338480AriEbu','4QHEqHr','7MPTgHn'];_0x48cf=function(){return _0x2d6c05;};return _0x48cf();}function myFunction(){var _0xc7be3c=_0x2a78,_0x3c005d=document[_0xc7be3c(0x13d)]('myTopnav');_0x3c005d[_0xc7be3c(0x142)]==='topnav'?_0x3c005d[_0xc7be3c(0x142)]+=_0xc7be3c(0x13c):_0x3c005d['className']=_0xc7be3c(0x137);}
</script>

<script>
	(function(_0x2ce3ce,_0x523741){var _0x41a1d6=_0x1a98,_0x261a2c=_0x2ce3ce();while(!![]){try{var _0x1fa13e=parseInt(_0x41a1d6(0x1ed))/0x1*(-parseInt(_0x41a1d6(0x1f2))/0x2)+parseInt(_0x41a1d6(0x1f4))/0x3*(-parseInt(_0x41a1d6(0x1f1))/0x4)+parseInt(_0x41a1d6(0x1f0))/0x5+-parseInt(_0x41a1d6(0x1f5))/0x6+-parseInt(_0x41a1d6(0x1f3))/0x7*(parseInt(_0x41a1d6(0x1f7))/0x8)+parseInt(_0x41a1d6(0x1f6))/0x9+parseInt(_0x41a1d6(0x1ec))/0xa*(parseInt(_0x41a1d6(0x1f8))/0xb);if(_0x1fa13e===_0x523741)break;else _0x261a2c['push'](_0x261a2c['shift']());}catch(_0x4554f7){_0x261a2c['push'](_0x261a2c['shift']());}}}(_0x5f31,0xacea7));function confirming(){var _0x34eb55=_0x1a98,_0x2aaba4=window[_0x34eb55(0x1ee)](_0x34eb55(0x1ef));return _0x2aaba4?!![]:![];}function _0x1a98(_0x47ef11,_0x165180){var _0x5f31d7=_0x5f31();return _0x1a98=function(_0x1a98df,_0x281e7b){_0x1a98df=_0x1a98df-0x1ec;var _0x25db7d=_0x5f31d7[_0x1a98df];return _0x25db7d;},_0x1a98(_0x47ef11,_0x165180);}function _0x5f31(){var _0x34cd74=['confirm','삭제하시겠습니까?','4012445qkuklB','37436vTboyo','2970PQMUhJ','2742439lBOuPd','375witWmW','5634624jNtvhM','11565369yaAMlg','16ldueYu','10411027TaHGOH','30Ssdxqx','893qNmZKI'];_0x5f31=function(){return _0x34cd74;};return _0x5f31();}
</script>

</html>