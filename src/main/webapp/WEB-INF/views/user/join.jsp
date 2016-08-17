<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Elements - Landed by HTML5 UP</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
</head>
<body>
	<div class="container body">
		<div id="page-wrapper">

			<table id="table-style" data-height="400"
				data-row-style="rowStyle">
				<thead>
					<tr>
						<th data-field="id" class="col-md-2">Item ID</th>
						<th data-field="name" class="col-md-6"><i
							class="glyphicon glyphicon-star"></i> Item Name</th>
						<th data-field="price" class="col-md-4"><i
							class="glyphicon glyphicon-heart"></i> Item Price</th>
					</tr>
				</thead>
			</table>

		</div>


	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>