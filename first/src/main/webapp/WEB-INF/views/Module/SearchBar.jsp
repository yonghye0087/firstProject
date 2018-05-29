<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	
</style>
</head>
<body>
	<div class="input-group" >
		<span class="input-group-addon" id="SearchUser" onclick="searchCategory1()">
			<i class="glyphicon glyphicon-user"></i>
		</span>
		<span class="input-group-addon" id="SearchTitle" onclick="searchCategory2()">
		<i class="glyphicon glyphicon-list"></i>
		</span>
		<span class="input-group-addon" id="SearchBook" onclick="searchCategory3()">
		<i class="glyphicon glyphicon-book"></i>
		</span>
		<input type="text" class="form-control" name="search_text">
		<span class="input-group-addon" onclick="searchBtn()"><i class="glyphicon glyphicon-search"></i></span>
	</div>
</body>
<script type="text/javascript">
	let searchMenu = '';
	$(document).ready(function(){
		$('#SearchTitle').hide();
		$('#SearchBook').hide();
	});
	
	function searchCategory1(){
		$('#SearchUser').hide();
		$('#SearchBook').hide();
		$('#SearchTitle').show();
		searchMenu = 'Title';
		console.log(searchMenu);
	}
	function searchCategory2(){
		$('#SearchTitle').hide();
		$('#SearchUser').hide();
		$('#SearchBook').show();
		searchMenu = 'Book';
		console.log(searchMenu);
	}
	function searchCategory3(){
		$('#SearchBook').hide();
		$('#SearchTitle').hide();
		$('#SearchUser').show();
		searchMenu = 'User';
		console.log(searchMenu);
	}
	
	function searchBtn(){
		let searchText = $('input[name=search_text]').val();
		console.log(searchText);
		if(searchMenu == ''){
			searchMenu = 'User';
			console.log(searchText+" : "+searchMenu);
		}else if(searchMenu == 'User'){
			console.log(searchText+" : "+searchMenu);
		}else if(searchMenu == 'Title'){
			console.log(searchText+" : "+searchMenu);
		}else if(searchMenu == 'Book'){
			console.log(searchText+" : "+searchMenu);
		}
		document.location.href = "search?cate="+searchMenu+"&&text="+searchText;
	}
</script>
</html>