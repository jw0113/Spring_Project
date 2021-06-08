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
</style>

</head>
<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/Term_Project/manager">
      	<img class="img-fluid" src="<c:url value='../resources/img/mark.png'/>" alt="" style="width:130px; height:70px;" />
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        메뉴
        <i class="fas fa-bars"></i>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/Term_Project/manager">관리자 PAGE      HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/Term_Project/introduce'/>">NOTICE</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/manager/books' />">BOARD</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link js-scroll-trigger dropdown-toggle" data-toggle="dropdown">BOOKService</a>
            	<div class="dropdown-menu music-menu">
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberupdate?id=${login}' />">희망 도서 예약하기</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">신규 도서 신청하기</a>
            	</div>
          </li>
          
		  <c:if test="${login != null}">
          		<li class="nav-item">
	            	<a class="nav-link js-scroll-trigger" href="/user/logout" onclick="return confirm('진짜로 로그아웃 하시겠습니까?')" >LOGOUT</a>
	        	 </li>
          </c:if>
          
        </ul>
      </div>
    </div>
  </nav><br><br><br>

<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #643691;">도서 추가</div>
      <div class="card-body">

        <form role="form" method="post">
        
          <div class="form-group">
            <label>도서 ID</label>
            <input type="text" class="form-control" name='bookid'>
          </div>
        
          <div class="form-group">
            <label>도서명</label>
            <input type="text" class="form-control" name='bookname'>
          </div>
          
          <div class="form-group">
            <label>저자</label>
            <input type="text" class="form-control" name='bookauthor'>
          </div>
          
          <div class="form-group">
            <label>출판사</label>
            <input type="text" class="form-control" name='bookpublic'>
          </div>

          <div class="form-group">
            <label>책 소개</label>
            <textarea class="form-control" rows="50" name='bookcontent'></textarea>
          </div>

         <input type="submit" value="등록" class="btn form-control"
			style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a class="btn form-control"	href="<c:url value='/manager/books' />"
		style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">취소</a>
        </form>
      </div>
    </div>
  </div>
</div>
</div>