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
  <script src="<c:url value='resources/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  
  <!-- Plugin JavaScript -->
  <script src="<c:url value='resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="<c:url value='resources/js/jqBootstrapValidation.js'/>"></script>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<c:url value='resources/vendor/bootstrap/css/bootstrap.min.css'/>">

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" type="text/css" href="<c:url value='resources/vendor/fontawesome-free/css/all.min.css'/>" >
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="<c:url value='resources/css/agency.min.css'/>" >
  

<style>

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

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/Term_Project/">
      	<img class="img-fluid" src="<c:url value='resources/img/mark.png'/>" alt="" style="width:130px; height:70px;" />
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
            <a class="nav-link js-scroll-trigger" href="<c:url value='/Term_Project/introduce'/>">INTRODUCE</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link js-scroll-trigger dropdown-toggle" data-toggle="dropdown">MUSIC</a>
            <div class="dropdown-menu music-menu"> 
            
              <div class="dropdown dropright">            
		        <a class="dropdown-item dropdown-toggle music-tap" data-toggle="dropdown" style="color:white;">COLOR*IZ</a>
			    <div class="dropdown-menu music-menu"> 
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">La Vie En Rose MV</a>
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose-2">La Vie En Rose 교차편집</a>
			    </div>
		      </div>
		      
		      <div class="dropdown dropright">            
		        <a class="dropdown-item dropdown-toggle music-tap" data-toggle="dropdown" style="color:white;">HEART*IZ</a>
			    <div class="dropdown-menu music-menu"> 
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#violeta">Violeta MV</a>
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#violeta-2">Violeta 교차편집</a>	
			    </div>
		      </div>
		                
		      <a class="dropdown-item" data-toggle="dropdown" style="color:white;">TEST</a>

		      
		      <div class="dropdown dropright">            
		        <a class="dropdown-item dropdown-toggle music-tap" data-toggle="dropdown" style="color:white;">ONEIRIC DIARY</a>
			    <div class="dropdown-menu music-menu"> 
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#swan">환상동화 MV</a>
			      <a class="dropdown-item music-tap" data-toggle="modal" href="#swan-2">환상동화 교차편집</a>	
			    </div>
		      </div>
		      	   
		    </div>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/board/list' />">BOARD</a>
          </li>
          <c:if test="${login == null}">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#log-in">LOGIN</a>
	          </li>
          </c:if>
		  <c:if test="${login != null}">
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
          		<li class="nav-item">
	            	<a class="nav-link js-scroll-trigger" href="/user/logout" onclick="return confirm('진짜로 로그아웃 하시겠습니까?')" >LOGOUT</a>
	        	 </li>
          </c:if>
          
        </ul>
      </div>
    </div>
  </nav><br><br><br>

  <!-- Header -->
  <header class="masthead">
    <div class="container">
      <div class="intro-text">        
    
        <button class="btn btn-chu btn-xl text-uppercase js-scroll-trigger" data-toggle="modal" data-target="#log-in">CHU~</button>
    
    
      </div>
    </div>
  </header>
<%@ include file="../login.jsp" %>
<%@ include file="../regist.jsp" %> 
<%@ include file="../memberInfo/memberpwchange.jsp" %>  
<%@ include file="../memberInfo/memberdelete.jsp" %> 

