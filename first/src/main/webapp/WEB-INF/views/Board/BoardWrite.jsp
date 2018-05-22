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
	    <div class="col-sm-8 text-left" style="background-color: #EAEAEA; height: 100%;" > 
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
<script type="text/javascript">
	var oEditors = [];								
	nhn.husky.EZCreator.createInIFrame({								
	    oAppRef: oEditors,								
	    elPlaceHolder: "ir1",								
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",								
	    fCreator: "createSEditor2"								
	});
</script>
</html>