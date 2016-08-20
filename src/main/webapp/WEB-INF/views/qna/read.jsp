<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>read</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
</head>
<body>
<div class="container">
	<div class="pull-right">
		<a
			href="/qna/modify?idx=${qna.idx}&${ pagination.queryString }"
			class="btn"> <i class="icon-list"></i> 수정

		</a> <a
			href="/qna/delete?idx=${qna.idx}&${pagination.queryString}"
			class="btn" data-confirm="삭제하시겠습니까?"> <i class="icon-remove"></i>
			삭제
		</a> <a href="/qna/list?${ pagination.queryString }"
			class="btn"> <i class="icon-list"></i> 목록으로
		</a>
	</div>

	<h1>공지사항</h1>
	<hr />

	<div class="article-header">
		<span class="lbl">제목:</span> <span class="title">${ qna.title }</span>
		<hr />
		<span class="lbl">글번호:</span> <span class="txt">${ qna.idx}</span>
		<span class="lbl">작성자:</span> <span class="txt">${ qna.userid}</span>
		<span class="lbl">조회수:</span> <span class="txt">${ qna.counts }</span>
		<span class="lbl">작성일</span> <span class="txt">
		<fmt:formatDate
				pattern="yyyy-MM-dd HH:mm" value="${  qna.crea_dtm }" /></span>
		<hr />
	</div>
	<div class="body">${ qna.contents }</div>
	
	
	<p> < 댓글 > </p>
		<div>
			<table>

				<tbody>
					<c:forEach var="cl" items="${ commentslist }">
						<tr>
							<td>${ cl.userid }</td>
							<td>${ cl.contents}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${ cl.crea_dtm }" /></td>
							<td><button>수정</button></td>
							<td><a href="/comments/delete?idx=${cl.idx}&board_idx=${cl.board_idx}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form id="commentsInsert" class="form-inline"
				action="/comments/insert" method="post">
				<input type="hidden" name="board_idx" value="${ qna.idx}"> <input
					class="form-control" type="text" name="contents" placeholder="댓글입력" />
				<input class="btn" type="submit" id="onLoadComment" value="등록">
			</form>
		</div>

	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>