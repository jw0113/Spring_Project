<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title></title>
  
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='../resources/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='../resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  
  <!-- Plugin JavaScript -->
  <script src="<c:url value='../resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="<c:url value='../resources/js/jqBootstrapValidation.js'/>"></script>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<c:url value='../resources/vendor/bootstrap/css/bootstrap.min.css'/>">

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" type="text/css" href="<c:url value='../resources/vendor/fontawesome-free/css/all.min.css'/>" >
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="<c:url value='../resources/css/agency.min.css'/>" >

<style>
header.masthead {
	
	display: none;
}	
.btn-orange {
	background-color: orange;
	color: white;
}
.btn-izone {
	background-color: #643691;
	color: white;
}
.page-active {
	background-color: #643691;
}

.music-menu {
	background-color: #643691;
	border: 1px solid #fffe2e;
	
}
.music-tap {
	color: white;
}
.music-tap:hover {
    background-color: #643691;
    color: #F7FE2E;
    text-shadow: 5px 2px 2px black;
}

.dropdown:hover > .dropdown-menu { 
    display: block;  
}

</style>
</head>

<br><br> 
<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/Term_Project/">
      	<img class="img-fluid" src="<c:url value='../resources/img/mark.png'/>" alt="" style="width:130px; height:70px;" />
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        메뉴
        <i class="fas fa-bars"></i>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/Term_Project/">HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/bookInfo/booklis?id=${login}' />">BOARD</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link js-scroll-trigger dropdown-toggle" data-toggle="dropdown">BOOKService</a>
            	<div class="dropdown-menu music-menu">
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberlist?id=${login}' />">전체 도서 보기</a>
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberupdate?id=${login}' />"></a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">도서 대출 내역</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" data-target="#pw-chk" data-id="${login}">비밀번호 변경</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" data-target="#login-delete" data-id="${login}">회원탈퇴</a>
            	</div>
          </li>
          <li class="nav-item dropdown">
            	<a class="nav-link js-scroll-trigger dropdown-toggle" data-toggle="dropdown">MYPAGE</a>
            	<div class="dropdown-menu music-menu">
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberlist?id=${login}' />">나의 정보 보기</a>
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberupdate?id=${login}' />">나의 정보 수정하기</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">도서 대출 내역</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" data-target="#pw-chk" data-id="${login}">비밀번호 변경</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" data-target="#login-delete" data-id="${login}">회원탈퇴</a>
            	</div>
           </li>
        </ul>
      </div>
    </div>
  </nav><br><br><br>
 
    <!-- Begin Page Content -->
	
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #643691;"></span> 도서 목록
					
				</h2>
					<table class="table table-bordered table-hover">
						<thead>
							<tr style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
								<th>#번호</th>
								<th>도서 이름</th>
								<th>도서 저자</th>
								<th>출판사</th>
								<th>등록일</th>
							</tr>
						</thead>

						
						<c:forEach var="b" items="${books}">
							<tr style="color: #643691;">
								<td>${b.booknum}</td>

								<td><a style="margin-top: 0; height: 40px; color: orange;" href="<c:url value='/bookInfo/bookcontent?id=${login}&bookid=${b.bookid}' />">
										${b.bookname}
									</a>
									&nbsp;
									<c:if test="${b.newMark}">
										<img alt="newmark" src="<c:url value='../resources/img/icon_new.gif' />">
									</c:if>
								</td>
								<td>${b.bookauthor}</td>
								<td>${b.bookpublic}</td>

								<td>
									<fmt:formatDate value="${b.registDate}" pattern="yyyy년MM월 dd일 HH:mm" />
								</td>
							</tr>
						</c:forEach>
					</table>
					
					<!-- 페이징 처리 부분  -->
					<ul class="pagination justify-content-center">
						<!-- 이전 버튼 -->
						<c:if test="${pc.prev}">
	                       	<li class="page-item">
								<a class="page-link" href="<c:url value='/bookDetailInfo/bookdetail${pc.makeURI(pc.beginPage-1) }' />" 
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 번호 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="page-item">
							   <a href="<c:url value='/board/list${pc.makeURI(pageNum)}' />" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: pink; border: 1px solid #643691;">${pageNum}</a>
							</li>	
					    </c:forEach>
					    
					    <!-- 다음 버튼 -->
					    <c:if test="${pc.next}">
						    <li class="page-item">
						      <a class="page-link" href="<c:url value='/board/list${pc.makeURI(pc.endPage+1) }' />" 
						      style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
						    </li>
					    </c:if>
				    </ul>
					<!-- 페이징 처리 끝 -->
					</div>
				</div>
			</div>
					<!-- 검색 버튼 -->
					<div class="row">
						<div class="col-sm-2"></div>
	                    <div class="form-group col-sm-2">
	                        <select id="condition" class="form-control" name="condition">                            	
	                            <option value="bookname" ${param.condition == 'bookname' ? 'selected' : ''}>도서명</option>
	                            <option value="bookauthor" ${param.condition == 'bookauthor' ? 'selected' : ''}>저자</option>
	                        </select>
	                    </div>
	                    <div class="form-group col-sm-4">
	                        <div class="input-group">
	                            <input type="text" class="form-control" name="keyword" value="${param.keyword}" id="keywordInput" placeholder="검색어">
	                            <span class="input-group-btn">
	                                <input type="button" value="검색" class="btn btn-izone btn-flat" id="searchBtn">                                       
	                            </span>
	                        </div>
	                    </div>
						<div class="col-sm-2"></div>
					</div>
					
		
	</div>
	
	<script>	
		//start jQuery
		$(function() {
			
			//한 페이지당 보여줄 게시물 개수가 변동하는 이벤트 처리.
			$("#count-per-page .btn-list").click(function() {
				//this: 클릭의 주체가 되는 객체
				//val(): 특정 태그 내부의 값을 읽어오는 메서드.
				let count = $(this).val();
				const keyword = "${param.keyword}";
				const condition = "${param.condition}";
				//console.log(count);
				location.href="/board/list?page=${pc.paging.page}&countPerPage=" + count 
						+ "&keyword=" + keyword + "&condition=" + condition;
			});
			
			//검색 버튼 이벤트 처리
			$("#searchBtn").click(function() {
				console.log("검색 버튼이 클릭됨!");
				const keyword = $("#keywordInput").val();
				console.log("검색어: " + keyword);
				const condition = $("#condition option:selected").val();
				console.log("검색 조건: " +  condition);
				
				location.href="/Term_Project/bookInfo/search?keyword=" + keyword + "&condition=" + condition;
			});
			
			//검색창에 엔터키 입력 시 이벤트 처리.
			$("#keywordInput").keydown(function(key) {
				if(key.keyCode == 13) { //키가 13번이면 실행 (엔터 -> 13)
					$("#searchBtn").click();
				}
			});
			
			
		}); //end jQuery
	</script>