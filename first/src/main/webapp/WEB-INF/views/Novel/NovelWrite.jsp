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
	    		<form action="novelWrite" method="post">
	    			<div class="form-group">
	    			<h1>New Novel Chapter[${chapter+1}]</h1>
						<div class="form-group" id="selboxOp">
							<select class="form-control" id="selbox" name="novel_title" style="width: 100px;">
								<c:choose>
									<c:when test="${novel_title == '' || novel_title eq null}">
										<option>분류</option>
										<option id="notitle" value="direct">직접 입력</option>
										<c:forEach var="tl" items="${novelList}">
											<option value="${tl.novel_title}">${tl.novel_title}</option>	
										</c:forEach>
									</c:when>
									<c:when test="${novel_title ne null || novel_title != ''}">
										<option value="${novel_title}">${novel_title}</option>
									</c:when>								
								</c:choose>
							</select>
						</div>
						
						<div class="form-group" id="selboxDirect">
							<input type="text" class="form-control" id ="novel_title" name="selboxDirect" placeholder="title"/>
						</div>	
						
						<div class="form-group">
							<input class="form-control title" type="text" name="novel_subtitle" placeholder="소제목"/>
						</div>	
						
						<div class="form-group">
							<textarea class="form-control" name="novel_content" id="ir1" rows="20" cols="100%"></textarea>
						</div>
						
						<div class="form-group">
							<input type="hidden" name="novel_id" value="${sessionScope.LoginID}">
						</div>
						<div class="form-group">	
							<select class="form-control" name="novel_visibility" style="width: 100px;">
								<option value="1">공개</option>
								<option value="0">비공개</option>
							</select>
					    </div>
					    
					</div>
					<button type="submit" class="btn btn-default" id="btn">작성완료</button>	
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
	    sSkinURI: "./resources/se2/SmartEditor2Skin.html",								
	    fCreator: "createSEditor2"								
	});

	$(document).ready(function(){
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
			if($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
				$("#selboxOp").hide();
			}else{
				$("#selboxDirect").hide();
			}
		})	
		
	});
	
	$('#novel_title').focusout(function(){
		let title = document.getElementById("novel_title").value;
		document.getElementById("notitle").value = title;
		console.log(document.getElementById("notitle").value);
	});
	
	$('#btn').click(function(){
	    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

	    console.log(document.getElementById("ir1").value);

	    try {
	        elClickedObj.form.submit();
	    } catch(e) {
	    	
	    }
	})

</script>
</html>