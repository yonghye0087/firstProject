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
  </style>
  <script type="text/javascript" language="javascript">  	
  	function goPage(pages, lines) {
	    location.href = '?' + "pages=" + pages;
	}
  	
  	function novelWrite(){
  		var LoginID = '${sessionScope.LoginID}'
  		console.log(LoginID);
  		if(LoginID != null){
  			let novel_title = "";
  			document.location.href = "novelWrite?novel_title="+novel_title;	
  		}else{
  			alert("로그인이 필요합니다")
  			document.location.href = "loginUserGET";	
  		} 		
  	}
  </script>
</head>
<body>
	<%@include file="..//Module/navbar.jsp"%>
	<div class="container-fluid text-center">    
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <%@ include file="../Module/profile.jsp"%>
	    </div>
	    <div class="col-sm-8 text-left"> 
	    	<h1>Novel List</h1>
			<table class="table row">
				<thead>
					<tr>
						<th class="col-md-5" style="text-align: center;">제목</th>
						<th class="col-md-2" style="text-align: center;">작성자</th>
						<th class="col-md-2" style="text-align: center;">챕터수</th>
						<th class="col-md-1" style="text-align: center;">조회수 총합</th>
						<th class="col-md-2" style="text-align: center;">최근 작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${page}">
					<tr>
						<td class="col-md-5" style="text-align: center;"><a href="novelByTl?novel_title=${list.novel_title}">${list.novel_title}</a></td>
						<td class="col-md-2" style="text-align: center;">${list.novel_id}</td>
						<td class="col-md-2" style="text-align: center;">${list.novel_chapter}</td>
						<td class="col-md-1" style="text-align: center;">${list.novel_hit}</td>
						<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${list.novel_date}" pattern="YYYY-MM-dd"/></td>
					</tr>
					</c:forEach>
				</tbody>
							
			</table>
			<button type="submit" class="btn btn-default" onclick="novelWrite()">소설 쓰기</button>
		
		
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