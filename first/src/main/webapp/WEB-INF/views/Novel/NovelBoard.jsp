<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  </style>
  <script type="text/javascript" language="javascript">  	
  	function goPage(pages, lines) {
	    location.href = '?' + "pages=" + pages;
	}
  	function novelProfileCreate(){
  		var LoginID = '${sessionScope.LoginID}'
  		console.log(LoginID);
  		if(LoginID != null){
  			let novel_title = "";
  			document.location.href = "novelProFileCreate";	
  		}else{
  			alert("로그인이 필요합니다")
  			document.location.href = "loginUserGET";	
  		} 		
  	}
  	$(document).ready(function(){
  		$('select[name=novel_visibility]').change(function(){
  			let selboxIndex = $('select[name=novel_visibility]').index(this);
  			let selTitle = $('a[name='+selboxIndex+']').text();
  			let selVisibility = document.getElementById("s"+selboxIndex);
  			let selvi = selVisibility.options[selVisibility.selectedIndex].value;
  			console.log(selboxIndex +" : "+ selTitle+" : "+selvi);
  			
  			$.ajax({
	  				type: "post",
	  				url: "/selectVisibility",
	  				data: {novel_title : selTitle, novel_visibility : selvi},
	  				success: function(){
	  					alert("설정변경 완료");
	  				},
	  				error: function(){
	  					alert("대실패!!");
	  				}
	  			});
  		})		
  	});
  	
  </script>
</head>
<body>
	<%@include file="..//Module/Navbar.jsp"%>
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	    <%@ include file="../Module/UserProfile.jsp"%>
	    </div>
	    <div class="col-sm-8 MainContainer"> 
	    	<h1>Novel List</h1>
	    	<input type="hidden" id="sessionID" value="${sessionScope.LoginID}">
			<table class="table row">
				<thead>
					<tr>
						<th class="col-md-1" style="text-align: center;">번호</th>
						<th class="col-md-3" style="text-align: center;">제목</th>
						<th class="col-md-2" style="text-align: center;">작성자</th>
						<th class="col-md-2" style="text-align: center;">생성일</th>
						<th class="col-md-1" style="text-align: center;">공개여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${page}" varStatus="status">
					<tr id="listBody">
						<td class="col-md-1" style="text-align: center;">${status.count}</td>
						<td class="col-md-3" style="text-align: center;"><a href="novelByTl?novel_title=${list.novel_title}&novel_id=${list.novel_id}" name="${status.index}">${list.novel_title}</a></td>
						<td class="col-md-2" style="text-align: center;" >${list.novel_id}</td>
						
						<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${list.novel_date}" pattern="YYYY-MM-dd"/></td>
							<c:choose>
								<c:when test="${list.novel_visibility == 0 || list.novel_visibility eq 0}">
									<td class="col-md-1" style="text-align: center;">
										<select class="form-control" id="s${status.index}" name="novel_visibility">
											<option selected id="selOp" value="0"> 비공개 </option>
											<option id="selOp" value="1"> 공개 </option>
										</select>
									</td>
								</c:when>
								<c:when test="${list.novel_visibility == 1 || list.novel_visibility eq 1}">
									<td class="col-md-1" style="text-align: center;">
										<select class="form-control" id="s${status.index}" name="novel_visibility">
											<option id="selOp" value="0"> 비공개 </option>
											<option selected id="selOp" value="1"> 공개 </option>
										</select>
									</td>
								</c:when>
							</c:choose>
					</tr>
					</c:forEach>
				</tbody>
							
			</table>
			<input type="button" class="btn btn-default" onclick="novelProfileCreate()" value="프로필 생성">
		
		
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