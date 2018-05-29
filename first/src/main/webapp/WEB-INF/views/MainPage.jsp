<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>INDEX</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.MainContainer{
	width: 70%; 
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
    .row.content {height: 750px; margin: 0px;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding: 15px;
      background-color: #f1f1f1;
      height: 100%;
      width: 15%;
      border-radius: 5px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: auto;) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {
      height:auto;
      } 
    }
    .userInfo{
    	font: bold;
    	font-size: 15px;
    }
    .sideBoard {
    	float: left;
    	max-height: 250px;
    	max-width: 470px;
    	min-height: 250px; 
    	min-width: 470px;
    	border-radius: 5px;
    	margin-bottom: 20px;
    	margin-left: 9%;
    }
    #Table{
    	text-align: center;
    	margin-top: 0;
    	margin-left: 1px;
    	
    }
    .well{
    	padding-top: 0px;
    	height: 230px;
    	width:  450px;
    }
</style>
</head>
<body>
	 <jsp:include page="./Module/Navbar.jsp"/>
	<div class="container-fluid">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	    </div>
	    <div class="col-sm-8 MainContainer">
	    	<div class="sideBoard" >
	    	<label>자유게시판</label>
	    		<div class="well">
	    			<table class="table row" id="Table">
						<thead>
							<tr>
								<th class="col-sm-2" style="text-align: center;">번호</th>
								<th class="col-sm-6" style="text-align: center;">제목</th>
								<th class="col-sm-4" style="text-align: center;">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bl" items="${boardList}">
							<tr>
								<td class="col-sm-2" style="text-align: center;;">${bl.board_idx}</td>
								<td class="col-sm-6" style="text-align: center;">[${bl.board_category}] <a href="boardContent?boardNo=${bl.board_idx}">${bl.board_title}</a></td>
								<td class="col-sm-4" style="text-align: center;">${bl.user_id}</td>
							</tr>
							</c:forEach>
						</tbody>			
					</table>
	    		</div>
	    	</div>
	    	<div class="sideBoard">
	    		<label>소설게시판</label>
	    		<div class="well">
	    			<table class="table row" id="Table">
						<thead>
							<tr>
								<th class="col-sm-2" style="text-align: center;">번호</th>
								<th class="col-sm-6" style="text-align: center;">제목</th>
								<th class="col-sm-4" style="text-align: center;">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="nl" items="${novelList}">
							<tr>
								<td class="col-sm-2" style="text-align: center;;">${nl.novel_idx}</td>
								<td class="col-sm-6" style="text-align: center;">[${nl.novel_title}]<a href="novelContent?novel_idx=${nl.novel_idx}">${nl.novel_subtitle}</a></td>
								<td class="col-sm-4" style="text-align: center;">${nl.novel_id}</td>
							</tr>
							</c:forEach>
						</tbody>			
					</table>
	    		</div>
	    	</div>
	    	<div class="sideBoard">
	    		<label>가입회원</label>
	    		<div class="well">
	    			<table class="table row" id="Table">
						<thead>
							<tr>
								<th class="col-sm-2" style="text-align: center;">번호</th>
								<th class="col-sm-6" style="text-align: center;">제목</th>
								<th class="col-sm-4" style="text-align: center;">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="gl" items="${guestList}">
							<tr>
								<td class="col-sm-2" style="text-align: center;;">${gl.user_no}</td>
								<td class="col-sm-6" style="text-align: center;">${gl.user_id}</td>
								<td class="col-sm-4" style="text-align: center;"><fmt:formatDate value="${gl.user_date}" pattern="YYYY-MM-dd"/></td>
							</tr>
							</c:forEach>
						</tbody>			
					</table>
	    		</div>
	    	</div>
	    </div>
	    <div class="col-sm-2 sidenav">
	    	<jsp:include page="./Module/SearchBar.jsp"></jsp:include>
	    </div>
	  </div>
	</div>
</body>
</html>