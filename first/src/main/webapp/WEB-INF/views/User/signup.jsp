<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>INDEX</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
  </style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#">FIRST</a>
	    </div>
	    <div class="collapse navbar-collapse" style="" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li><a href="index">Home</a></li>
	        <li><a href="#">board</a></li>
	        <li class="active"><a href="#">sign-up</a></li>
	        <li><a href="#">#</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	    </div>
	    <div class="col-sm-8 text-left"> 
			<form id="signForm" action="/signUpPOST" method="post">
				<label for="id">ID : </label>
	      		<div class="form-group" >
	      			<input type="text" class="form-control" id="signUpId" name="id"/>
	      		</div>
	      		
	      	<label for="pw">PW : </label>
		      	<div class="form-group" >
		    	  	<input type="password" class="form-control" id="signUpPw" name="pw"/>
		      	</div>
		      	
	      	<label for="pwck">PW : </label>
		      	<div class="form-group" >
		    	  	<input type="password" class="form-control" id="signUpPwCk"/>
		      	</div>
		      	
	      	<label for="email">EMAIL : </label>
		      	<div class="form-group" >
		      		<input type="text" class="form-control" id="signUpIdEmail" name="email" />
		      	</div>
	      	
	      	<label for="hint">HINT : </label>	
		      	<div class="form-group" >
		     		<input type="text" class="form-control" id="signUpIdHint" name="hint" />
		      	</div>
	      	
	      	<button type="submit" class="btn btn-default" id="signUpSmt">submit</button>
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
</html>