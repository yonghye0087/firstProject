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
    .MainContainer{
		width: 70%;
		text-align: left; 
		padding: 0px;
		left: 15px;
	}
	.contentHeader{
		max-width: 96%;
	}
	.table{
		margin-left: 5px;
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
    @media screen and (max-width: auto;) {
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
    #userInfoRight{
    	float: right;
    }
    .category{
    	color: #2F9D27;
    }
    .col-sm-8 MainContainer {
    	background-color: #FFFFFF; 
    	height: 100%;
    }
  </style>
  <script type="text/javascript" language="javascript">  	
  	function goPage(pages, lines) {
	    location.href = '?' + "pages=" + pages;
	}
  	
  	function novelWrite(){
  		var LoginID = '${sessionScope.LoginID}'
  		console.log(LoginID);
  		if(LoginID != null){
  			document.location.href = "novelWrite";	
  		}else{
  			alert("로그인이 필요합니다")
  			document.location.href = "loginUserGET";	
  		} 		
  	}
  </script>
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
	    <div class="col-sm-8 MainContainer"> 	    	
	    	<h1>${novelContent.novel_title}</h1><hr>
	    		<div class="well well-sm contentHeader">
					<h4><span class="category">[${novelContent.novel_chapter}]</span>${novelContent.novel_subtitle}</h4>
					<div><span class="glyphicon glyphicon-user"></span> ${novelContent.novel_id}
					<div id="userInfoRight"><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${novelContent.novel_date}" pattern="YYYY-MM-dd hh:MM:ss"/>
					<span class="glyphicon glyphicon-eye-open"></span> ${novelContent.novel_hit}</div></div>
				</div>
				<div class="well well-sm contentHeader" style="min-height: 500px; max-height: auto; background-color: white" >	
					<div style="height: auto;">${novelContent.novel_content}</div>								
				</div>		
	    <hr>
	    <table class="table row contentHeader">
				<thead>
					<tr>
						<th class="col-md-1" style="text-align: center;">글번호</th>
						<th class="col-md-5" style="text-align: center;">제목</th>
						<th class="col-md-2" style="text-align: center;">작성자</th>
						<th class="col-md-2" style="text-align: center;">조회수</th>
						<th class="col-md-2" style="text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${page}">
					<tr>
						<td class="col-md-1" style="text-align: center;">${list.novel_chapter}</td>
						<td class="col-md-5" style="text-align: center;"><a href="novelContent?novel_idx=${list.novel_idx}&&novel_id=${list.novel_id}">${list.novel_subtitle}</a></td>
						<td class="col-md-2" style="text-align: center;">${list.novel_id}</td>
						<td class="col-md-2" style="text-align: center;">${list.novel_hit}</td>
						<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${list.novel_date}" pattern="YYYY-MM-dd"/></td>
					</tr>
					</c:forEach>
				</tbody>			
			</table>
			<c:forEach var="list" items="${page}">
			<c:if test="${sessionScope.LoginID == list.novel_id || sessionScope.LoginID eq list.novel_id}">
			<button type="submit" class="btn btn-default" onclick="novelWrite()">소설쓰기</button>
			</c:if>
			</c:forEach>
		
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
	     <jsp:include page="../Module/SearchBar.jsp"></jsp:include>
	    </div>
	  </div>
	</div>
</body>
</html>