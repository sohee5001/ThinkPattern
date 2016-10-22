<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<script>
	var result = '${result}';
	if (result == 'modifyFail') {
		alert("회원수정에 실패하셨습니다 다시 하세요");
	}

</script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#enterid").focus();
		
		
		 $("#confirm").click( function() {
        if(confirm("정말 수정 하시겠습니까?")) {
            $(this).parent().click();
        } else {
            return false;
        }
   		 });
		 
		 $("#delete").click( function() {
		        if(confirm("정말 탈퇴 하시겠습니까?")) {
		            $(this).parent().click();
		        } else {
		            return false;
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
	});
</script>



<div id="main" class="wrapper style1">

	<div class="container">
		<div class="modify_css">

			<form role="form" method="post">
				<div>
					<div class="join_logo">
						<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN
						&nbsp; 회원가입

					</div>
					<div>
						id <input type="text" id="enterid" name="id" value="${vo.getId()}"
							readonly="readonly">
					</div>

					<div id="check"></div>
					<div>
						password <input type="password" name="password" id="pw"
							placeholder="새 비밀번호를 입력해주세요">
					</div>
					<div id="checkminpw" class="print">비밀번호는
							4자리 이상으로 입력하세요</div>
					<div>
						confirmPW <input type="password" id="checkpw" name="pw2"
							placeholder="비밀번호를 다시 입력해주세요">
					</div>

					<div id="resultpw"></div>

					<div>
						name <input type="text" id = "name" name="name" value="${vo.getName()}">
					</div>
					<div id="namecheck"></div>
					<div>
						email <input type="email" id="email" name="email" value="${vo.getEmail()}">
					</div>
					<div id="emailcheck"></div>

					<div class="buttoncss">
						<button id="confirm" type="submit" class="button special small " >Submit</button>
						<a class="button small " href="/">Cancel</a> <a
						id="delete"	class="button small" href="/user/delete" >drop out</a>
					</div>
					<br /> <br />
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
