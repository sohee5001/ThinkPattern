<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<title>공지사항</title>


<!-- <link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
</script> -->


<style type="text/css">
tbody tr:hover {
	background-color: #ffa;
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
</head>
<body>
	<a href="/notice/list">NOTICE BOARD</a>
	<a href="/qna/list">QNA BOARD</a>
	
	<div class="container">
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
				<button type="submit" class="btn btn-small">검색</button>
				
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
			<div class="pagination pagination-small pagination-centered">
				<ul>
					<c:forEach var="page" items="${ pagination.pageList }">
						<li class='${ page.cssClass }'><a
							data-page="${ page.number }">${ page.label }</a></li>
					</c:forEach>
				</ul>
			</div>
		</form:form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>