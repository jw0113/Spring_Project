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
        ??????
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
            			<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberlist?id=${login}' />">?????? ?????? ??????</a>
            			<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberupdate?id=${login}' />">?????? ?????? ????????????</a>
            			<a class="dropdown-item music-tap" href="<c:url value='/bookDetailInfo/bookdetaillist?id=${login}' />">?????? ?????? ??????</a>
            			<a class="dropdown-item music-tap" text-color="$fff" data-toggle="modal" data-target="#pw-chk" data-id="${login}">???????????? ??????</a>
            			<a class="dropdown-item music-tap" text-color="$fff" data-toggle="modal" data-target="#login-delete" data-id="${login}">????????????</a>
            		</div>
            	</li>
        </ul>
      </div>
    </div>
  </nav><br><br><br>

  <!-- Header -->
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #643691;"></span> ?????? ??????
					
				</h2>
				
				<form action="#" name="signupdate" id="signUpdateForm" method="post" style="margin-bottom: 0;">
				<c:forEach var="member" items="${member}" varStatus="status">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%" border="3" bordercolor="puple">
						<tr>
							<td style="text-align: left">
								<p><strong>??????</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
								<input type="hidden" name="userId" id="user_id" value="${member.id}"></input>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userName" id="user_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${member.name}"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>??????</strong>&nbsp;&nbsp;&nbsp;<span id="addressChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userAddress" id="user_address"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${member.address}"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>?????????</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userEmail" id="user_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${member.email}"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>????????? ??????</strong>&nbsp;&nbsp;&nbsp;<span id="phoneChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userPhone" id="user_phone"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								value="${member.phone}"></td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>?????? ????????? ?????????????????????????</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="??????" 
								class="btn form-control tooltipstered" id="signupdate-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="??????" 
								class="btn form-control tooltipstered" id="cancel-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
					</c:forEach>
				</form>
			</div>
	</div></div></div>
	<script>
	
		$(function() {

			//???????????? ?????? ????????? ????????? ??? ????????? ??????
			$("#signupdate-btn").click(function() {

				//id ??????
				const id = $("#user_id").val();

				//?????? ??????
				const name = $("#user_name").val();
				//?????? ??????
				const address = $("#user_address").val();
				//????????? ??????
				const email = $("#user_email").val();
				//???????????? ??????
				const phone = $("#user_phone").val();

			
			const member = {
					id : id,
					name : name,
					address : address,
					email : email,
					phone : phone
			};
			
			//????????? ?????? ??????!
			//????????????????????? ????????? ???????????? ajax?????? (????????? ??????)
			$.ajax({
				type: "POST", //????????? ???????????? HTTP ??????
				url: "/Term_Project/memberInfo/memberupdate", //?????? ?????? URL
				headers: {
					"Content-Type" : "application/json"
				}, //?????? ?????? ??????
				dataType: "text", //??????????????? ???????????? ???????????? ??????
				data: JSON.stringify(member), //????????? ????????? ?????????
				success: function(result) { //???????????? ?????? ?????? ??? ????????? ??????. ??????????????? ?????? ?????? ??? ???????????? ????????? ???.
					console.log("?????? ??????!: " + result);
					if(result === "updateSuccess") {
						alert("?????? ????????? ?????????????????????!");
						location.href="/Term_Project/";
					} else {
						alert("?????? ?????? ?????? ??????!");
					}
				},
				error: function() {
					console.log("?????? ??????!");
				}
				
			}); //end ajax
		
			}); //signupdate-btn ????????? ?????? ???.
	});
	</script>
  </body>
</html>
