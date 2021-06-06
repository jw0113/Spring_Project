<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
</head>
<br/><br/>
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
  
<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
    <c:forEach var="b" items="${books}">
      <div class="card-header text-white" style="background-color: #643691;">${b.bookname}</div>
      <div class="card-body">

        
          <div class="form-group">
            <label>저자</label>
            <input type="text" class="form-control" name='author' value="${b.bookauthor}" readonly>
          </div>
          
          <div class="form-group">
            <label>출판사</label>
            <input type="text" class="form-control" name='public' value="${b.bookpublic}" readonly>
          </div>

          <div class="form-group">
            <label>책 소개</label>
            <textarea class="form-control" rows="5" name='content' readonly>${b.bookcontent}</textarea>
          </div>

        <form id="formObj" role="form" action="<c:url value='/board/delete' />" method="post">
         
         	<input type="hidden" name="boardNo" value="${article.boardNo}">
         	<input type="hidden" name="page" value="${p.page}">
         	<input type="hidden" name="countPerPage" value="${p.countPerPage}"> 
         
	          <input type="button" value="목록" class="btn" id="list-btn"
			style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
	          
	          <c:if test="${login.name == article.writer}">
	          
		          <input type="button" value="대출하기" class="btn" id="modBtn"
				style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
       
       			</c:if>
        </form>
      </div>
      </c:forEach>
    </div>
  </div>
</div>
</div>

<script>
	
	//제이쿼리의 시작.
	$(function() {
		
		//목록버튼 클릭 이벤트 처리.
		$("#list-btn").click(function() {
			console.log("목록 버튼이 클릭됨!");
			location.href="/board/list?page=${p.page}&countPerPage=${p.countPerPage}&keyword=${p.keyword}&condition=${p.condition}";
		}); //목록버튼 처리 끝.
		
		//변수는 let, 상수는 const로 선언. (ES6 -> 2015)
		//const formElement = document.getElementById("formObj"); //vanilla js
		const formElement = $("#formObj");
		
		//수정버튼 클릭 이벤트
		$("#modBtn").click(function() {
			console.log("수정 버튼이 클릭됨!");
			formElement.attr("action", "/board/modify");
			formElement.attr("method", "get");
			formElement.submit();
		});

	}); //제이쿼리의 끝.
	
</script>