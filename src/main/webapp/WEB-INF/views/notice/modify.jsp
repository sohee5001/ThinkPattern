<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
.box-footer {
    margin: 50px 0px 0px 0px;
 
}
</style>

<div class="container">
	<div class="writer">
	<h1>공지사항 수정</h1>
		<form role="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${board.idx}">


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
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>수정완료
				</button>
				&nbsp; <a class="btn btn-danger" href="javascript:history.back()"><i
					class="icon-ban-circle"></i>취소</a>
			</div>

		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
