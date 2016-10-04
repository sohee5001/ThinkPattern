<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>


<div class="container">
	<div class="writer_d">
		<div class="pull-right">
			<a href="/qna/modify?idx=${qna.idx}&${ pagination.queryString }"
				class="btn btn-warning"> <i class="fa fa-pencil-square-o"
				aria-hidden="true"></i> 수정

			</a> <a href="/qna/delete?idx=${qna.idx}&${pagination.queryString}"
				class="btn btn-warning" data-confirm="삭제하시겠습니까?"> <i
				class="fa fa-trash-o" aria-hidden="true"></i> 삭제
			</a> <a href="/qna/list?${ pagination.queryString }"
				class="btn btn-warning"> <i aria-hidden="true"></i> 목록으로
			</a>
		</div>

		<div class="N_name">Q&A</div>

		<form role="form" method="post">
			<span class="title"> ${ qna.title }</span>
			<div class="article-header">
				'
				<div class="l_writer">
					<span class="lbl">작 성 자</span> <span class="txt">${ qna.userid}</span>
				</div>
				<div class="l_count">
					<span class="lbl">조 회</span> <span class="txt">${ qna.counts }</span>
				</div>
				<div class="l_day">
					<span class="lbl">작 성 일</span> <span class="txt"><fmt:formatDate
							pattern="yyyy-MM-dd" value="${  qna.crea_dtm }" /></span>
				</div>
			
			</div>
			<div class="body_list">${ qna.contents }</div>
			
		</form>
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
							<td><button class="btn btn-warning">수정</button></td>
							<td><a
								href="/comments/delete?idx=${cl.idx}&board_idx=${cl.board_idx}" class="btn btn-warning">삭제</a></td>
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
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>