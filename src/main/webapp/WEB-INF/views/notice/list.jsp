<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<style>
tbody tr:hover {
	background-color: #428bca;
	cursor: pointer;
}
</style>

<script>
	$(function() {
		$("tbody tr").click(function() {
			location.href = $(this).attr("data-url");
		});
		$("div.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			$("form").submit();
		});
	});
	
</script>



<div class="container">

	<div class="notice_css">
		<a href="/notice/list">NOTICE BOARD</a> <a href="/qna/list">Q&A
			BOARD</a>

		<h1>공지사항 목록</h1>
		<hr />
		<form:form method="get" modelAttribute="pagination">
			<div class="pull-right">
				<a href="/notice/create?${ pagination.queryString }"
					class="btn btn-info"> <i class="icon-pencil icon-white"></i>
					글쓰기
				</a>

			</div>
			<input type="hidden" name="pg" value="1" />
			<div class="form-inline">
				<form:select path="ss">
					<form:option value="0" label="검색조건" />
					<form:option value="1" label="제목" />
					<form:option value="2" label="내용" />
					<form:option value="3" label="아이디" />
				</form:select>
				<form:input path="st" />
				<button type="submit" class=" btn btn-primary">검색</button>

			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>idx</th>
						<th>title</th>
						<th>userid</th>
						<th>crea_dtm</th>
						<th>counts</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
						<tr data-url="/notice/read?idx=${b.idx}&${pagination.queryString}">
							<td>${ b.idx }</td>
							<td>${ b.title }</td>
							<td>${ b.userid }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${ b.crea_dtm }" /></td>
							<td>${ b.counts}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page_c">
				<ul class="pagination pagination-small pagination-centered">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach var="page" items="${ pagination.pageList }">
						<li class='${ page.cssClass }'><a
							data-page="${ page.number }">${ page.label }</a></li>
					</c:forEach>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</form:form>
	</div>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

