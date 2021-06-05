<%@ page contentType="text/html; charset=utf-8"%>
<!-- 로그인 Modal-->
<div class="modal fade" id="pw-chk">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;"></span> 패스워드 변경하기
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="#" name="pw-check" method="post" id="changepwForm" style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>현재 비밀번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;<span id="ppppp"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="nowPw"
								name="nowPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="현재 비밀번호"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>새로운 비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck1"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="changePw1"
								name="pw_check1" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="새로운 비밀번호"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>새로운 비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="wwwww"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" maxlength="20" id="changePw2"
								name="pw_check2" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="새로운 비밀번호가 일치해야합니다."></td>
						</tr>

						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="비밀번호 변경" class="btn form-control tooltipstered" id="pwchange-btn"
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

	let chk1 = false, chk2 = false, chk3 = false;
	var id = "";
	$('#pw-chk').on('show.bs.modal', function (e) {
	    id = $(e.relatedTarget).data('id');
	});

	
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
	
	
	//비밀번호 입력값 검증.
	$("#changePw1").on('keyup', function() {
		
		//비밀번호 공백 확인
		if($("#changePw1").val() === ""){
		    $("#changePw1").css("background-color", "pink");
			$("#pwCheck1").html('<b style="font-size:14px;color:red;">[새로운 비밀번호 입력은 필수!]</b>');
			chk2 = false;
		}		         

		else {
			$("#changePw1").css("background-color", "aqua");
			$("#pwCheck1").html('<b style="font-size:14px;color:green;">[새로운 비밀번호 입력 완료!]</b>');
			chk2 = true;
		}	
	}); //패스워드 검증 끝.

	//패스워드 확인란 입력 검증.
	$("#changePw2").on('keyup', function() {
		console.log($(this).val());
		//비밀번호 확인란 공백 확인
		if($("#changePw2").val() === "") {
			$("#changePw2").css("background-color", "pink");
			$('#wwwww').html('<b style="font-size:14px; color:red;">[새로운 비밀번호 확인은 필수 정보!]</b>');
			chk3 = false;
		}
		//비밀번호 확인란 유효성 검사
		else if($('#changePw1').val() != $(this).val()) {
			$("#changePw2").css("background-color", "pink");
			$("#wwwww").html('<b style="font-size:14px; color:red;">[새로운 비밀번호와 일치하지 않습니다!]</b>');
			chk3 = false;
		} else {
			$("#changePw2").css("background-color", "aqua");
			$("#wwwww").html('<b style="font-size:14px; color:green;">[새로운 비밀번호 확인 완료!]</b>');
			chk3 = true;
		}
		
	}); //비밀번호 확인 검증 끝.
	
	//수정 버튼 클릭 이벤트 처리.
	$("#pwchange-btn").click(function() {
		
		if(chk1 && chk2 && chk3) {
			const pw = $("#changePw1").val();

		    console.log("id: " + id);
			console.log("pw: " + pw);
			
			const member = {
					id: id,
					pw: pw
			};
			
			$.ajax({
				type: "POST",
				url: "/Term_Project/changePw",
				headers: {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data: JSON.stringify(member),
				success: function(data) {
					console.log("result: " + data);
					if(data === "updateSuccess") {
						alert("비밀번호를 수정하였습니다!");
						location.href="/Term_Project/";
					} else {
						alert("비밀번호 수정 실패!");
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