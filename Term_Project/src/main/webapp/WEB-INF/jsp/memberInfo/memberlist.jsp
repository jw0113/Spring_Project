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
          <li class="nav-item dropdown">
            <a class="nav-link js-scroll-trigger dropdown-toggle" data-toggle="dropdown">MYPAGE</a>
            	<div class="dropdown-menu music-menu">
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberlist?id=${login}' />">나의 정보 보기</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">나의 정보 수정하기</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">도서 대출 내역</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">비밀번호 변경</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">회원탈퇴</a>
            	</div>
          </li>
        </ul>
      </div>
    </div>
  </nav><br><br><br>

  <!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="modal-content">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 나 의 개 인 정 보
				</h4>
			</div>
				<form action="#" name="signup" id="signUpForm" style="margin-bottom: 0;">
				<c:forEach var="member" items="${member}" varStatus="status">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p>
									<strong>아이디</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>


						</tr>
						<tr>
							<td>
							<input type="text" id="userId" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.id}" readonly/></td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>비밀번호</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td>
							<input type="text" id="userPw" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.pw}" readonly/></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>이름</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td>
							<input type="text" id="userName" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.name}" readonly/></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>주소</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="userAddress" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.address}" readonly/></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>이메일</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="userEmail" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.email}" readonly/></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p>
									<strong>핸드폰 번호</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="userPhone" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.phone}" readonly/></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p>
									<strong>등록 날짜</strong>&nbsp;&nbsp;&nbsp;<span></span>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="userRegistrationdate" 
								class="inputbox" maxlength="14"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" 
								value="${member.registrationdate}" readonly/></td>
						</tr>
					</table>
					</c:forEach>
				</form>
			</div>
	</header>
  </body>
</html>
	
	
	