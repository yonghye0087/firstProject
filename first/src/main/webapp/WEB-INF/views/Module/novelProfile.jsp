<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#profileBox{
		height: 200px;
		width: 200px;
		float: left;
		position: relative;
		left: 12%;
		right: 12%;
		text-align: center;
		margin-left: 5px;
		margin-top: 5px;
		
	}
	#profileBox2{
		height: 200px;
		width: 200px;
		float: left;
		position: relative;
		left: 12%;
		right: 12%;
		text-align: center;
		margin-left: 5px;
		margin-top: 5px;
		
	}
</style>
</head>
<body>
	<div id="novelProfile">
	</div>
	<input type="hidden" value="${title}" id="pftitle">
	<input type="hidden" value="${sessionScope.LoginID}" id="pfid">
	<input type="hidden" value="${novel_visibility}" id="novel_visibility">
</body>
<script type="text/javascript">
	$(document).ready(function(){
		let novelTitle = document.getElementById("pftitle").value;
		let novelId = document.getElementById("pfid").value;
		let novelVi = document.getElementById("novel_visibility").value;
		console.log(novelTitle +' : '+ novelId);
		let formdata = { novel_id : novelId , novel_title : novelTitle, novel_visibility : novelVi}
		$.ajax({
			type: "post",
			url: "/profileNovel",
			data: formdata,
			dataType: "json",
			success: function(data){
				console.log(data);
				if(data != null){
					let profileOut = '';
						if(data.novel_img_name == null){
							profileOut += '<div class="well well-sm" id="profileBox"><img alt="x" width="100px" height="100px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>">'
								profileOut += '<div>'+novelTitle+'</div>'
						}else{
							profileOut += '<div class="well well-sm" id="profileBox"><img alt="x" width="100px" height="100px" src="<c:url value="/resources/ImageFile/'+data.novel_img_name+'"/>">'
							profileOut += '<div>'+data.novel_title+'</div>'
						}
						if(data.novel_nickname != null){
							profileOut += '<div>'+data.novel_nickname+'</div>'
						}else{
							profileOut += '<div>'+novelId+'</div>'
						}
						profileOut += '<div><button type="button" id="profileModify">정보수정</button></div></div>'
						
						profileOut += '<div class="well well-sm" id="profileBox2">'
						profileOut += '<form action="/profileModifyForFile" id="modifyForm" method="post" enctype="multipart/form-data">'
						profileOut += '<input type="file" name="novel_file">'
						profileOut += '<label for="title">Novel Title</label>'
						profileOut += '<input type="text" name="novel_title" value="${title}">'
						profileOut += '<label for="title">필명</label>'
							if(data.novel_nickname != null){
								profileOut += '<input type="text" name="novel_nickname" value="'+data.novel_nickname+'">'
							}else{
								profileOut += '<input type="text" name="novel_nickname" value="'+novelId+'">'
							}
						profileOut += '<input type="submit" id="Modifybtn" value="수정완료"/></form></div>'
					$('#novelProfile').append(profileOut);
					$('#profileBox2').hide();
					
				}else{
					let profileOut = '';
					profileOut += '<div class="well well-sm" id="profileBox2">'
					profileOut += '<form action="" id="modifyForm" method="post" enctype="multipart/form-data">'
					profileOut += '<input type="file" name="novel_file">'
					profileOut += '<label for="title">Novel Title</label>'
					profileOut += '<input type="text" name="novel_title" value="${title}">'
					profileOut += '<label for="title">필명</label>'
						if(data.novel_nickname != null){
							profileOut += '<input type="text" name="novel_nickname" value="">'
						}else{
							profileOut += '<input type="text" name="novel_nickname" value="">'
						}
					profileOut += '<input type="submit" id="Modifybtn" value="수정완료"/></form></div>'
				$('#novelProfile').append(profileOut);
				}
			},
			error: function(){
				alert("통신에러");
			}
			
		})
	});
	window.onload = function(){
		document.getElementById("profileModify").onclick = function() {	
			$('#profileBox').hide();
			$('#profileBox2').show();		
		}
		document.getElementById("Modifybtn").submit = function() {
			let title = ${title};
			$('#profileBox').show();
			$('#profileBox2').hide();
			document.location.href = "novelByTl?novel_title="+title;
		}
	}
</script>
</html>