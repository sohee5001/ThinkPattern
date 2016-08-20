<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

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
	<form:form method="post" modelAttribute="qnaBoard">
		<div>
			<span>제목:</span>
			<form:input path="title" />
		</div>
		<form:textarea path="contents" class="smarteditor2" />

		<div>
			<button type="submit" class="btn btn-primary">
				<i class="icon-ok icon-white"></i> 저장하기
			</button>
			<a href="/qna/read?idx=${qnaBoard.idx }&${ pagination.queryString }"
				class="btn"> <i class="icon-ban-circle"></i> 취소
			</a>
		</div>
	</form:form>

</div>
</body>
</html>