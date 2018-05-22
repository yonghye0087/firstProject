<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 850px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    .userInfo{
    	font: bold;
    	font-size: 15px;
    }
    .form-control{
    	/* width: 100px; */
    }
    .category{
    	color: #2F9D27;
    }
    .glyphicon glyphicon-time{
    	
    }
    .col-sm-8 text-left {
    	background-color: #FFFFFF; 
    	height: 100%;
    }
    .commentUpdate{
    	float: right;
    }
  </style>
</head>
<body>
	<%@include file="..//Module/Navbar.jsp"%>
	  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	    </div>
	    <div class="col-sm-8 text-left" >
	    	<h1>User Modify</h1>
			<table class="table row">
				<thead>
					<tr>
						<th class="col-md-2" style="text-align: center;;">No</th>
						<th class="col-md-2" style="text-align: center;">ID</th>
						<th class="col-md-4" style="text-align: center;">EMAIL</th>
						<th class="col-md-2" style="text-align: center;">SIGN UP DATE</th>
						<th class="col-md-2" style="text-align: center;">LV</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${allUserList}">
					<tr>
						<td class="col-md-2" style="text-align: center;">${list.user_no}</td>
						<td class="col-md-2" style="text-align: center;">${list.user_id}</td>
						<td class="col-md-4" style="text-align: center;">${list.user_email}</td>
						<td class="col-md-2" style="text-align: center;">${list.user_date}</td>
						<td class="col-md-2" style="text-align: center;">
							<c:choose>
								<c:when test="${list.user_level eq 0}">
									일반 회원
								</c:when>
								<c:when test="${list.user_level eq 1}">
									관리자
								</c:when>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</tbody>			
			</table>
	    </div>
	    <div class="col-sm-2 sidenav">
	      <div class="well">
	        <p></p>
	      </div>
	      <div class="well">
	        <p></p>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>