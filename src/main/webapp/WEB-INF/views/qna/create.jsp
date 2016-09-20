<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<div class="container">
	<div class="writer">
		<h1>Q&A 작성</h1>
		<hr />

		<form action="/qna/create" method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text"
					name="title" class="form-control" placeholder="Enter Title"
					required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="contents" rows="10"
					placeholder="Enter Contents...." required></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label> <input type="text"
					name="userid" class="form-control" value="${user.getId()}"
					readonly="readonly">
			</div>

			<div>
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i> 저장하기
				</button>
				<a href="/qna/list.do?${ pagination.queryString }" class="btn">
					<i class="icon-ban-circle"></i> 취소
				</a>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
