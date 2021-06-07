<%@ page contentType="text/html; charset=utf-8"%>
<!-- 로그인 Modal-->
<div class="modal fade" id="log-in">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 로그인
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="sign-in" method="post" id="signInForm"
					style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userId" id="signInId"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="최대 10자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="signInPw"
								name="userPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="최소 8자"></td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="로그인" class="btn form-control tooltipstered" id="signIn-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>
						<tr>
							<td
								style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

								<a class="btn form-control tooltipstered" data-toggle="modal"
								href="#sign-up"
								style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">
									회원가입</a>
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
//로그인 검증!

	//입력값 중 하나라도 만족하지 못한다면 회원 가입 처리를 막기 위한 논리형 변수 선언.
	let chk1 = false, chk2 = false
	
	//ID 입력값 검증.
	$("#signInId").on("keyup", function() {
		if($(this).val() === "") {
			$("#signInId").css("background-color", "pink");
			$("#idCheck").html('<b style="font-size:14px; color:red;">[아이디는 필수 정보입니다!]</b>');
			chk1 = false;
		}

		else {
			$("#signInId").css("background-color", "aqua");
			$("#idCheck").html('<b style="font-size:14px; color:green;">[id 입력 완료!]</b>');
			chk1 = true;
		}
	}); //ID 입력값 검증 끝.
	
	
	//비밀번호 입력값 검증.
	$('#signInPw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#signInPw").val() === ""){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[패스워드는 필수!]</b>');
			chk2 = false;
		}		         

		else {
			$('#signInPw').css("background-color", "aqua");
			$('#pwCheck').html('<b style="font-size:14px;color:green;">[pw 입력 완료!]</b>');
			chk2 = true;
		}	
	}); //패스워드 검증 끝.
	
	//로그인 버튼 클릭 이벤트 처리.
	$("#signIn-btn").click(function() {
		if(chk1 && chk2) {
			
			const id = $("#signInId").val();
			const pw = $("#signInPw").val();
			
			console.log("id: " + id);
			console.log("pw: " + pw);
			
			const userInfo = {
					id: id,
					pw: pw
			};
			
			$.ajax({
				type: "POST",
				url: "/Term_Project/logincheck",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: JSON.stringify(userInfo),
				success: function(data) {
					console.log("result: " + data);
					if(data === "idFail") {
					    $('#signInId').css("background-color", "pink");
						$('#idCheck').html('<b style="font-size:14px;color:red;">[회원가입 먼저 하세요!]</b>');
						$("#signInPw").val("");
						$("#signInId").focus(); //커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 메서드
						chk2 = false;
					} else if(data === "pwFail") {
						 $('#signInPw').css("background-color", "pink");
							$('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호가 틀렸습니다.]</b>');
							$("#signInPw").val("");
							$("#signInPw").focus(); //커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 메서드
							chk2 = false;
					} else {
						location.href="/Term_Project/";
					}
				},
				error: function() {
					console.log("통신 실패!");	
				}
			}); //end ajax
				
		} else {
			alert("입력 정보를 다시 확인하세요!");
		}
	}); //로그인 버튼 클릭 이벤트 끝.
	
}); //end jQuery
</script>