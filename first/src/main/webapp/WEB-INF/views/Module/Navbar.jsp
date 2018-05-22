<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" style="width: 15%; text-align: center;" href="home">FIRST</a>
			</div>
			<div class="collapse navbar-collapse" style="text-align: center;" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="home">홈</a></li>
				<li><a href="board">자유게시판</a></li>
					<c:choose>
						<c:when test="${!empty sessionScope.LoginID}">
							<li><a href="novel">내 소설</a></li>
							<li><a href="serialNovelBoard">소설게시판</a></li>
						</c:when>
						<c:when test="${empty sessionScope.LoginID}">
							<li><a href="serialNovelBoard">소설게시판</a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.UserLv eq 1 }">
							<li><a href="userForLv">유저리스트</a></li>
						</c:when>
					</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty LoginID}">
						<li><a href="loginUserGET"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						<li><a href="terms">회원가입</a></li>
					</c:when>
					<c:when test="${!empty LoginID}">
						<c:forEach var="s" items="${LoginID}">
							<li class="userInfo"><a href="userInfo"><c:out value="${s}" /></a></li>
								<li><a href="logoutGET">로그아웃</a></li>
							</c:forEach>	      			
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
