<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 200px;
}

.box-footer {
	margin: 50px 0px 0px 0px;
}
</style>
<body class="background_color_h">
<div class="container">
	<div class="writer">

		<div class="writer_a">
			<h1>공지사항 작성</h1>

			<form action="/notice/create" method="post">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name="title" class="form-control" placeholder="Enter Title"
							required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="contents" rows="10" style="height: 203;"
							placeholder="Enter Contents...." required></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="userid" class="form-control" value="${vo.getId()}"
							readonly="readonly">
					</div>
				</div>


				<div class="box-footer">
					<button type="submit" class="btn btn-warning">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> 저장하기
					</button>
					&nbsp; <a href="list.do?${ pagination.queryString }"
						class="btn btn-warning"> 취소 </a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>