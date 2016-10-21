<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<div class="container">

	<div class="writer">
		<div class="pull-right">
		
		
			<c:if test="${vo.getId()  eq '★★★★'}">
				<a
					href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
					class="btn btn-warning  "> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> 수정

				</a>
				<a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
					class="btn btn-warning   " data-confirm="삭제하시겠습니까?"> <i
					class="fa fa-trash-o" aria-hidden="true"></i> 삭제
				</a>
				</c:if>
				
				<c:if test="${vo.getId()  eq 'oxm55522'}">
				<a
					href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
					class="btn btn-warning  "> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> 수정

				</a>
				<a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
					class="btn btn-warning   " data-confirm="삭제하시겠습니까?"> <i
					class="fa fa-trash-o" aria-hidden="true"></i> 삭제
				</a>
				</c:if>
				
				
				<c:if test="${vo.getId()  eq 'PPAP'}">
				<a
					href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
					class="btn btn-warning  "> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> 수정

				</a>
				<a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
					class="btn btn-warning   " data-confirm="삭제하시겠습니까?"> <i
					class="fa fa-trash-o" aria-hidden="true"></i> 삭제
				</a>
				</c:if>
				<c:if test="${vo.getId()  eq 'V3'}">
				<a
					href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
					class="btn btn-warning  "> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> 수정

				</a>
				<a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
					class="btn btn-warning   " data-confirm="삭제하시겠습니까?"> <i
					class="fa fa-trash-o" aria-hidden="true"></i> 삭제
				</a>
				</c:if>
				<c:if test="${vo.getId()  eq 'babinski'}">
				<a
					href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
					class="btn btn-warning  "> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> 수정

				</a>
				<a href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
					class="btn btn-warning   " data-confirm="삭제하시겠습니까?"> <i
					class="fa fa-trash-o" aria-hidden="true"></i> 삭제
				</a>
				</c:if>
						
		
		
			
			<a href="/notice/list?${ pagination.queryString }"
				class="btn btn-warning  "> <i aria-hidden="true"></i> 목록으로


			</a>
		</div>

		<div class="N_name">NOTICE</div>


		<span class="title"> ${ notice.title }</span>

		<div class="article-header">

			<div class="l_writer">
				<%-- 		<span class="lbl">글번호:</span> <span class="txt">${ notice.idx}</span> --%>
				<span class="lbl">작 성 자</span> <span class="txt">${ notice.userid}</span>
			</div>
			<div class="l_count">
				<span class="lbl">조 회</span> <span class="txt">${ notice.counts }</span>
			</div>
			<div class="l_day">
				<span class="lbl">작 성 일</span> <span class="txt"><fmt:formatDate
						pattern="yyyy-MM-dd" value="${  notice.crea_dtm }" /></span>
			</div>


		</div>
		<div class="body_list">${ notice.contents }</div>

	</div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
