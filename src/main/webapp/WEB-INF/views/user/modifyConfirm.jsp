
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>



<div id="main" class="wrapper style1">

	<div class="container">
		<div class="modify_css">

			<form role="form" method="post">

				<div class="modify_top"></div>
				<div class="join_logo">
					<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN &nbsp;
					회원정보수정 확인

				
			


					<div class="modify_input">
						<div class="modify_frist">
							<div class="modif_span">id</div>
							<input type="text" value="${vo.getId()}" readonly="readonly">
						</div>


						<div class="modif_span">password</div>
						<input type="password" name="password" id="pw" placeholder="Enter Pw">
					</div>

					<div class="buttoncss">
						<button type="submit" class="button special small ">Submit</button>
						<a class="button small " href="/">Cancel</a>
					</div>
			</div>
		</form>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
