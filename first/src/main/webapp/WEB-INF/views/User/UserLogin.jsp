<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>INDEX</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .MainContainer{
	width: 70%;
	text-align: left; 
	padding: 0px;
	left: 15px;
	}
	.subContainer{
	max-width: 98%;
	}
	
	/* Remove the navbar's default margin-bottom and rounded borders */ 
  	.navbar {
  	  margin-top: 15px;
  	  margin-left: 15px;
  	  margin-right: 15px;
  	  background-color: #000000;
      border-radius: 5px;
	}
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 1200px; margin: 0px;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding: 15px;
      background-color: #f1f1f1;
      height: 100%;
      width: 15%;
      border-radius: 5px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    .form-group {
    width: 50%;
    }
  </style>
</head>
<body>
	<%@include file="../Module/Navbar.jsp"%>
	  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	    </div>
	    <div class="col-sm-8 MainContainer">
	    	<div class="well subContainer">
	    		<c:choose>
		    		<c:when test="${CheckID eq 0}">
		    			<h2>Rechecking ID</h2>
		    		</c:when>
		    		<c:when test="${CheckID eq 1}">
		    			<h2>Login Fail</h2>
		    		</c:when>
		    		<c:when test="${empty CheckID}">
		    			<h2>Login</h2>
		    		</c:when>
		    	</c:choose>	    	
				<form action="loginUserPOST" method="post">
					<label for="id">ID : </label>
					<div class="form-group" ><input type="text" class="form-control" id="id" name="user_id"/></div>
					<label for="pw">PW : </label>
					<div class="form-group" ><input type="password" class="form-control" id="pw" name="user_pw"/></div>
					<button type="submit" class="btn btn-default">submit</button>
				</form>
	    	</div>	    
	    	
	    </div>
	    <div class="col-sm-2 sidenav">
	    </div>
	  </div>
	</div>
</body>
</html>