<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
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
		var UserIdForProfile =  ${sessionScope.LoginID};
		if(UserIdForProfile != ""){
			$.ajax({
				type: "GET",
				url: "/userRead",
				date: {UserId : UserIdForProfile},
				dataType: "json",
				success: function(data){
					/* 
					ajax로 개인정보 불러와서 밑에 부분에 뿌려주기. 
					유저 디비에 이미지를 텍스트로 저장하는 컬럼 만들기.
					디비 항목 추가하기.(아이디, 비밀번호, 가입날짜, 힌트, 이름, 성별, 나이, 이메일, 프로필 문구, 프로필 아이콘, 등등)
					*/
				},
				error: function(){
					
				}
			});
		}else{

		}		
		
	});
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>UserIcon</th><br> <!-- 아이콘 클릭시 수정화면 보여주기 -->
				<th>UserID</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>UserDate</td>	<!-- 가입한지 몇일째인지 -->
				<td>UserSetting</td>	<!-- 클릭시 개인정보 수정 -->
			</tr>
		</tbody>
	</table>
</body>
</html>