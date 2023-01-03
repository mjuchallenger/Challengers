<%@ page language="java" contentType="text/html; charset=UTF-8"
		 import="java.util.*, dataAccessObject.*, valueObject.*, constants.Constants"
		 pageEncoding="UTF-8" errorPage="oops.jsp"%>

<%
	if (session.getAttribute("isLogOn") != null) {
		if (!(boolean) session.getAttribute("isLogOn"))
			response.sendRedirect("index.html");
	} else
		response.sendRedirect("index.html");
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("CHALLENGER_ID");
	DAO dao = new DAO();
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<!--===========================================================================================================================-->
	<title>add</title>
	<!--===========================================================================================================================-->
	<link rel="icon" type="image/png" href="img/Challengers Logo -2.png" />
	<!--===========================================================================================================================-->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<!--===========================================================================================================================-->
	<script src="https://kit.fontawesome.com/a4d2993e00.js"
			crossorigin="anonymous"></script>
	<!--===========================================================================================================================-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		  rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		  crossorigin="anonymous">
	<!--===========================================================================================================================-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!--===========================================================================================================================-->
	<link rel="stylesheet" href="css/add.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!--===========================================================================================================================-->
	<script>
		window.onpageshow=function(event){if(event.persisted){document.location.reload();}};
	</script>
</head>
<!--===========================================================================================================================-->
<body>
<script>
	$('#form').submit(function(event) {
		event.preventDefault();
		window.history.back();
	});
</script>


<SCRIPT TYPE="TEXT/JAVASCRIPT">
	function fileUpload(fis) {
		var sendFile = document.sendFile;

		sendFile.method = ""
		var str = fis.value;
		alert("파일네임: "+ fis.value.substring(str.lastIndexOf("\\")+1));
	}
</SCRIPT>

<form action="add2" name=sendFile method="post" id="share"
	  enctype="multipart/form-data">
	<div class="filebox bs3-primary preview-image">
		<label for="input_file">사진선택</label>
		<input type="file" id="input_file" class="upload-hidden" name="filename">
	</div>
	<textarea id="share" cols="50" rows="6" class="write_box" placeholder="소감문 작성" required name="text"></textarea>
	<br> <input type="submit" value="공유하기" class="share_btn" id="btn" onclick="insert(); Loading(); spinner();">
	<input type="hidden" value="<%=id%>" name="CHALLENGER_ID">
	<div class="spinner-border roadingStatus" id="roadingStatus" role="status" style="position: absolute; top: 50%; left: 47%; display: none">
		<span class="sr-only">Loading...</span>
	</div>
</form>

</body>
<!--===========================================================================================================================-->
<!-- file Contact - Jquery used Javascript file-->
<script>
	$(document).ready(function () {
		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change', function () {
			if (window.FileReader) {
				// 파일명 추출
				var filename = $(this)[0].files[0].name;
			} else {
				// Old IE 파일명 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
			};

			$(this).siblings('.upload-name').val(filename);
		});

		//preview image
		var imgTarget = $('.preview-image .upload-hidden');

		imgTarget.on('change', function () {
			var parent = $(this).parent();
			parent.children('.upload-display').remove();

			if (window.FileReader) {
				//image 파일만
				if (!$(this)[0].files[0].type.match(/image\//)) {
					var reader = new FileReader();

					reader.onload = function (e) {
						var src = e.target.result;

						parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><video src="' + src +
								'#t=0.5" class="upload-thumb" style="width: 100%; height: 100%"></div></div>');
					}
					reader.readAsDataURL($(this)[0].files[0]);
					return;
				}

				var reader = new FileReader();
				reader.onload = function (e) {
					var src = e.target.result;
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src +
							'" class="upload-thumb"></div></div>');
				}
				reader.readAsDataURL($(this)[0].files[0]);
			} else {
				$(this)[0].select();
				$(this)[0].blur();
				var imgSrc = document.selection.createRange().text;
				parent.prepend(
						'<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

				var img = $(this).siblings('.upload-display').find('img');
				img[0].style.filter =
						"progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" +
						imgSrc + "\")";
			}
		});
	});


</script>
<!--===========================================================================================================================-->
<script>
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
		if(doubleSubmitFlag){
			return doubleSubmitFlag;
		} else {
			doubleSubmitFlag = true;
			return false;
		};
	};
	function insert(){
		if(doubleSubmitCheck()) return;
		alert("공유하시겠습니까?");
	};
</script>
<!--===========================================================================================================================-->
<script>
	function spinner(){
		$("#roadingStatus").show();
	}

	function Loading() {
		var maskHeight = $(document).height();
		var maskWidth  = window.document.body.clientWidth;

		var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
		var loadingImg ='';

		loadingImg +="<div id='loadingImg'>";
		loadingImg +="<img src='${pageContext.request.contextPath}/img/loding.gif' style='position:absolute; text-align:center; display:block; '/>";
		loadingImg += "</div>";

		$('body').append(mask)

		$('#mask').css({
			'width' : maskWidth,
			'height': maskHeight,
			'opacity' :'0.3'
		});
		$('#mask').show();
		$('.loadingImg').append(loadingImg);
		$('#loadingImg').show();
	}
</script>
<!--===========================================================================================================================-->
</html>