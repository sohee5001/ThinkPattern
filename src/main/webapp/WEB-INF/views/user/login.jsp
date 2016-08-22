
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

</head>
<body>
	<div id="main" class="wrapper style1">
		<div class="container">
			<div class="login_css">

				<form role="form" method="post">
					<div>
						<div>
							<h1 class="logo">

								<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN
								&nbsp; 로그인
							</h1>
						</div>
						<div>
							<input type="text" id="enterid" name="id"
								placeholder="아이디를 입력해주세요">
						</div>
						<div>
							<input type="password" name="password" id="pw"
								placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="login_buttoncss">
							<a type="submit" class="button special fit small ">login</a>
						</div>
						<hr>
						<ul class="login_user">
							<li><a href="#">아이디 찾기</a></li> /
							<li><a href="#">비밀번호 찾기</a></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
