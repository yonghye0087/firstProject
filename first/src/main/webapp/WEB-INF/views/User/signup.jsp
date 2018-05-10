<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>SIGN UP</title>
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
  <script type="text/javascript">
  
  	/* 회원가입 유효성 검사  start*/
  	/* 아이디, 비밀번호, 비밀번호 확인,이메일, 힌트  다섯가지를 적은 뒤 포커스 아웃이나 키업으로 식에 맞는지 확인, 값을 비워뒀던가 혹은 공백이 포함되었는지 확인, 확인 뒤에 값들을 컨트롤러로 넘기도록 작성할것.*/
  	
  	$(document).ready(function(){
  		
  		/* 정규식 */
		let idRegExp = /^[a-zA-Z]+[a-zA-Z0-9]{7,15}$/g;
		let pwRegExp = /^[a-zA-Z]+[a-zA-Z0-9]{7,15}$/g;
		let emailRegExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		let regExpNum = /\d/;
		let blank_pattern =  /\s/;
		
		/* 비교 수치 선언 */
		let sign_id = null;
		let sign_pw = null;
		let sign_repw = null;
		let sign_email = null;
		let sign_hint = null;
		
		/* ajax data 값 */
		let ck_sign_id = null;
		let ck_sign_pw = null;
		let ck_sign_email = null;
		let ck_sign_hint = null;
		let alldata;
		/* 아이디 유효성 검사 */
  		$('#signUpId').focusout(function(){
  			sign_id = document.getElementById("signUpId").value;
  			console.log(sign_id);
  			console.log(sign_id.length);
  			if(idRegExp.test(sign_id)){
				console.log(idRegExp.test(sign_id));
				if(regExpNum.test(sign_id) == true){
					document.getElementById('divSignUpId').className = "form-group has-success has-feedback";
					ck_sign_id = sign_id;
				}else{
					document.getElementById('divSignUpId').className = "form-group has-error has-feedback";
	  	  			document.getElementById("signUpId").value = "";
	  	  			$('input#signUpId').attr("placeholder","아이디는 숫자가 포함되야 합니다..");
				} 
  			}
  			if(!idRegExp.test(sign_id)){
  				console.log(idRegExp.test(sign_id));
  				document.getElementById('divSignUpId').className = "form-group has-error has-feedback";
  				document.getElementById("signUpId").value = "";
  				$('input#signUpId').attr("placeholder","아이디는 8~16자 사이로 만들어주세요.");
  			}
  			
  			if(blank_pattern.test(sign_id) == true){
				document.getElementById('divSignUpId').className = "form-group has-error has-feedback";
  				document.getElementById("signUpId").value = "";
  				$('input#signUpId').attr("placeholder","아이디에 공백이 포함되면 안됩니다.");
			}
		})
		
		/* 비밀번호 유효성 검사 */
  		$('#signUpPw').focusout(function(){
  			sign_pw = document.getElementById("signUpPw").value;
  			console.log(sign_pw);
  			console.log(sign_pw.length);
  			if(pwRegExp.test(sign_pw)){
				console.log(pwRegExp.test(sign_pw));
				if(regExpNum.test(sign_pw) == true){
					document.getElementById('divSignUpPw').className = "form-group has-success has-feedback"; 	
				}else{
					document.getElementById('divSignUpPw').className = "form-group has-error has-feedback";
	  	  			document.getElementById("signUpPw").value = "";
	  	  			$('input#signUpPw').attr("placeholder","비밀번호는 숫자가 포함되야 합니다..");
				} 
  			}
  			if(!pwRegExp.test(sign_pw)){
  				console.log(pwRegExp.test(sign_pw));
  				document.getElementById('divSignUpId').className = "form-group has-error has-feedback";
  				document.getElementById("signUpPw").value = "";
  				$('input#signUpPw').attr("placeholder","비밀번호는 8~16자 사이로 만들어주세요.");
  			}
  			
  			if(blank_pattern.test(sign_pw) == true){
				document.getElementById('divSignUpId').className = "form-group has-error has-feedback";
  				document.getElementById("signUpPw").value = "";
  				$('input#signUpPw').attr("placeholder","비밀번호에 공백이 포함되면 안됩니다.");
			}
		})
  		/* 비밀번호 확인 검사 */
  		$('#signUpRePw').focusout(function(){
  			sign_repw = document.getElementById("signUpRePw").value;
  			console.log(sign_pw+" : "+sign_repw);
  			if(sign_pw.match(null)){
  				document.getElementById('divSignUpRePw').className = "form-group has-error has-feedback";
  				$('input#signUpRePw').attr("placeholder","비밀번호를 입력해주세요.");
  			}
  			if(sign_pw != sign_repw){
  				document.getElementById('divSignUpRePw').className = "form-group has-error has-feedback";
  				document.getElementById("signUpRePw").value = "";
  				$('input#signUpRePw').attr("placeholder","입력한 비밀번호와 다릅니다.");
  			}
			if(sign_pw == sign_repw){
  				document.getElementById('divSignUpRePw').className = "form-group has-success has-feedback"; 
  				ck_sign_pw = sign_pw;
  			}
  		})
  		/* 이메일 확인 검사 */
  		$('#signUpEmail').focusout(function(){
  			sign_email = document.getElementById("signUpEmail").value;
  			if(!emailRegExp.test(sign_email)){
  				document.getElementById('divSignUpEmail').className = "form-group has-error has-feedback";
  				document.getElementById("signUpEmail").value = "";
  				$('input#signUpEmail').attr("placeholder","잘못된 이메일 형식입니다.");
  			}else{
  				document.getElementById('divSignUpPw').className = "form-group has-success has-feedback";
  				ck_sign_email = sign_email;
  			}
  		})
  		/* hint focus out */
  		$('#signUpHint').focusout(function(){
  			sign_hint = document.getElementById("signUpHint").value;
  			ck_sign_hint = sign_hint;
  		})
  	/* 유효검사 end */
  		/* controller-ajax 통신 */
	  	$('#signUpSmt').click(function(){
  			console.log("id: "+sign_id+" pw: "+sign_pw+" email: "+sign_email+" hint: "+sign_hint);
			console.log("C_id: "+ck_sign_id+" C_pw: "+ck_sign_pw+" C_email: "+ck_sign_email+" C_hint: "+ck_sign_hint);
			alldata = {id : ck_sign_id , pw : ck_sign_pw, email : ck_sign_email, hint: ck_sign_hint};
			
			console.log(alldata);
			$.ajax({
				type: "POST",
				url: "/signUpPOST",
				data: JSON.stringify(alldata),
				contentType : "application/json; charset=UTF-8",
				dataType: "json",
				success: function(data){
					console.log(data);
					if(data == true){
						alert("계정 생성 완료");
						document.location.href = "/loginUserGET";
					}else{
						alert("아이디나 이메일이 이미 존재합니다.");
						document.location.href = "/signUpGET";
					}
					self.close();
				},
				error : function(jqXHR, textStatus, errorThrown){
		            alert("계정 생성 에러 \n" + textStatus + " : " + errorThrown);
				}     
			})		
		})
  	})
  </script>
