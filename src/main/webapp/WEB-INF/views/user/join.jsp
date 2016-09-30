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
		var specialChar = 0;
		//한글 입력만 가능하게 만듬 폼
		$("#enterid").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
			});
		
		
		
		
		
		
		$("#enterid").focus();
		$("#enterid").blur(function() {
			var enterid = $("#enterid").val();
			if(enterid.length < 4 && enterid != "")
			{
				$("#check").html("4자 이상으로 입력해 주세요");
			}
			else
			{
			
			
			
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
			}
		});

	//할 부분 	
	$("#pw").blur(function() {
		var pw = $("#pw").val();
		if(pw.length < 4 && pw != "")
		{
			$("#checkminpw").html("4자 이상으로 입력해 주세요");
			
		}
		else
		{
			//var specialChar check = 0;
			var re = /[~!@\#$%<>^&*\()\-=+_\']/gi; //특수문자 정규식 변수 선언
			if(re.test(pw))
			{
				$("#checkminpw").html("");
			}
			else
			{
				$("#checkminpw").html("~!@\#$%<>^&*\()\-=+_\ 와 같은 특수문자를 입력해 주세요");
			}
			
			
		}
		
	})	
		
	$("#checkpw").blur(function() {
		var pw = $("#pw").val();
		var checkpw = $("#checkpw").val();
		if(checkpw.length < 4 && checkpw != "")
		{
		
			$("#resultpw").html("4자 이상으로 입력해 주세요");
			
		}
		else
		{
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
						<label>ID</label> <input type="text" id="enterid" name="id" maxlength="10"
							placeholder="아이디를 입력해주세요">
					</div>

					<div id="check" class="print" style="color:red">4자리 이상 10자리 미만 영문으로만 입력하세요</div>
					<div>
						<label>password</label> <input type="password" name="password"
							id="pw" placeholder="비밀번호를 입력해주세요">
					</div>
					<div id="checkminpw" class="print" style="color:red">비밀번호는 4자리 이상으로 입력하세요</div>
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
