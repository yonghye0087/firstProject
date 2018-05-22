<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#profileBody{
		text-align: center;
		
	}
	#profileModify{
		text-align: left;
	}
	#imgBox{
		text-align: center;
	}
	#profileTable{
		text-align: center;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		let UserIdForProfile =  document.getElementById("sessionId").value;
		console.log(UserIdForProfile);
		if(UserIdForProfile == ""){
			var outprofile = '';
			outprofile += '<div class="well well-sm">'
			outprofile += '<div>'
			outprofile += '<img alt="x" width="150px" height="150px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>">'
			outprofile += '</div>'
			outprofile += '<br>'
			outprofile += '<div>'
			outprofile += '<h4>unknownID<h4>'
			outprofile += '</div>'	
			outprofile += '<div>'
			outprofile += '<button type="button" class="btn btn-default">정보변경</button>'
			outprofile += '</div>'
			outprofile += '</div>'
			$('#profileBody').append(outprofile);	
		}else{
			$.ajax({
				type: "POST",
				url: "userRead",
				data: {UserId : UserIdForProfile},
				success: function(data){
					console.log(data);
					
					var outprofile = '';
					outprofile += '<div class="well well-sm">'
					outprofile += '<div id="profileTable">'
					outprofile += '<div id="imgBox">'
					outprofile += '<img alt="x" width="150px" height="150px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>">'
					outprofile += '</div>'
					outprofile += '</div>'
					outprofile += '<br>'
					outprofile += '<div>'
					outprofile += '<h4>'+data.userprofile.user_id+'<h4>'
					outprofile += '</div>'
					outprofile += '<div>'
					outprofile += '<h4> 가입일 : '+data.newDate+'<h4>'
					outprofile += '</div>'	
					outprofile += '<div>'
					outprofile += '<div><button type="button" class="btn btn-default" id="UserModify">정보변경</button></div></div>'
					outprofile += '</div>'
					outprofile += '</div>'
			
					$('#profileBody').append(outprofile);	
				},
				error: function(){
					alert("통신에러");
				}
			});
		}	
	});
	function UserModify(){
		document.location.href = "/userModify";
	}
	window.onload = function(){
		$('#profileModify').hide();
		document.getElementById("UserModify").onclick = function() {	
			$('#profileBody').hide();
			$('#profileModify').show();
			
			var modifyOut = '';
			modifyOut += '<div class="well well-sm">'
			modifyOut += '<form action="" method="post" enctype="multipart/form-data">'
			modifyOut += '<input type="file" name="user_file">'
			modifyOut += '<label for="user_id"> ID : </label>'
			modifyOut += '<input type="text" class="form-controll" name="user_id" value="">'
			modifyOut += '</form>'
			modifyOut += '<div><button type="button" class="btn btn-default" id="modifyProfile">변경완료</button></div>'
			modifyOut += '</div>'
			$('#profileModify').append(modifyOut);	
		}
		document.getElementById("modifyProfile").onclick = function(){
			
		}
	}
</script>
</head>
<body>
	<input type="hidden" id="sessionId" value="${sessionScope.LoginID}">
	<div id="profileBody"></div>
	<div id="profileModify"></div>		
</body>
</html>