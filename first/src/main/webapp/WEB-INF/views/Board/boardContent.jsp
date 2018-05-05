<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
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
	  	  					output += '<label for="comment"><span class="glyphicon glyphicon-user"></span>'+item.id+' <span>'+item.comment_date+'</span></label>'
	  	  					if(session_id == item.id && item.comment_content != "삭제된 댓글입니다."){	  	  						
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
	<%@include file="..//Module/navbar.jsp"%>
	  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	    </div>
	    <div class="col-sm-8 text-left" >
	    	<div>						
				<h2>자유게시판</h2><hr>
					<div class="well well-sm">
						<h4><span class="category">[${boardRead.board_category}]</span> ${boardRead.board_title}</h4><hr>
						<div><span class="glyphicon glyphicon-user"></span> ${boardRead.id}</div>
						<div><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${boardRead.board_date}" pattern="YYYY-MM-dd hh:MM:ss"/>
						<span class="glyphicon glyphicon-eye-open"></span> ${boardRead.board_hit}</div><hr>
						<div style="height: auto;">${boardRead.board_content}</div><hr>
						<div><span class="glyphicon glyphicon-link"></span> : ${boardRead.board_link}</div>
						<input type="hidden" id="board_idx" value="${boardRead.board_idx}">								
					</div>
			</div>
				<c:choose>
					<c:when test="${boardRead.id eq sessionScope.LoginID}">
						<button type="submit" class="btn btn-default" onclick="boardModify()">수정</button>
						<button type="submit" class="btn btn-default" onclick="boardDelete()">삭제</button>
					</c:when>
				</c:choose>
				
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