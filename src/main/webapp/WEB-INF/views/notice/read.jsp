<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<div class="container">

	<div class="writer">
		<div class="pull-right">
		<c:if test="${vo.getId() eq notice.userid }">
			<a
				href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
				class="btn btn-warning"> <i class="icon-list"></i> 수정
		
			</a> <a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
				class="btn btn-danger" data-confirm="삭제하시겠습니까?"> <i
				class="icon-remove"></i> 삭제
			</a> 
			</c:if>
			
			<a href="/notice/list?${ pagination.queryString }"
				class="btn btn-primary"> <i class="icon-list"></i> 목록으로
			</a>
		</div>

		<h1>공지사항</h1>
		<hr />

		<div class="article-header">
			<span class="lbl">제목:</span> <span class="title">${ notice.title }</span>
			<hr />
			<span class="lbl">글번호:</span> <span class="txt">${ notice.idx}</span>
			<span class="lbl">작성자:</span> <span class="txt">${ notice.userid}</span>
			<span class="lbl">조회수:</span> <span class="txt">${ notice.counts }</span>
			<span class="lbl">작성일</span> <span class="txt"><fmt:formatDate
					pattern="yyyy-MM-dd HH:mm" value="${  notice.crea_dtm }" /></span>
			<hr />
		</div>
		<div class="body">${ notice.contents }</div>

	</div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
