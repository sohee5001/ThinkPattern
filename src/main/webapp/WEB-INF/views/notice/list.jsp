<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<style>
@import url(http://fonts.googleapis.com/css?family=Merriweather.css);
tbody tr:hover {
	background-color: black;
	cursor: pointer;
	color:white;
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

	<div class="select_what">
		<li class="select_li"></li>
		<li class="select_li select_li_a"><a href="/notice/list"><i class="fa fa-bullhorn" aria-hidden="true"></i> NOTICE </a></li>
		<li class="select_li select_li_b"><a href="/qna/list"><i class="fa fa-question-circle" aria-hidden="true"></i> Q&A </a></li>
		<li class="select_li"></li>

	</div>
	<div class="notice_css">


		<div class="N_name">NOTICE</div>
		<hr />
		<form:form method="get" modelAttribute="pagination">
			<div class="pull-right">
				<a href="/notice/create?${ pagination.queryString }"
					class="btn btn-warning"> <i class="icon-pencil icon-white"></i>
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
			<table class="table table-bordered list_c">
			<colgroup  >
               <col width="13%">
               <col width="40%">
               <col width="17%">
               <col width="17%">
               <col width="13%" />
            </colgroup>
				<thead >
						<th class="datacol">No.</th>
						<th class="datacol">제     목</th>
						<th  class="datacol">작 성 자</th>
						<th  class="datacol">작 성 일</th>
						<th  class="datacol">조 회 수</th>

			
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
						<tr data-url="/notice/read?idx=${b.idx}&${pagination.queryString}">
							<td>${ b.idx }</td>
							<td>${ b.title }</td>
							<td>${ b.userid }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${ b.crea_dtm }" /></td>
							<td>${ b.counts}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page_c">
				<ul class="pagination pagination-small pagination-centered ">
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

