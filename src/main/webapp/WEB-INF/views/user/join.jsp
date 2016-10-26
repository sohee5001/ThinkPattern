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

		//한글 입력만 가능하게 만듬 폼
		$("#enterid").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});

		$("#enterid").focus();
		$("#enterid").blur(function() {
			var enterid = $("#enterid").val();
			if (enterid.length < 4 && enterid != "") {
				$("#check").html("4자 이상으로 입력해 주세요");
			} else {

				$.ajax({
					url : "http://127.0.0.1:8081/user/check",
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
			}
		});

		
		
		
		
		//email
		$("#email").blur(function() {
			var email = $("#email").val();
			

			$.ajax({
				url : "http://localhost:8080/user/emailCheck",
				type : "POST",
				data : {
					"email" : email
				},
				success : function(data) {
					if (data == 1) {
						$("#emailcheck").html("중복된 메일입니다.");
					} else if (data == 3) {
						$("#emailcheck").html("");
					} else {
						$("#emailcheck").html("사용가능한 메일입니다..");
					}
				},
				error : function(request, status, error) {

				}

			});
		
		});
		
		
		
		
		//name
		$("#name").blur(function() {
			var name = $("#name").val();
			

			$.ajax({
				url : "http://localhost:8080/user/nameCheck",
				type : "POST",
				data : {
					"name" : name
				},
				success : function(data) {
					if (data == 1) {
						$("#namecheck").html("중복된 닉네임입니다.");
					} else if (data == 3) {
						$("#namecheck").html("");
					} else {
						$("#namecheck").html("사용가능한 닉네임입니다..");
					}
				},
				error : function(request, status, error) {

				}

			});
		
		});
		
		
		
		
		
		
		
		
		$("#pw").blur(function() {
			var pw = $("#pw").val();
			if(pw.length < 4 && pw != "")
			{
				$("#checkminpw").html("4자 이상으로 입력해 주세요");
				alert(pw.length);
				alert(pw);
			}
			else
			{
	
				var re = /[~!@\#$%<>^&*\()\-=+_\']/gi;
				var english = /[0-9]|[^\!-z]/gi;
				var number = /[^0-9]/gi;
				
				
				if(re.test(pw) && english.test(pw) && number.test(pw))
				{
					$("#checkminpw").html("");
				}
				else
				{
					$("#checkminpw").html("~!@\#$%<>^&*\()\-=+_\ 와 같은 특수문자와 영문과 숫자를 혼합하세요");	
				}
			}
		});	

		$("#checkpw").blur(function() {
			var pw = $("#pw").val();
			var checkpw = $("#checkpw").val();
			if (checkpw.length < 4 && checkpw != "") {

				$("#resultpw").html("4자 이상으로 입력해 주세요");
				

			} else {
				if (pw === checkpw) {
					if (pw == "") {
						$("#resultpw").html("");
					} else {
						$("#resultpw").html("맞게 입력하셨습니다.");
					}
				} else {
					$("#resultpw").html("비밀번호가 다릅니다. 다시 입력하세요.");
				}
			}
		});

	})
</script>


<div id="main" class="wrapper style1">

	<div class="container">
		<div class="join_css">

			<form role="form" method="post">

						<div class="join_top">
				</div>
				<div class="join_logo">
					<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN &nbsp;
					회원가입
				</div>
				<p />
				<table  class="table table-bordered join_table">
			
						<tbody>
					<tr class="join_t">

						<td><label>ID</label></td>
						<td><input type="text" id="enterid" name="id" maxlength="10"
							placeholder="아이디를 입력해주세요" autocomplete=off></td>
						<td id="check" class="print" style="color: red">4자리 이상 10자리
							미만 영문으로만 입력하세요</td>
					</tr>


					<tr class="join_t">

						<td><label>password</label></td>
						<td><input type="password" name="password" id="pw"
							placeholder="비밀번호를 입력해주세요"></td>
						<td id="checkminpw" class="print" style="color: red">비밀번호는
							4자리 이상으로 입력하세요</td>

					</tr>


					<tr class="join_t">

						<td><label>confirmPW</label></td>
						<td><input type="password" id="checkpw" name="pw2"
							placeholder="비밀번호를 다시 입력해주세요"></td>
						<td id="resultpw" class="print" style="color: red"></td>

					</tr>

					<tr class="join_t">

						<td><label>name</label></td>
						<td><input type="text" name="name" placeholder="이름을 입력해주세요"
							autocomplete=off></td>
							<td id="namecheck" class="print"></td>
						

					</tr>


					<tr class="join_t">

						<td><label>email</label></td>
						<td><input type="text" name="email"
							placeholder="Email을 입력해주세요" autocomplete=off></td>
							<td id="emailcheck" class="print"></td>
						

					</tr>
						<tbody>
				</table>






				<div class="buttoncss">

					<button type="submit" class="button special small ">Submit</button>
					<a class="button small " href="/">Cancel</a>

				</div>
		</div>

		</form>

	</div>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
