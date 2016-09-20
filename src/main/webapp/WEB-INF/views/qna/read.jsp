<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[role='form']"); //role이 form인 element를 가지고 오겠다
						$(".btn-warning")
								.on(
										"click",
										function() {
											formObj
													.attr("action",
															"/qna/modify?idx=${qna.idx}&${ pagination.queryString }");
											formObj.attr("method", "get");
											formObj.submit();
										});

						$(".btn-danger")
								.on(
										"click",
										function() {
											formObj
													.attr("action",
															"/qna/delete?idx=${qna.idx}&${pagination.queryString}");
											formObj.attr("method", "get");
											formObj.submit();
										});

						$(".btn-primary")
								.on(
										"click",
										function() {
											self.location = "/qna/list?${ pagination.queryString }";
										});
					});
</script>


<div class="container">
	<div class="writer">
		<div class="pull-right">
			<a href="/qna/modify?idx=${qna.idx}&${ pagination.queryString }"
				class="btn"> <i class="icon-list"></i> 수정

			</a> <a href="/qna/delete?idx=${qna.idx}&${pagination.queryString}"
				class="btn" data-confirm="삭제하시겠습니까?"> <i class="icon-remove"></i>
				삭제
			</a> <a href="/qna/list?${ pagination.queryString }" class="btn"> <i
				class="icon-list"></i> 목록으로
			</a>
		</div>

		<h1>QnA</h1>
		<hr />

		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="InputTitle">Title</label> <input type="text"
						name="title" class="form-control" value="${ qna.title }"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="InputContents">Content</label>
					<textarea class="form-control" name="content" rows="3"
						readonly="readonly">${ qna.contents }</textarea>
				</div>
				<div class="form-group">
					<label for="InputUserid">Writer</label> <input type="text"
						name="userid" class="form-control" value="${ qna.userid}"
						readonly="readonly">
				</div>
				<div></div>
			</div>
		</form>

		<%-- <div class="article-header">
			<span class="lbl">제목:</span> <span class="title">${ qna.title }</span>
			<hr />
			<span class="lbl">글번호:</span> <span class="txt">${ qna.idx}</span> <span
				class="lbl">작성자:</span> <span class="txt">${ qna.userid}</span> <span
				class="lbl">조회수:</span> <span class="txt">${ qna.counts }</span> <span
				class="lbl">작성일</span> <span class="txt"> <fmt:formatDate
					pattern="yyyy-MM-dd HH:mm" value="${  qna.crea_dtm }" /></span>
			<hr />
		</div>
		<div class="body">${ qna.contents }</div> --%>

		<p>[댓글]</p>
		<div class="comment">
			<table>

				<tbody>
					<c:forEach var="cl" items="${ commentslist }">
						<tr>
							<td>${ cl.userid }</td>
							<td><textarea readonly=readonly>${ cl.contents}</textarea></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${ cl.crea_dtm }" /></td>
							<td><button>수정</button></td>
							<td><a
								href="/comments/delete?idx=${cl.idx}&board_idx=${cl.board_idx}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<form id="commentsInsert" class="form-inline"
					action="/comments/insert" method="post">
					<input type="hidden" name="board_idx" value="${ qna.idx}">
					<input type="hidden" name="userid" value="${user.getId()}">
					<input class="form-control" type="text" name="contents"
						style="width: 40%;" placeholder="댓글입력" /> <input class="btn"
						type="submit" id="onLoadComment" value="등록">
				</form>
			</div>

		</div>
		<div class="box-footer">
			<button type="submit" class="btn btn-warning">Modify</button>
			<button type="submit" class="btn btn-danger">Remove</button>
			<button type="submit" class="btn btn-primary">List All</button>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>