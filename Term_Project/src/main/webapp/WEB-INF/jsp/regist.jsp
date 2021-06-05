<%@ page contentType="text/html; charset=utf-8" %>
<div class="modal fade" id="sign-up" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 회원 가입
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<%--회원가입 진행 --%>
			<div class="modal-body">

				<form action="#" name="signup" id="signUpForm" method="post"
					style="margin-bottom: 0;">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span></p>
							</td>
								
							
						</tr>
						<tr>
							<td><input type="text" name="userId" id="user_id"
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="아이디를 입력하세요.">
								</td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="20" maxlength="20" id="password"
								name="userPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과 특수문자를 포함한 최소 8자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" maxlength="20" id="password_check"
								name="pw_check" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다."></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userName" id="user_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="한글로 최대 6자"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>주소을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="addressChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userAddress" id="user_address"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="주소를 입력하세요"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userEmail" id="user_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="ex) test@spring.com"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>핸드폰 번호을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="phoneChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userPhone" id="user_phone"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="ex) 010-0000-0000"></td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>회원가입하셔서 더 많은 서비스를 받아보세요~</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원가입" 
								class="btn form-control tooltipstered" id="signup-btn"
								style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$(function() {
	
	//입력값 중 하나라도 만족하지 못한다면 회원 가입 처리를 막기 위한 논리형 변수 선언.
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false;
	
	//회원 가입시 사용자의 입력값 검증!
	//ID 입력값 검증.
	$("#user_id").on('keyup', function() {
		
		//만일 입력하지 않을 경우
		if($("#user_id").val() === "") {
			$("#user_id").css("background-color", "pink");
			$("#idChk").html('<b style="font-size:14px; color:red;">[아이디는 필수 정보에요!]</b>');
			chk1 = false;
		}
		
		//ID 중복확인 비동기 처리
		else {
			
			//ID 중복확인 통신을 위해 id값을 가져오기.
			const id = $(this).val();
			console.log(id);
			
			//ajax 호출
			$.ajax({
				type: "POST",
				url: "/Term_Project/checkId",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: id,
				success: function(result) {
					console.log("통신 성공: " + result);
					if(result === "OK") {
						$("#user_id").css("background-color", "aqua");
						$("#idChk").html('<b style="font-size:14px; color:green;">[아이디 사용이 가능합니다!]</b>');
						chk1 = true;
					} else {
						$("#user_id").css("background-color", "pink");
						$("#idChk").html('<b style="font-size:14px; color:red;">[아이디가 중복됨!]</b>');
						chk1 = false;
					}
				},
				error: function() {
					console.log("통신 실패!");
				}
			});
			
		}
		
	}); //아이디 검증 끝.
	
	//패스워드 입력값 검증.
	$("#password").on('keyup', function() {
		//비밀번호란 공백 확인
		if($(this).val() === "") {
			$("#password").css("background-color", "pink");
			$("#pwChk").html('<b style="font-size:14px; color:red;">[비밀번호는 필수 정보!]</b>');
			chk2 = false;
		}
		else {
			$("#password").css("background-color", "aqua");
			$("#pwChk").html('<b style="font-size:14px; color:green;">[비밀번호 입력 완료!]</b>');
			chk2 = true;
		}
		
	}); //비밀번호 검증 끝
	
	//패스워드 확인란 입력 검증.
	$("#password_check").on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($(this).val() === "") {
			$("#password_check").css("background-color", "pink");
			$("#pwChk2").html('<b style="font-size:14px; color:red;">[비밀번호 확인은 필수 정보!]</b>');
			chk3 = false;
		}
		//비밀번호 확인란 유효성 검사
		else if($("#password").val() != $(this).val()) {
			$("#password_check").css("background-color", "pink");
			$("#pwChk2").html('<b style="font-size:14px; color:red;">[비밀번호와 일치하지 않습니다!]</b>');
			chk3 = false;
		} else {
			$("#password_check").css("background-color", "aqua");
			$("#pwChk2").html('<b style="font-size:14px; color:green;">[비밀번호 확인 완료!]</b>');
			chk3 = true;
		}
		
	}); //비밀번호 확인 검증 끝.
	
	//이름 입력값 검증.
	$("#user_name").on('keyup', function() {
		//이름값 공백 확인.
		if($(this).val() === "") {
			$("#user_name").css("background-color", "pink");
			$("#nameChk").html('<b style="font-size:14px; color:red;">[이름은 필수 정보!]</b>');
			chk4 = false;
		}
		else {
			$("#user_name").css("background-color", "aqua");
			$("#nameChk").html('<b style="font-size:14px; color:green;">[이름 작성 완료!]</b>');
			chk4 = true;
		}
		
	}); //이름 검증 끝.
	
	//주소 입력값 검증.
	$("#user_address").on('keyup', function() {
		
		//주소값 공백 확인.
		if($(this).val() === "") {
			$("#user_address").css("background-color", "pink");
			$("#addressChk").html('<b style="font-size:14px; color:red;">[주소는 필수 정보!]</b>');
			chk5 = false;
		}
		else {
			$("#user_address").css("background-color", "aqua");
			$("#addressChk").html('<b style="font-size:14px; color:green;">[주소 작성 완료!]</b>');
			chk5 = true;
		}
		
	}); //주소검증 끝.

	//이메일 입력값 검증.
	$("#user_email").on('keyup', function() {
		
		//이메일값 공백 확인.
		if($(this).val() === "") {
			$("#user_email").css("background-color", "pink");
			$("#emailChk").html('<b style="font-size:14px; color:red;">[이메일은 필수 정보!]</b>');
			chk6 = false;
		}
		else {
			$("#user_email").css("background-color", "aqua");
			$("#emailChk").html('<b style="font-size:14px; color:green;">[이메일 작성 완료!]</b>');
			chk6 = true;
		}
		
	}); //이메일 검증 끝.

	//핸드폰 번호 입력값 검증.
	$("#user_phone").on('keyup', function() {
		
		//핸드폰번호값 공백 확인.
		if($(this).val() === "") {
			$("#user_phone").css("background-color", "pink");
			$("#phoneChk").html('<b style="font-size:14px; color:red;">[핸드폰 번호는 필수 정보!]</b>');
			chk7 = false;
		}
		else {
			$("#user_phone").css("background-color", "aqua");
			$("#phoneChk").html('<b style="font-size:14px; color:green;">[핸드폰 번호 작성 완료!]</b>');
			chk7 = true;
		}
		
	}); //핸드폰 번호 검증 끝.

	
	//사용자가 회원 가입 버튼을 눌렀을 때 이벤트 처리
	$("#signup-btn").click(function() {
		if(chk1 && chk2 && chk3 && chk4 && chk5 && chk6 && chk7) {
			//아이디 정보
			const id = $("#user_id").val();
			//패스워드 정보
			const pw = $("#password").val();
			//이름 정보
			const name = $("#user_name").val();
			//주소 정보
			const address = $("user_address").val();
			//이메일 정보
			const email = $("user_email").val();
			//전화번호 정보
			const phone = $("user_phone").val();
			
			const member = {
					id : id,
					pw : pw,
					name : name,
					address : address,
					email : email,
					phone : phone
			};
			
			//비동기 통신 시작!
			//클라이언트에서 서버와 통신하는 ajax함수 (비동기 통신)
			$.ajax({
				type: "POST", //서버에 전송하는 HTTP 방식
				url: "/Term_Project/regist", //서버 요청 URL
				headers: {
					"Content-Type" : "application/json"
				}, //요청 헤더 정보
				dataType: "text", //서버로부터 응답받을 데이터의 형태
				data: JSON.stringify(member), //서버로 전송할 데이터
				success: function(result) { //서버와의 통신 성공 시 실행할 내용. 매개변수는 통신 성공 시 데이터가 저장될 곳.
					console.log("통신 성공!: " + result);
					if(result === "joinSuccess") {
						alert("회원 가입에 성공했습니다!");
						location.href="/Term_Project/";
					} else {
						alert("회원 가입 실패!");
					}
				},
				error: function() {
					console.log("통신 실패!");
				}
				
			}); //end ajax
		
		} else {
			alert("입력 정보를 다시 확인하세요!");
		}
		
	}); //signup-btn 이벤트 처리 끝.
});
</script>