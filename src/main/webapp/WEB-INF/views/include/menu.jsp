<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script>
	$('#login').on('shown.bs.modal', function() {
		$('#myInput').focus();
	});
</script>

<div class="modal fade" id="login" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="myModalLabel">로그인</h3>
			</div>
			<div class="modal-body">
				<form action="/user/loginPost" method="post" name="loginForm">
					<label>ID</label> <input id="myInput" class="form-control" type="text"
						name="id" placeholder="아이디 입력해주세요" required /> <br /> <label>Password</label>
					<input class="form-control" type="password" name="password"
						placeholder="비밀번호 입력해주세요" required /> <br />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Submit</button>
					<br />
				</form>
			</div>
		</div>
	</div>
</div>




<!-- Header -->
<header id="header">
	<h1 id="logo">
		<a href="../"><i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN</a>
	</h1>
	<nav id="nav">
		<ul>
			<li><a href="../">MANUAL</a></li>
			<li><a href="#">DESIGN PATTERN</a>
				<ul>

					<li><a href="#">PATTERN 1</a></li>
					<li><a href="#">PATTERN 2</a></li>
					<li><a href="#">PATTERN 3</a></li>
					<li><a href="#">PATTERN 4</a></li>

				</ul></li>
			<li><a href="servicecenter.jsp">SERVICE CENTER</a></li>
		</ul>

	</nav>
	<sign id="sign">
	<ul>

		<li><button type="button" class="button small"
				data-toggle="modal" data-target="#login">
				<i class="fa fa-sign-in" aria-hidden="true"></i> sign in
			</button>
			</a> <a href="/user/join" class="button small"><i class="fa fa-user"
				aria-hidden="true"></i> join</a></li>

	</ul>

	</sign>




</header>