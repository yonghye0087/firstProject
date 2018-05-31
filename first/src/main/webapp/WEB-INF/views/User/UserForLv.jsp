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
    .MainContainer{
	width: 70%;
	text-align: left; 
	padding: 0px;
	left: 15px;
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
   	#tbodyAlign{
   		
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
	    <div class="col-sm-8 MainContainer" >
	    	<h1>User List</h1>
	    	<table class="table row">
				<thead>
					<tr>
						<th class="col-md-1" style="text-align: left;">No</th>
						<th class="col-md-2" style="text-align: center;">ID</th>
						<th class="col-md-4" style="text-align: center;">EMAIL</th>
						<th class="col-md-2" style="text-align: center;">SIGN UP DATE</th>
						<th class="col-md-2" style="text-align: center;">LV</th>
						<th class="col-md-1" style="text-align: center;">LV Switch</th>
					</tr>
				</thead>
				<tbody id="tbodyAlign">
					<c:forEach var="ml" items="${managerList}" varStatus="status">
							<input type="hidden" id="MEndNum${status.last}" value="${status.index}">
							<tr>
								<td class="col-md-1" style="text-align: left;">${ml.user_no}<input type="hidden" name="user_no_M${status.index}" value="${ml.user_no}"></td>
								<td class="col-md-2" style="text-align: center;">${ml.user_id}</td>
								<td class="col-md-4" style="text-align: center;">${ml.user_email}</td>
								<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${ml.user_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td class="col-md-2" style="text-align: center;">관리자<input type="hidden" name="user_level" value="${ml.user_level}"></td>
								<td class="col-md-1" style="text-align: center;"><a name="MswitLv"><span class="glyphicon glyphicon-cog"></span></a></td>
							</tr>
					</c:forEach>
				</tbody>
				<tbody id="tbodyAlign">
					<c:forEach var="gl" items="${guestList}" varStatus="status">
						<tr>
							<td class="col-md-1" style="text-align: left;">${gl.user_no}<input type="hidden" name="user_no_${status.index}" value="${gl.user_no}"></td>
							<td class="col-md-2" style="text-align: center;">${gl.user_id}</td>
							<td class="col-md-4" style="text-align: center;">${gl.user_email}</td>
							<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${gl.user_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td class="col-md-2" style="text-align: center;">일반 회원<input type="hidden" name="user_level" value="${gl.user_level}"></td>
							<td class="col-md-1" style="text-align: center;"><a name="GswitLv"><span class="glyphicon glyphicon-cog"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
	    </div>
	    <div class="col-sm-2 sidenav">
	      <jsp:include page="../Module/SearchBar.jsp"></jsp:include>
	    </div>
	  </div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		let SwitLv;
		let userNo;
		let userLv;
		let alldata;
		let MlistEndNum = $('#MEndNumtrue').val();
		console.log(MlistEndNum);
		$('a[name=MswitLv]').click(function(){
			SwitLv = $('a[name=MswitLv]').index(this);
			userNo = $('input[name=user_no_M'+SwitLv+']').val();
			console.log(SwitLv);
			console.log(userNo);
			confirm("변경하시겠습니까?");
			if(true){
				userLv = 0;
				alldata = {"user_no": userNo,"user_level": userLv}
				LvChange(alldata);
			}
		})
		$('a[name=GswitLv]').click(function(){
			SwitLv = $('a[name=GswitLv]').index(this);
			userNo = $('input[name=user_no_'+SwitLv+']').val();
			console.log(userNo);
			confirm("변경하시겠습니까?");
			if(true){
				userLv = 1;
				alldata = {"user_no": userNo,"user_level": userLv}
				LvChange(alldata);
			}
		})
	})
	
	function LvChange(alldata){
		console.log(alldata);
		$.ajax({
			type: "post",
			url: "userLvChange",
			data: alldata,
			success: function(data){
				if(data == "success"){
					location.reload();
				}
			},
			error: function(){
				alert("error!")
			}
		})	
	}
</script>
</html>