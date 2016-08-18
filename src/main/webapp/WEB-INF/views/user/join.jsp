<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Elements - Landed by HTML5 UP</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>









</head>


<script type="text/javascript">

$(document).ready(function(){
  	$("#enterid").focus();
	$("#enterid").blur(function() {
		var enterid = $("#enterid").val();
		$.ajax({
			url: "http://localhost:8081/user/check",
			type:"POST",
			data:{"id" :enterid},
			success:function(data)
			{
				
				if(data == 1)
				{
					$("#check").html("중복된아이디입니다.");
				}
				else
				{
					$("#check").html("사용가능한아이디입니다..");
				}
				
				
			},
			error:function(request, status, error){
				alert("ddddddddd");
			}	
			
			
			
		});
	}); 
	

  	//$("#checkpw").focus();

	$("#checkpw").blur(function() 
	{
		var pw = $("#pw").val();
		var checkpw=$("#checkpw").val();
		if(pw === checkpw)
		{
			$("#resultpw").html("맞게 입력하셨습니다.");
		}
		else
		{
			$("#resultpw").html("비밀번호가 다릅니다. 다시 입력하세요.");
		}
		
	}); 
	
	
});

		$("#checkpw").blur(function() {
			var pw = $("#pw").val();
			var checkpw = $("#checkpw").val();
			if (pw === checkpw) {
				$("#resultpw").html("맞게 입력하셨습니다.");
			} else {
				$("#resultpw").html("비밀번호가 다릅니다. 다시 입력하세요.");
			}

		});

	});
</script>



<body>

	<div class="join_css">

		<form role="form" method="post">
			<div>
				<div>
					<h1>

						<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN
						&nbsp; 회원가입
					</h1>
				</div>
				<div>
					id <input type="text" id="enterid" name="id"
						placeholder="아이디를 입력해주세요">
				</div>

				<div id="check"></div>
				<div>
					password <input type="password" name="password" id="pw"
						placeholder="비밀번호를 입력해주세요">
				</div>


				<div>
					confirmPW <input type="password" id="checkpw" name="pw2"
						placeholder="비밀번호를 다시 입력해주세요">
				</div>

				<div id="resultpw"></div>



				<div>
					name <input type="text" name="name" placeholder="이름을 입력해주세요">
				</div>

				<div>
					email <input type="text" name="email" placeholder="Email을 입력해주세요">
				</div>

				<div class="buttoncss">
					<a type="submit" class="button special small ">Submit</a> <a
						class="button small " href="listAll">Cancel</a>
				</div>


				<div>
					<!--로그인 실패 성공 뿌려주기  -->
				</div>

				
			</div>
		</form>




	</div>


</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</html>