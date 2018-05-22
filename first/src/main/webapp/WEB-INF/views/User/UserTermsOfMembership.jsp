<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>INDEX</title>
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
    .row.content {height: 850px;}
    
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
    #termsOfMembership{
		height: 250px;
		width: 80%;
		margin-left: 10%;
		margin-top: 20px;
		white-space: pre-line;
		overflow: scroll;
	}
	#TOM_header{
		font-size: 30px;
		font-family: cursive;
		margin-left: 10%;
		margin-top: 5px;
	}
	#TOM_CKBox{
		margin-left: 10%;
		margin-top: 5px;
	}
	#TOM_btn_div {
		margin-left: 80%;
	}
</style>
</head>
<body>
	<%@include file="../Module/Navbar.jsp"%>
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	    </div>
	    <div class="col-sm-8 text-left">  
	    	<div class="" id="TOM_header">회원 가입 동의</div>
			<div class="well well-lg" id="termsOfMembership">회원 가입 동의서 내용부분입니다.
				약관의 내용은 미정입니다.
			</div>
			<div id="TOM_CKBox"><input type="checkbox" id="chkBox" name="TOM_check1" onclick="javascript:checkBoxFunc1(this)">  이용 약관에 동의 합니다. </div>
			<div class="well well-lg" id="termsOfMembership">회원 가입 동의서 내용부분입니다.
				약관의 내용은 미정입니다.
			</div>
			<div id="TOM_CKBox"><input type="checkbox" id="chkBox" name="TOM_check2" onclick="javascript:checkBoxFunc2(this)"> 이용 약관에 동의 합니다. </div>
			<div id="TOM_btn_div"><input class="btn btn-default btn-lg" type="button" id="TOM_btn" value="회원가입"></div>	
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
	var boxCheck1 = false;
	var boxCheck2 = false;
	function checkBoxFunc1(){
		let checkBox1 = $('input:checkbox[name=TOM_check1]');
		checkBox1.is(":checked") == true;
		boxCheck1 = checkBox1.is(":checked");
		console.log(boxCheck1);	
	}
	function checkBoxFunc2(){
		let checkBox2 = $('input:checkbox[name=TOM_check2]');
		checkBox2.is(":checked") == true;
		boxCheck2 = checkBox2.is(":checked");
		console.log(boxCheck2);	
	}
	window.onload = function(){
		console.log(boxCheck1+" : "+boxCheck2);	
		let btn_click = document.getElementById("TOM_btn");
		btn_click.onclick = btnLocationHref;
	}
	function btnLocationHref(){
		if(boxCheck1 == true && boxCheck2 == true){
			document.location.href = "signUpGET";
		}else{
			alert("회원 약관에 동의하지 않으면 회원가입이 불가능합니다.")
		}
	}

</script>
</html>