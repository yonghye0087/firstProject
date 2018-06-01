<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
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
  	 .MainContainer{
		width: 70%;
		text-align: left; 
		padding: 0px;
		left: 15px;
	}
  	/* Remove the navbar's default margin-bottom and rounded borders */ 
  	.navbar {
  	  position: fixed;
  	  width: 97.5%;
      margin-top: 15px;
  	  margin-left: 15px;
  	  margin-right: 15px;
  	  background-color: #000000;
      border-radius: 5px;
	}
	
	/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {
    	position:relative;
    	left: 16%;
    	overflow: scroll;
    	overflow-x : hidden;
    	height: 790px;
    	text-align: left;	
    }
	
	
    /* Set gray background color and 100% height */
    .sidenav.Lnav {
      position:fixed;
      left: 15px;
      padding: 15px;
      background-color: #f1f1f1;
      height: 83%;
      width: 15%;
      border-radius: 5px;
    }
    .sidenav.Rnav {
      position:fixed;
      right:30px;
      padding: 15px;
      background-color: #f1f1f1;
      height: 83%;
      width: 15%;
      border-radius: 5px;
    }
    
    
     /* Set black background color, white text and some padding */
    footer {
      left: 15px;
      right: 15px;
      margin-right: 15px;
  	  margin-left: 15px;
      padding: 5px;
      border-radius: 5px;
      position: fixed;
      width: 98.5%;
      bottom: 15px;
      background-color: black;
      color: gray;
    }
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: auto;) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
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
    #dateHit{
    	float: right;
    }
  </style>
  <script type="text/javascript" src="<c:url value="/resources/se2/js/service/HuskyEZCreator.js"/>" charset="utf-8"></script>
</head>
<body>
	<%@include file="..//Module/Navbar.jsp"%>  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav Lnav">
	    </div>
	    <div class="col-sm-8 MainContainer" >
		<form action="boardWrite" method="post">
	    			<div class="form-group">						
						<h2>게시글 작성</h2>
						<div class="form-group">
							<select class="form-control" name="board_category" style="width: 100px;">
								<option>분류</option>
								<option value="일반">일반</option>
								<option value="정보">정보</option>
								<option value="토론">토론</option>
								<option value="퍼옴">퍼옴</option>
							</select>
						</div>
						<div class="form-group">
							<input class="form-control title" type="text" name="board_title" placeholder="제목"/>
						</div>	
						<div class="form-group">
							<textarea class="form-control" name="board_content" id="ir1" rows="15" cols="100%"></textarea>
						</div>		
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span> 
							<input id="email" type="text" class="form-control" name="board_link" placeholder="link">
							  
					    </div>
					</div>
					<button type="submit" class="btn btn-default">작성완료</button>
	    		</form>			
	    </div>
	    <div class="col-sm-2 sidenav Rnav">
	      <jsp:include page="../Module/SearchBar.jsp"></jsp:include>
	    </div>
	  </div>
	</div>
	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</body>
<script type="text/javascript">
	var oEditors = [];								
	nhn.husky.EZCreator.createInIFrame({								
	    oAppRef: oEditors,								
	    elPlaceHolder: "ir1",								
	    sSkinURI: "./resources/se2/SmartEditor2Skin.html",								
	    fCreator: "createSEditor2"								
	});
</script>
</html>