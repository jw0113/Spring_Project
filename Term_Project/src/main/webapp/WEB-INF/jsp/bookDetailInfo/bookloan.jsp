<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal fade" id="book-loan">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 도서 대출
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="book-loan" method="post" id="bookLoanForm"
					style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>회원 아이디 </strong>&nbsp;&nbsp;&nbsp;<span></span></p>
							</td>
							
						</tr>
						<tr>
							<td><input type="text" name="userId" id="memberid"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" readonly></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>도서 이름  </strong>&nbsp;&nbsp;&nbsp;<span></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userId" id="bookname"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" readonly></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>대출 날짜  </strong>&nbsp;&nbsp;&nbsp;<span></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="loandate"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" readonly></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>반납 날짜  </strong>&nbsp;&nbsp;&nbsp;<span></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="returndate"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de" readonly></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span id="ppppp"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="nowPw"
								name="nowPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="확인을 위해 현재 비밀번호를 입력하세요."></td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="도서 대출" class="btn form-control tooltipstered" id="loan-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<script>

//start jQuery
$(function() {

	//입력값 중 하나라도 만족하지 못한다면 회원 가입 처리를 막기 위한 논리형 변수 선언.
	let chk1 = false

	var id = "";
	var bookid = "";
	var bookname = "";
	var date = new Date();
	var returndate = new Date(Date.parse(date) + 7 * 1000 * 60 * 60 * 24);

	$('#book-loan').on('show.bs.modal', function (e) {
	    id = $(e.relatedTarget).data('id');
	    $("#memberid").val(id);
	});

	$('#book-loan').on('show.bs.modal', function (e) {
	    bookid = $(e.relatedTarget).data('bookid');
	});

	$('#book-loan').on('show.bs.modal', function (e) {
	    bookname = $(e.relatedTarget).data('bookname');
	    $("#bookname").val(bookname);
	});

	//$("#memberid").val(id);
	//$("#bookname").val(bookname);
	$("#loandate").val(date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+(date.getDate()+1)).slice(-2));
	$("#returndate").val(returndate.getFullYear() + "-" + ("0"+(returndate.getMonth()+1)).slice(-2) + "-" + ("0"+(returndate.getDate()+1)).slice(-2));
	
	
	//현재 비밀번호 입력값 검증.
	$("#nowPw").on("keyup", function() {
		if($("#nowPw").val() === "") {
			$("#nowPw").css("background-color", "pink");
			$("#ppppp").html('<b style="font-size:14px; color:red;">[현재 비밀번호 필수 정보입니다!]</b>');
			chk1 = false;
		}

		else {
			const pw = $(this).val();
			
			 const member = {
						id : id,
						pw : pw,
				};
				
			    console.log(id);

			  	//ajax 호출
				$.ajax({
					type: "POST",
					url: "/Term_Project/checkPw",
					headers: {
						"Content-Type" : "application/json"
					}, //요청 헤더 정보
					dataType: "text", //서버로부터 응답받을 데이터의 형태
					data: JSON.stringify(member), //서버로 전송할 데이터
					success: function(result) {
						console.log("통신 성공: " + result);
						if(result === "OK") {
							$("#nowPw").css("background-color", "aqua");
							$("#ppppp").html('<b style="font-size:14px; color:green;">[현재 비밀번호와 일치함!]</b>');
							chk1 = true;
						} else {
							$("#nowPw").css("background-color", "pink");
							$("#ppppp").html('<b style="font-size:14px; color:red;">[현재 비밀번호와 불일치함!]</b>');
							chk1 = false;
						}
					},
					error: function() {
						console.log("통신 실패!");
					}
				});	
		}
	}); //현재 비밀번호 입력값 검증 끝.

	//도서대출 버튼을 눌렀을 때 이벤트
	$("#loan-btn").click(function() {
		if(chk1) {
			console.log(bookid)
			
			const bookDetailInfo = {
					bookid: bookid,
					loanDate: date,
					returnDate: returndate,
					memberid : id  
			};

			console.log(date);
			console.log(returndate);
			
			$.ajax({
				type: "POST",
				url: "/Term_Project/bookDetail/bookloan",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: JSON.stringify(bookDetailInfo),
				success: function(result) {
					if(result === "Success") {
						alert("도서 대출 되었습니다!");
						location.href="/Term_Project/";
					} else {
						alert("도서 대출 실패!");
					}
				},
				error: function() {
					console.log("통신 실패!");	
				}
			}); //end ajax
				
		} else {
			alert("입력 정보를 다시 확인하세요!");
		}
	}); 
	
}); //end jQuery
</script>