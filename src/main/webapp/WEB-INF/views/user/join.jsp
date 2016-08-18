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



</script>



<body>
	<div class="container body">
		<div id="page-wrapper">
			
			

			<form role="form"  method="post">
				<div>
					<div>id
						<input type="text" id="enterid" name="id" placeholder="Enter Id">				
					</div>
					
					<div id="check">
					</div>
					<div>password
						<input type="password" name="password"  id= "pw" placeholder="Enter Pw">		
					</div>
					
					
					<div>confirmPW
						<input type="password" id ="checkpw" name = "pw2" placeholder="confirm Pw">		
					</div>
					
					<div id="resultpw"></div>
					
					
					
					<div>name
						<input type="text" name="name" placeholder="Enter Name">
					</div>
				
					<div>email
						<input type="text" name="email"  placeholder="Enter Email">
					</div>
					
					<div>
						<button type="submit" class="btn btn-primary">Submit</button>
							<a class="btn btn-danger" href="listAll">Cancel</a>
					</div>
				
				</div>
			</form>
			
			
			

		</div>


	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>