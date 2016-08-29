<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<script>
	var result = '${result}';
	if (result == 'joinFail') {
		alert("회원가입에 실패하셨습니다 다시 하세요");
	}
	if (result == 'loginFail') {
		alert("아이디가 다르거나 비밀번호를 잘못 입력하셨습니다 다시 시도하세요");
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#enterid").focus();
		$("#enterid").blur(function() {
			var enterid = $("#enterid").val();
			$.ajax({
				url : "http://localhost:8080/user/check",
				type : "POST",
				data : {
					"id" : enterid
				},
				success : function(data) {
					if (data == 1) {
						$("#check").html("중복된아이디입니다.");
					} else if (data == 3) {
						$("#check").html("");
					} else {
						$("#check").html("사용가능한아이디입니다..");
					}
				},
				error : function(request, status, error) {

				}

			});
		});

		$("#checkpw").blur(function() {
			var pw = $("#pw").val();
			var checkpw = $("#checkpw").val();
			if (pw === checkpw) {
				if (pw == "") {
					$("#resultpw").html("");
				} else {
					$("#resultpw").html("맞게 입력하셨습니다.");
				}
			} else {
				$("#resultpw").html("비밀번호가 다릅니다. 다시 입력하세요.");
			}

		});

	});

</script>


<div id="main" class="wrapper style1">

	<div class="container">
		<div class="join_css">

			<form role="form" method="post">
				<div>
					<div class="join_logo">
						<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN
						&nbsp; 회원가입

					</div>
					<p />
					<div>
						<label>ID</label> <input type="text" id="enterid" name="id"
							placeholder="아이디를 입력해주세요">
					</div>

					<div id="check" class="print"></div>
					<div>
						<label>password</label> <input type="password" name="password"
							id="pw" placeholder="비밀번호를 입력해주세요">
					</div>

					<div>
						<label>confirmPW</label> <input type="password" id="checkpw"
							name="pw2" placeholder="비밀번호를 다시 입력해주세요">
					</div>

					<div id="resultpw" class="print"></div>

					<div>
						<label>name</label> <input type="text" name="name"
							placeholder="이름을 입력해주세요">
					</div>

					<div>
						<label>email</label><input type="text" name="email"
							placeholder="Email을 입력해주세요">
					</div>

					<div class="buttoncss">

						<button type="submit" class="button special small ">Submit</button>
						<a class="button small " href="/">Cancel</a>

					</div>


					<div>
						<!--로그인 실패 성공 뿌려주기  -->
					</div>


				</div>
			</form>

		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
