<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<title>Insert title here</title>

</head>

</head>






<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="idx" value="${board.idx}" >


	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> <input type="text"
				name="title" class="form-control" value="${board.title}">
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">Contents</label>
			<textarea class="form-control" name="contents" rows="3">${board.contents}</textarea>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> <input type="text"
				name="userid" class="form-control" value="${board.userid}"
				readonly="readonly">
		</div>
			
	</div>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary"><i class="icon-ok icon-white"></i>수정완료</button>
		&nbsp;
		<a class="btn btn-danger" href="javascript:history.back()"><i class="icon-ban-circle"></i>취소</a>
	</div>
</form>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>