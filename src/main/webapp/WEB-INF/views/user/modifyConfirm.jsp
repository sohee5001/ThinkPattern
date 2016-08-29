
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>


<div class="container body">
	<div id="page-wrapper">
		<form role="form" method="post">
			<div>
				<br /> <br /> <br /> <br /> <br />
				<div>
					id <input type="text" value="${id}" readonly="readonly">
				</div>
				<br />
				<div>
					password <input type="password" name="password" id="pw"
						placeholder="Enter Pw">
				</div>

				<div class="buttoncss">
					<button type="submit" class="button special small ">
						Submit</button> <a class="button small " href="/">Cancel</a>
				</div>

			</div>
		</form>

	</div>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
