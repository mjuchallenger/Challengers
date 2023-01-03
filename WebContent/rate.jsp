<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="java.util.*, dataAccessObject.*, valueObject.*, constants.Constants"
		 pageEncoding="UTF-8" errorPage="oops.jsp"%>

<%
	if (session.getAttribute("isLogOn") != null) {
		if (!(boolean) session.getAttribute("isLogOn"))
			response.sendRedirect("index.html");
	} else response.sendRedirect("index.html");
%>

<%
	request.setCharacterEncoding("UTF-8");
	DAO dao = new DAO();
	String thisChallengeName = "";
	for (ParentVO list : dao.getList(new String[] {request.getParameter("CHALLENGER_ID")}, ChallengerVO.class, Constants.Challenger_getChallengerInfo))
		thisChallengeName = ((ChallengerVO) list).getName();
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/rate.css">
	<script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
	<script>window.onpageshow=function(event){if(event.persisted){document.location.reload();}};</script>
	<title>챌린지 성공률</title>
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
<br>
<form>
	<h6>
		<select name='CHALLENGER_ID' onchange='this.form.submit();'>
			<option selected disabled="disabled" hidden="true" ><%=thisChallengeName%></option>
			<%for(ParentVO parentVO: dao.getList(ChallengerVO.class, Constants.Challenger_getList)){
				if(!((ChallengerVO)parentVO).getName().equals(thisChallengeName)){ %>
			<option style="outline-color: 'white'" value='<%= ((ChallengerVO)parentVO).getId() %>'><%= ((ChallengerVO)parentVO).getName()%></option>
			<% }}%>
		</select>
	</h6>
</form>
<table>
	<tr>
		<th>이름</th>
		<th>학과</th>
		<th>성공률</th>
	</tr>
	<% for (ParentVO list : dao.getList(new String[] {request.getParameter("CHALLENGER_ID"), request.getParameter("CHALLENGER_ID")}, PersonalRateVO.class, Constants.Feed_PersonalSuccessRateTable)) { %>
	<tr>
		<td <%if(((PersonalRateVO) list).getRate().equals("100")) { %>style="color:  #FFDEF0; "<%}%>><%=((PersonalRateVO) list).getName()%></td>
		<td <%if(((PersonalRateVO) list).getRate().equals("100")) { %>style="color:  #FFDEF0; "<%}%>><%=((PersonalRateVO) list).getMajor()%></td>
		<td <%if(((PersonalRateVO) list).getRate().equals("100")) { %>style="color:  #FFDEF0; "<%}%>><%= ((PersonalRateVO) list).getRate()%></td>
	</tr>
	<%} %>
</table>
</body>

<script>
	/* Toggle BTN on Nav Bar */
	function _0x34eb(){var _0x425c49=['myTopnav','topnav','1694148msPNOD','getElementById','4255670BTPYsJ','12TqqQgb','1nYVQss','745105QGQoUj','className','776830gGwyAn','1648mfiKvc','11MKegPg','2198493aFiwgX','3387CJdOZz','504203XvCwQQ','8FAaZds','\x20responsive'];_0x34eb=function(){return _0x425c49;};return _0x34eb();}function _0x82e2(_0x247283,_0x1adfac){var _0x34ebdd=_0x34eb();return _0x82e2=function(_0x82e29,_0x122cf6){_0x82e29=_0x82e29-0xd0;var _0x39d510=_0x34ebdd[_0x82e29];return _0x39d510;},_0x82e2(_0x247283,_0x1adfac);}(function(_0x38dbd3,_0x306c53){var _0x5be69a=_0x82e2,_0x250c2e=_0x38dbd3();while(!![]){try{var _0x3d39f9=parseInt(_0x5be69a(0xd5))/0x1*(parseInt(_0x5be69a(0xd8))/0x2)+-parseInt(_0x5be69a(0xdc))/0x3*(parseInt(_0x5be69a(0xd9))/0x4)+parseInt(_0x5be69a(0xd6))/0x5+parseInt(_0x5be69a(0xd4))/0x6*(-parseInt(_0x5be69a(0xdd))/0x7)+parseInt(_0x5be69a(0xde))/0x8*(-parseInt(_0x5be69a(0xdb))/0x9)+parseInt(_0x5be69a(0xd3))/0xa*(parseInt(_0x5be69a(0xda))/0xb)+parseInt(_0x5be69a(0xd1))/0xc;if(_0x3d39f9===_0x306c53)break;else _0x250c2e['push'](_0x250c2e['shift']());}catch(_0x1610fa){_0x250c2e['push'](_0x250c2e['shift']());}}}(_0x34eb,0x3d34b));function myFunction(){var _0xf54037=_0x82e2,_0x58035c=document[_0xf54037(0xd2)](_0xf54037(0xe0));_0x58035c[_0xf54037(0xd7)]===_0xf54037(0xd0)?_0x58035c['className']+=_0xf54037(0xdf):_0x58035c[_0xf54037(0xd7)]=_0xf54037(0xd0);}
</script>

</html>