<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		$('#login').on('shown.bs.modal', function() {
		      $('#myInput').focus();
		      $('input[name=invite]').val(inviteurl);
		   });
		
		$('#login').on('hidden.bs.modal', function () {
			inviteurl="";
			$('input[name=invite]').val("");
		});
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
            <h3 class="modal-title" id="myModalLabel">


               <i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN &nbsp;
               로그인

            </h3>
         </div>

         <form action="/user/loginPost" method="post" name="loginForm">
            <div class="modal-body">
            <input type="hidden" name="invite" value=""/>
               <label>ID</label> <input id="myInput" class="form-control"
                  type="text" name="uid" placeholder="아이디 입력해주세요" required /> <br />
               <label>Password</label> <input class="form-control" type="password"
                  name="upw" placeholder="비밀번호 입력해주세요" required /> <br />
               <div class="checkbox">
                  <label> <input type="checkbox"> Remember me
                  </label>
               </div>
            </div>
            <div class="modal-footer">
               <button type="submit" class="button special fit small">Login</button>
               <div>
                  <button id="login_lost_btn" type="button" class="btn btn-link">Lost
                     Password?</button>
                  <button id="login_register_btn" type="button" class="btn btn-link">Register</button>
               </div>

            </div>
         </form>
      </div>
   </div>
</div>





<!-- Header -->
<div id="page-wrapper">
   <header id="header">

      <h1 id="logo">
         <a href="../"><i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN</a>
      </h1>
      <nav id="nav">
         <ul>
            <li><a href="../">MANUAL</a></li>
            <li><a href="/pattern/list">DESIGN PATTERN</a></li>
            <li><a href="/notice/list">SERVICE CENTER</a></li>
         </ul>

      </nav>
      <sign id="sign">
      <ul>
         <c:if test="${vo.getId() eq null }">

            <li><a class="button small loginGet" data-toggle="modal"
               data-target="#login"> <i class="fa fa-sign-in"
                  aria-hidden="true"></i> sign in

            </a> <a href="/user/join" class="button small"><i class="fa fa-user"
                  aria-hidden="true"></i> join</a></li>
         </c:if>

         <c:if test="${vo.getId() ne null}">

            <li>${vo.getName() }님환영합니다.<a href="/user/modifyConfirm"
               class="button small"><i class="fa fa-user" aria-hidden="true"></i>
                  modify</a> <a href="/user/logout" class="button small"><i
                  class="fa fa-sign-out" aria-hidden="true"></i> logout</a>

            </li>
         </c:if>
      </ul>

      </sign>




   </header>
</div>