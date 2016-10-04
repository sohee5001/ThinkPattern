<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		//$("#enterid").focus();

		$("#checkpw").blur(function() {
			var pw = $("#pw").val();
			var checkpw = $("#checkpw").val();
			if (pw === checkpw) {
				if (pw == "") {
					$("#resultpw").html("");
				} else {
					$("#resultpw").html("맞게 입력하셨습니다.");
				}
			} else {
				$("#resultpw").html("비밀번호가 다릅니다. 다시 입력하세요.");
			}

		});
	});
</script>

<div id="main" class="wrapper style1">

	<div class="container">
		<div class="modify_css">

			<form role="form" method="post">
				<div>
					<div class="join_logo">
						<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN
						&nbsp; 회원가입

					</div>
					<div>
						id <input type="text" id="enterid" name="id" value="${vo.getId()}"
							readonly="readonly">
					</div>

					<div id="check"></div>
					<div>
						password <input type="password" name="password" id="pw"
							placeholder="새 비밀번호를 입력해주세요">
					</div>

					<div>
						confirmPW <input type="password" id="checkpw" name="pw2"
							placeholder="비밀번호를 다시 입력해주세요">
					</div>

					<div id="resultpw"></div>

					<div>
						name <input type="text" name="name" value="${vo.getName()}">
					</div>

					<div>
						email <input type="text" name="email" value="${vo.getEmail()}">
					</div>


					<div class="buttoncss">
						<button type="submit" class="button special small ">Submit</button>
						<a class="button small " href="/">Cancel</a> <a
							class="button small" href="/user/delete">drop out</a>
					</div>
					<br /> <br />
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
