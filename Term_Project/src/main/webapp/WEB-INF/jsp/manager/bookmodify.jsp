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
        ??????
        <i class="fas fa-bars"></i>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<c:url value='/manager'/>">????????? PAGE      HOME</a>
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
            		<a class="dropdown-item music-tap" href="<c:url value='/memberInfo/memberupdate?id=${login}' />">?????? ?????? ????????????</a>
            		<a class="dropdown-item music-tap" data-toggle="modal" href="#lavieenrose">?????? ?????? ????????????</a>
            	</div>
          </li>
          <c:if test="${login != null}">
          		<li class="nav-item">
	            	<a class="nav-link js-scroll-trigger" href="/user/logout" onclick="return confirm('????????? ???????????? ???????????????????')" >LOGOUT</a>
	        	 </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav><br><br><br>

<br/><br/>
<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #643691;">?????? ??????</div>
      <div class="card-body">
      <c:forEach var = "books" items="${books}">
        <form role="form" method="post">
          <div class="form-group">
            <label>?????? ID</label>
            <input type="text" class="form-control" name='bookid' id="bookid" value="${books.bookid}" readonly>
          </div>
          
          <div class="form-group">
            <label>?????????</label>
            <input type="text" class="form-control" name='bookname' id="bookname" value="${books.bookname}">    
          </div>

          <div class="form-group">
            <label>??????</label>
            <input type="text" class="form-control" name='bookauthor' id="bookauthor" value="${books.bookauthor}">    
          </div>
          
          <div class="form-group">
            <label>?????????</label>
            <input type="text" class="form-control" name='bookpublic' id="bookpublic" value="${books.bookpublic}">    
          </div>
          
          <div class="form-group">
            <label>??? ??????</label>
            <textarea class="form-control" rows="5" name='bookcontent' id="bookcontent">${books.bookcontent}</textarea>
          </div>

          
          <input class="btn" type="submit" value="??????" id="signupdate-btn" style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8"/>
          <a class="btn" href="<c:url value='/manager/books?page=${p.page}&countPerPage=${p.countPerPage}' />"
		style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">??????</a>&nbsp;&nbsp;
          
        </form>
        </c:forEach>

      </div>
    </div>
  </div>
</div>
</div>
<script>
$(function() {

	//???????????? ?????? ????????? ????????? ??? ????????? ??????
	$("#signupdate-btn").click(function() {

		//id ??????
		const bookid = $("#bookid").val();

		//?????? ??????
		const bookname = $("#bookname").val();
	
		const bookauthor = $("#bookauthor").val();
		
		const bookpublic = $("#bookpublic").val();
		
		const bookcontent = $("textarea#bookcontent").val();
		console.log(bookcontent);

	
	const book = {
			bookid : bookid,
			bookname : bookname,
			bookauthor : bookauthor,
			bookpublic : bookpublic,
			bookcontent : bookcontent
	};
	
	//????????? ?????? ??????!
	//????????????????????? ????????? ???????????? ajax?????? (????????? ??????)
	$.ajax({
		type: "POST", //????????? ???????????? HTTP ??????
		url: "/Term_Project/manager/bookmodify", //?????? ?????? URL
		headers: {
			"Content-Type" : "application/json"
		}, //?????? ?????? ??????
		dataType: "text", //??????????????? ???????????? ???????????? ??????
		data: JSON.stringify(book), //????????? ????????? ?????????
		success: function(result) { //???????????? ?????? ?????? ??? ????????? ??????. ??????????????? ?????? ?????? ??? ???????????? ????????? ???.
			console.log("?????? ??????!: " + result);
			if(result === "updateSuccess") {
				alert("?????? ????????? ?????????????????????!");
				location.href="/Term_Project/manager/books";
			} else {
				alert("?????? ?????? ??????!");
			}
		},
		error: function() {
			console.log("?????? ??????!");
		}
		
	}); //end ajax

	}); //signupdate-btn ????????? ?????? ???.

</script>