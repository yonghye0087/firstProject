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
  <script type="text/javascript">
  	function boardDelete(){
  		document.location.href = "boardDelete?boardNo="+${boardRead.board_idx};
  	}
  	
  	function boardModify(){
  		document.location.href = "boardModify?boardNo="+${boardRead.board_idx};
  	}
  	function commentUpdate(){
		var comment_idx = 0;
 	  	var session_id = '${sessionScope.LoginID}';
 	  	
  		$('button#commentDeleteIdx').click(function(){
  			comment_idx = this.value
  			$.post("commentUpdate", {comment_idx: comment_idx, session_id: session_id}, function(){commentReading()});
  		});	
  	}
  	function commentReading(){
			var board_idx = ${boardRead.board_idx};
			var session_id = '${sessionScope.LoginID}'; 
	  		$.ajax({
	  			type: "POST",
	  			url: "/commentRead",
	  			data: {boardNo : board_idx},
	  			dataType : "json",
	  			success: function(data){
	  				if(data.length > 0){
	  				var output = '';
	  	  				output += '<div class="well well-sm comment_content">'
	  	  				$.each(data, function(index, item){
	  	  					console.log(data.length);
	  	  					output += '<label for="comment"><span class="glyphicon glyphicon-user"></span>'+item.user_id+' <span>'+item.comment_date+'</span></label>'
	  	  					if(session_id == item.user_id && item.comment_content != "삭제된 댓글입니다."){	  	  						
	  	  						output += '<button type="submit" class="btn btn-default commentUpdate" id="commentDeleteIdx" value="'+item.comment_idx+'" onclick="commentUpdate()">삭제</button>'
	  	  					}  			  
	  		  	  			output += '<div>'+item.comment_content+'</div>'
	  		  	  			output += '<hr>' 
	  	  	  	  		});
	  	  				output += '<div>'
	  	  	  	  		$('#commentBody').append(output);
	  				}else{
	  					var output = '';
		  				output += '<div class="well well-sm comment_content">'
		  				output += '<div>댓글이 없습니다.</div>'
		  				output += '<div>'
						$('#commentBody').append(output);	
	  				}
	  			},
	  			error:function(request,status,error){
	  		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  		    }
		  	});		
		};
  	$(document).ready(function() {
  		commentReading();
  	}); 	
  </script>
</head>
<body>
	<%@include file="..//Module/Navbar.jsp"%>  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav Lnav">
	    </div>
	    <div class="col-sm-8 MainContainer" >
	    	<div>						
				<h2>자유게시판</h2><hr>
					<div class="well well-sm">
						<h4><span class="category">[${boardRead.board_category}]</span> ${boardRead.board_title}</h4>
						<div><span class="glyphicon glyphicon-user"></span> ${boardRead.user_id}
						<div id="dateHit"><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${boardRead.board_date}" pattern="YYYY-MM-dd hh:MM:ss"/>
						<span class="glyphicon glyphicon-eye-open"></span> ${boardRead.board_hit}</div></div>
					</div>
					<div class="well well-sm" style="min-height: 500px; max-height: auto; background-color: white;" >	
						<div style="height: auto;" >${boardRead.board_content}</div><hr>
					</div>
					<div class="well well-sm">
						<div><span class="glyphicon glyphicon-link"></span> : <a>${boardRead.board_link}</a></div>
						<input type="hidden" id="board_idx" value="${boardRead.board_idx}">								
					</div>
			</div>
				<div>
				<c:choose>
					<c:when test="${sessionScope.LoginID eq boardRead.user_id}">
						<button type="submit" class="btn btn-default" onclick="boardModify()">수정</button>
						<button type="submit" class="btn btn-default" onclick="boardDelete()">삭제</button>
					</c:when>
				</c:choose>
				</div>
				<hr>
				<div id="commentBody">					
				</div>
				<c:choose>
					<c:when test="${sessionScope.LoginID ne null}">
						<div id="comment_content">
							<form action="/commentCreate" method="post">
								<label for="comment"><span class="glyphicon glyphicon-user"></span>${sessionScope.LoginID} </label>
								<input type="hidden" name="id" value="${sessionScope.LoginID}">
								<input type="hidden" name="board_idx" value="${boardRead.board_idx}">
								<input type="text" class="form-control" id="comment_content" name="comment_content" >
								<button type="submit" class="btn btn-default" id="commentCreate">작성 완료</button>
							</form>										
						</div>
					</c:when>
					<c:when test="${sessionScope.LoginID eq null}">
						<div>
							<label for="comment"><span class="glyphicon glyphicon-user"></span>Unknown User</label>
							<input class="form-control" type="text" id="comment" name="comment_content" readonly="readonly" placeholder="로그인이 필요합니다.">
						</div>
					</c:when>
				</c:choose>
		<hr>
		<!-- 게시판 붙여넣기 -->
		<table class="table row">
				<thead>
					<tr>
						<th class="col-md-1" style="text-align: left;">번호</th>
						<th class="col-md-5" style="text-align: center;">제목</th>
						<th class="col-md-2" style="text-align: right;">작성자</th>
						<th class="col-md-2" style="text-align: right;">조회수</th>
						<th class="col-md-2" style="text-align: right;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${page}">
					<tr>
						<td class="col-md-1" style="text-align: left;;">${list.board_idx}</td>
						<td class="col-md-5" style="text-align: left;">[${list.board_category}] <a href="boardContent?boardNo=${list.board_idx}">${list.board_title}</a></td>
						<td class="col-md-2" style="text-align: right;">${list.user_id}</td>
						<td class="col-md-2" style="text-align: right;">${list.board_hit}</td>
						<td class="col-md-2" style="text-align: right;"><fmt:formatDate value="${list.board_date}" pattern="YYYY-MM-dd"/></td>
					</tr>
					</c:forEach>
				</tbody>			
			</table>
			<button type="submit" class="btn btn-default" onclick="boardWrite()">글쓰기</button>
		
		
		<!-- 페이징  -->
		<c:choose>
			<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">				
				<div class="text-center marg-top">					
					<ul class="pagination">
						<c:if test="${paging.currentPageNo gt 5}">    
							
							<!-- 이전페이지 표시 -->                                          
							<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li> 
						</c:if>
					
					<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> 
						<c:choose>
							<c:when test="${i eq paging.currentPageNo}">
								<li class="active"><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:when>
							<c:otherwise>
								<li><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 소수점 제거 =>-->
					<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
					<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
					<c:if test="${currentPage < finalPage}"> 
						<li><a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">다음</a></li>
					</c:if>
				    </ul>
				</div>
			</c:when>
		</c:choose>
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
</html>