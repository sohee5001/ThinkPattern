<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
</head>
<body>
	<h1>공지사항 작성</h1>
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
			<a href="list.do?${ pagination.queryString }" class="btn"> <i
				class="icon-ban-circle"></i> 취소
			</a>
		</div>
	</form>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>