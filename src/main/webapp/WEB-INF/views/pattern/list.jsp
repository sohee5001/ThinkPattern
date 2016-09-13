<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<style type="text/css">
tbody tr:hover {
	background-color: #ffa;
	cursor: pointer;
}
</style>

<div class="container">

	<div class="pattern_list">
		
		
		<ul>DesignPatterns</ul>
		<hr />
		<c:forEach items="${list}" var="patternVO">
			<li>${patternVO.name}</li>
		</c:forEach>
		
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
