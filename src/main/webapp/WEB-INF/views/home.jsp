<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<body>
	<h1>${pageContext.request.contextPath}</h1>

	<div id="main" class="wrapper style1">

		<div class="container">
			<div class="home_css">

			</div>
		</div>

	</div>
</body>
<script>
		var result= '${result}';
		var inviteurl = '${inviteurl}';
		if(result == 'joinFail')
		{
			alert("회원가입에 실패하셨습니다 다시 하세요");	
		}
		/* if(result == 'loginFail')
		{
			alert("아이디가 다르거나 비밀번호를 잘못 입력하셨습니다 다시 시도하세요");	
		} */
		if(result == 'needLogin'){
			alert("로그인을 해주세요");
			$(document).ready(function(){
				$('.loginGet').trigger('click');//로그인 버튼 클릭이벤트 강제로 발생
			});
			
		}
		if(result == 'inviteLogin'){
			alert("로그인을 해주세요");
			$(document).ready(function(){
				$('.loginGet').trigger('click');
			});
		}
		if(result == 'move_node'){
			alert("초대받은 방으로 이동합니다.");
			window.location = "http://localhost:8210/temp?"+inviteurl+"&id=${vo.getName()}";
		}
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>