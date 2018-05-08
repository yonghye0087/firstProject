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
				<li><a href="home">Home</a></li>
				<li><a href="board">board</a></li>
				<li><a href="#">#</a></li>
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