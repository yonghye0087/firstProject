<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		let UserIdForProfile =  document.getElementById("sessionId").value;
		console.log(UserIdForProfile);
		if(UserIdForProfile == ""){
			var outprofile = '';
			outprofile += '<div><img alt="x" width="70px" height="70px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>"></div>'
			outprofile += '<br>'
			outprofile += '<div><h4>unknownID<h4></div>'	
			outprofile += '<div><button type="button" class="btn btn-default">정보변경</button></div>'
			$('#profileBody').append(outprofile);	
		}else{
			$.ajax({
				type: "POST",
				url: "userRead",
				data: {UserId : UserIdForProfile},
				success: function(data){
					console.log(data);
					var outprofile = '';
					outprofile += '<div><img alt="x" width="70px" height="70px" src="<c:url value="/resources/ImageFile/UnkownUser.png"/>"></div>'
					outprofile += '<br>'
					outprofile += '<div>'+data.id+'</div>'	
					outprofile += '<div><button type="button" class="btn btn-default" onclick="UserModify()">정보변경</button></div>'
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
</script>
</head>
<body>
	<input type="hidden" id="sessionId" value="${sessionScope.LoginID}">
	<div id="profileBody"></div>	
</body>
</html>