<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>board</title>
</head>
<body>
<!-- 1.디비에서 자료 불러오기
	 2.페이징 작업 하기
	 3.검색버튼 만들기( 검색버튼 조건 제목, 제목+내용, 작성자, 날짜, 조회수 상위글
	 4.타이틀 누르면 세부 내용으로 이동하도록 만들기(단 클릭시 글 색이 변하는게 아니라 글 칸의 색이 변하도록 하기
	 5.설정 css파일로 만들어서 따로 빼기
	  -->
	<div class="container">
		<h1>Board</h1>
		<table class="table row">
			<thead>
				<tr>
					<th class="col-md-2" style="text-align: center;">NO</th>
					<th class="col-md-4" style="text-align: center;">Title</th>
					<th class="col-md-2" style="text-align: center;">ID</th>
					<th class="col-md-2" style="text-align: center;">HIT</th>
					<th class="col-md-2" style="text-align: center;">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="" items="">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</c:forEach>				
			</tbody>			
		</table>
		<input type="button" value="글쓰기">
		<input type="button" value="">
	</div>
</body>
</html>