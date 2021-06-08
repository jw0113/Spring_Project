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


<br/><br/>
<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #643691;">도서 수정</div>
      <div class="card-body">
      <c:forEach var = "books" items="${books}">
        <form role="form" method="post">
          <div class="form-group">
            <label>도서 ID</label>
            <input type="text" class="form-control" name='bookid' id="bookid" value="${books.bookid}" readonly>
          </div>
          
          <div class="form-group">
            <label>도서명</label>
            <input type="text" class="form-control" name='bookname' id="bookname" value="${books.bookname}">    
          </div>

          <div class="form-group">
            <label>저자</label>
            <input type="text" class="form-control" name='bookauthor' id="bookauthor" value="${books.bookauthor}">    
          </div>
          
          <div class="form-group">
            <label>출판사</label>
            <input type="text" class="form-control" name='bookpublic' id="bookpublic" value="${books.bookpublic}">    
          </div>
          
          <div class="form-group">
            <label>책 소개</label>
            <textarea class="form-control" rows="5" name='bookcontent' id="bookcontent">${books.bookcontent}</textarea>
          </div>

          
          <input class="btn" type="submit" value="수정" id="signupdate-btn" style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8"/>
          <a class="btn" href="<c:url value='/manager/books?page=${p.page}&countPerPage=${p.countPerPage}' />"
		style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">목록</a>&nbsp;&nbsp;
          
        </form>
        </c:forEach>

      </div>
    </div>
  </div>
</div>
</div>
<script>
$(function() {

	//사용자가 수정 버튼을 눌렀을 때 이벤트 처리
	$("#signupdate-btn").click(function() {

		//id 정보
		const bookid = $("#bookid").val();

		//이름 정보
		const bookname = $("#bookname").val();
	
		const bookauthor = $("#bookauthor").val();
		
		const bookpublic = $("#bookpublic").val();
		
		const bookcontent = $("#bookcontent").val();
		console.log(bookcontent);

	
	const book = {
			bookid : bookid,
			bookname : bookname,
			bookauthor : bookauthor,
			bookpublic : bookpublic,
			bookcontent : bookcontent
	};
	
	//비동기 통신 시작!
	//클라이언트에서 서버와 통신하는 ajax함수 (비동기 통신)
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP 방식
		url: "/Term_Project/manager/bookmodify", //서버 요청 URL
		headers: {
			"Content-Type" : "application/json"
		}, //요청 헤더 정보
		dataType: "text", //서버로부터 응답받을 데이터의 형태
		data: JSON.stringify(book), //서버로 전송할 데이터
		success: function(result) { //서버와의 통신 성공 시 실행할 내용. 매개변수는 통신 성공 시 데이터가 저장될 곳.
			console.log("통신 성공!: " + result);
			if(result === "updateSuccess") {
				alert("도서 정보를 수정하였습니다!");
				location.href="/Term_Project/manager/books";
			} else {
				alert("도서 수정 실패!");
			}
		},
		error: function() {
			console.log("통신 실패!");
		}
		
	}); //end ajax

	}); //signupdate-btn 이벤트 처리 끝.

</script>