<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<style>
label {
	margin-top: 20px;
}

style>input[name=title] {
	width: 700px;
	border-style: groove;
	margin: 4px;
}

textarea {
	width: 95%;
	height: 600px;
}
</style>

</head>

</head>

<div class="container">
	<h1>공지사항 수정</h1>
	<hr />
	<form:form method="post" modelAttribute="noticeBoard">
		<div>
			<span>제목:</span>
			<form:input path="title" />
		</div>
		<form:textarea path="contents" class="smarteditor2" />

		<div>
			<button type="submit" class="btn btn-primary">
				<i class="icon-ok icon-white"></i> 저장하기
			</button>
			<a href="/notice/read?idx=${noticeBoard.idx }&${ pagination.queryString }"
				class="btn"> <i class="icon-ban-circle"></i> 취소
			</a>
		</div>
	</form:form>

</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>