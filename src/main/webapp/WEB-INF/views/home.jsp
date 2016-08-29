<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Elements - Landed by HTML5 UP</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
</head>
<body>

	<div id="main" class="wrapper style1">

		<div class="container"></div>

	</div>
	
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
	
	

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>