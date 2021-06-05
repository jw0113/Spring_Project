<%@ page contentType="text/html; charset=utf-8"%>
<!-- 로그인 Modal-->
<div class="modal fade" id="login-delete">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 회원 탈퇴
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="sign-x" method="post" id="deleteForm" style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>회원 탈퇴의 유의사항</strong>&nbsp;&nbsp;&nbsp;<span></span></p>
								<p>탈퇴 후 재 가입시, 제한을 받을 수 있습니다.</p><br>
								<p>만일 탈퇴 시, 더이상 해당 사이트의 서비스를 받을 수 없습니다.</p> <br>
								<p>정말로 탈퇴하시겠습니까?</p>
							</td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>본인확인을 위해 비밀번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;<span id="ddddd"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="lastpw"
								name="lastpw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="현재 비밀번호"></td>
						</tr>
						
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원탈퇴" class="btn form-control tooltipstered" id="delete-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="취소" class="btn form-control tooltipstered" id="lcancel-btn"
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


	let chk1 = false;
	
	var id = "";
	
	$('#login-delete').on('show.bs.modal', function (e) {
	    id = $(e.relatedTarget).data('id');
	});
	
	
	//현재 비밀번호 입력값 검증.
	$("#lastpw").on("keyup", function() {
		if($("#lastpw").val() === "") {
			$("#lastpw").css("background-color", "pink");
			$("#ddddd").html('<b style="font-size:14px; color:red;">[현재 비밀번호 필수 정보입니다!]</b>');
			chk1 = false;
		}

		else {
			const pw = $(this).val();
			
			 const member = {
						id : id,
						pw : pw,
				};

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
							$("#lastpw").css("background-color", "aqua");
							$("#ddddd").html('<b style="font-size:14px; color:green;">[일치함!]</b>');
							chk1 = true;
						} else {
							$("#lastpw").css("background-color", "pink");
							$("#ddddd").html('<b style="font-size:14px; color:red;">[불일치함!]</b>');
							chk1 = false;
						}
					},
					error: function() {
						console.log("통신 실패!");
					}
				});	
			
		}
	}); //현재 비밀번호 입력값 검증 끝.
	
	//버튼 클릭 이벤트 처리.
	$("#delete-btn").click(function() {
		
		if(chk1) {
			console.log("버튼 : " + id);
			$.ajax({
				type: "POST",
				url: "/Term_Project/memberdelete",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: id,
				success: function(data) {
					console.log("result: " + data);
					if(data === "deleteSuccess") {
						alert("정상적으로 회원 탈퇴되었습니다.");
						location.href="/Term_Project/";
					} else {
						alert("회원 탈퇴 실패!");
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