</head>
<body>
	<%@include file="../Module/navbar.jsp"%>
	  
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	      <p><a href="#"></a></p>
	    </div>
	    <div class="col-sm-8 text-left"> 
	    <h2> 회원 가입</h2>
			<form id="signForm" action="/signUpPOST" method="post">
				<label for="id">ID : </label>
		      		<div class="form-group" id="divSignUpId" >
		      			<input type="text" class="form-control" id="signUpId" name="id" value="qwer1234" />
		      		</div>
		      		
		      	<label for="pw">PW : </label>
			      	<div class="form-group" id="divSignUpPw">
			    	  	<input type="password" class="form-control" id="signUpPw" name="pw" value="qwer1234"/>
			      	</div>
			      	
		      	<label for="pwck">RE-PW : </label>
			      	<div class="form-group" id="divSignUpRePw">
			    	  	<input type="password" class="form-control" id="signUpRePw" value="qwer1234"/>
			      	</div>
			      	
		      	<label for="email">EMAIL : </label>
			      	<div class="form-group" id="divSignUpEmail">
			      		<input type="text" class="form-control" id="signUpEmail" name="email" value="qwer1234@naver.com" />
			      	</div>
		      	
		      	<label for="hint">HINT : </label>	
			      	<div class="form-group" >
			     		<input type="text" class="form-control" id="signUpHint" name="hint" value="qwer1234" />
			      	</div>
		      	
		      	<button type="button" class="btn btn-default" id="signUpSmt">submit</button>
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