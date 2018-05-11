<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>NOVEL BOARD</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
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
    #novelList{
    	float: left;
    }
    #listbox{
    	text-align: center;
    	float: left;
    	position: relative;
    	width: 200px; 
    	height: 200px; 
    	border: solid 1px; color: gray;
    	margin-right: 20px;
    	margin-bottom: 10px;
    	
    }
  </style>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$.ajax({
  			type: "POST",
  			url: "/serialNovelList",
  			dataType : "json",
  			success: function(data){
  				if(data.length > 0){
  				var output = '';
  	  				$.each(data, function(index, item){
  	  					console.log(data);
  	  					output += '<div id="listbox">'
  	  					output += '<div>'+item.novel_title+'</div>'
  	  					output += '<div>'+item.novel_id+'</div>'
  	  					output += '</div>'
  	  	  	  		});
  	  	  	  		$('#novelList').append(output);
  				}
  			},
  			error:function(request,status,error){
  		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  		    }
	  	});
  	});
  </script>
</head>
<body>
	<%@include file="..//Module/navbar.jsp"%>
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	    </div>
	    <div class="col-sm-8 text-left"> 
	    	<h1>Novel List</h1>
			<div class="container" id="novelList"></div>
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