
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<body>

	<div id="main" class="wrapper style1">

		<div class="container">
			<div class="home_css">

			</div>
		</div>

	</div>
</body>
<script>
		var result= '${result}';
		if(result == 'joinFail')
		{
			alert("회원가입에 실패하셨습니다 다시 하세요");	
		}
		if(result == 'loginFail')
		{
			alert("아이디가 다르거나 비밀번호를 잘못 입력하셨습니다 다시 시도하세요");	
		}
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
