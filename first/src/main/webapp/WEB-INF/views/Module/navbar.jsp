<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
<script type="text/javascript">

</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="home">FIRST</a>
			</div>
			<div class="collapse navbar-collapse" style="" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="home">home</a></li>
					<li><a href="board">board</a></li>
					<c:choose>
						<c:when test="${!empty sessionScope.LoginID}">
					<li><a href="novel">My novel</a></li>
					<li><a href="serialNovelBoard">serial novel board</a></li>
						</c:when>
						<c:when test="${empty sessionScope.LoginID}">
					<li><a href="serialNovelBoard">serial novel board</a></li>
						</c:when>
					</c:choose>
					<li><a href="#">#</a></li>
					<c:choose>
						<c:when test="${sessionScope.UserLv eq 1 }">
							<li><a href="userForLv">user list</a></li>
						</c:when>
					</c:choose>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty LoginID}">
							<li><a href="loginUserGET"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
							<li><a href="signUpGET">Sign-Up</a></li>
						</c:when>
						<c:when test="${!empty LoginID}">
							<c:forEach var="s" items="${LoginID}">
								<li class="userInfo"><a href="userInfo"><c:out value="${s}" /></a></li>
								<li><a href="logoutGET">Logout</a></li>
							</c:forEach>	      			
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
