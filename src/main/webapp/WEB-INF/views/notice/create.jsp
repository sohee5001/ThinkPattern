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
	<form action="/notice/create" method="post">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name="title" class="form-control" placeholder="Enter Title" required>
		</div>
		<div class="form-group">
         	<label for ="exampleInputPassword1">Content</label>
         	<textarea class="form-control" name="contents" rows="10" placeholder="Enter Contents...." required></textarea>
      	</div>
      	<div class="form-group">
         	<label for ="exampleInputEmail1">Writer</label>
         	<input type="text" name="userid" class="form-control"  value="${user.getId()}" readonly ="readonly">
      	</div>
      	
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