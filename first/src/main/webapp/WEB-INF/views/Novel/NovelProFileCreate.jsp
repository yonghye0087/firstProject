<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     .MainContainer{
	width: 70%;
	text-align: left; 
	padding: 0px;
	left: 15px;
	}
	
	.form-control{
	max-width: 50%;
	}
	
	.well{
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
    .userInfo{
    	font: bold;
    	font-size: 15px;
    }
    .form-control{
    	/* width: 100px; */
    }
  </style>
  <script type="text/javascript" src="<c:url value="/resources/se2/js/service/HuskyEZCreator.js"/>" charset="utf-8"></script>
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
	    <div class="col-sm-8 MainContainer"> 
   			<div class="form-group well">
   			<h1>소설 프로필 생성</h1>
				<form action="createNovel" method="post" enctype="multipart/form-data">
					<div class="form-group" id="novel_title">
						<label for="novel_title">소설 제목 :</label>
						<input type="text" class="form-control" id ="title_id" name="novel_title" placeholder="소설 제목"/>
					</div>
					<div class="form-group">
						<label for="novel_nickname">필명 :</label>
						<input type="text" class="form-control" id="nickname_id" name="novel_nickname" placeholder="필명"/>
					</div>	
					<div class="form-group">
						<label for="novel_visibility">공개여부 :</label>	
						<select class="form-control" name="novel_visibility" style="width: 100px;">
							<option value="1">공개</option>
							<option value="0">비공개</option>
						</select>
				    </div>
				    <div class="form-group">
				    	<label for="novel_file">소설 이미지 :</label>	
				    	<input type="file" class="form-control" id="file_id" name="novel_file">
				    </div>
				    <input type="hidden" name="novel_id" value="${sessionScope.LoginID}">
				    <button type="submit" class="btn btn-default" id="btn">작성완료</button>	
				</form>						
			</div>					
	    </div>
	    <div class="col-sm-2 sidenav">
	      <jsp:include page="../Module/SearchBar.jsp"></jsp:include>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>