<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		margin-top: 10px;
		
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
		margin-top: 10px;
		
	}
	#modifyForm{
	margin-top: 15%;
	}
</style>
</head>
<body>
	<div id="novelProfile"></div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		let NovelT = $('input[name=NBT]').val();
		let NovelI = $('input[name=NBI]').val();
		console.log(NovelT+" : "+NovelI);
		$.ajax({
			type: "POST",
			url: "novelProfile",
			data: {"novel_id": NovelI ,"novel_title": NovelT},
			success: function(data){
				if(data != null){
					let profileOut = '';
						if(data.novel_img_name == null){
							profileOut += '<div class="well well-sm" id="profileBox"><img alt="x" width="100px" height="100px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>">'
								profileOut += '<div>'+NovelT+'</div>'
						}else{
							profileOut += '<div class="well well-sm" id="profileBox"><img alt="y" width="100px" height="100px" src="<c:url value="/resources/ImageFile/'+data.novel_img_name+'"/>">'
							profileOut += '<div>'+data.novel_title+'</div>'
						}
						if(data.novel_nickname != null){
							profileOut += '<div>'+data.novel_nickname+'</div>'
						}else{
							profileOut += '<div>'+NovelI+'</div>'
						}
						profileOut += '<div><button type="button" onclick="profileModify()">정보수정</button></div></div>'
						
						profileOut += '<div class="well well-sm" id="profileBox2">'
						profileOut += '<form action="profileModify" name="modifyForm" method="post" enctype="multipart/form-data">'
						profileOut += '<input type="file" name="novel_file">'
						profileOut += '<label for="title">Novel Title</label>'
						profileOut += '<input type="text" name="novel_title" value="${title}">'
						profileOut += '<input type="hidden" name="novel_id" value="'+NovelI+'">'
						profileOut += '<label for="title">필명</label>'
							if(data.novel_nickname != null){
								profileOut += '<input type="text" name="novel_nickname" value="'+data.novel_nickname+'">'
							}else{
								profileOut += '<input type="text" name="novel_nickname" value="'+NovelI+'">'
							}
						profileOut += '<input type="button" onclick="Modifybtn()" value="수정완료" /></form></div>'
					$('#novelProfile').append(profileOut);
					$('#profileBox2').hide();
					
				}else{
					let profileOut = '';
					profileOut += '<div class="well well-sm" id="profileBox2">'
					profileOut += '<form action="profileModify" name="modifyForm" method="post" enctype="multipart/form-data">'
					profileOut += '<input type="file" name="novel_file">'
					profileOut += '<label for="title">Novel Title</label>'
					profileOut += '<input type="text" name="novel_title" value="${title}">'
					profileOut += '<label for="title">필명</label>'
						if(data.novel_nickname != null){
							profileOut += '<input type="text" name="novel_nickname" value="">'
						}else{
							profileOut += '<input type="text" name="novel_nickname" value="">'
						}
					profileOut += '<input type="submit" id="Modifybtn" value="수정완료" /></form></div>'
				$('#novelProfile').append(profileOut);
				}
			},
			error: function(){
				alert("error shit!")
			}
			
		});	
	});
	function profileModify(){
		$('#profileBox').hide();
		$('#profileBox2').show();
	}
	function Modifybtn(){
		$('#profileBox').show();
		$('#profileBox2').hide();
		$('form[name=modifyForm]').submit();
	}
	
	
</script>
</html>