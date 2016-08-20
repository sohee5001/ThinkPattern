<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글작성</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
</head>
<body>
	<h1>QnA 작성</h1>
	<hr />
	<form method="post">
		<div>
			<span>제목:</span> <input type="text" name="title" />
		</div>
		<textarea id="body" name="contents" class="smarteditor2"></textarea>
		<div>
			<button type="submit" class="btn btn-primary">
				<i class="icon-ok icon-white"></i> 저장하기
			</button>
			<a href="/qna/list.do?${ pagination.queryString }" class="btn"> <i
				class="icon-ban-circle"></i> 취소
			</a>
		</div>
	</form>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>