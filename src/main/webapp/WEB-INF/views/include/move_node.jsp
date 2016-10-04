<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.fa-plus-circle{
	cursor:pointer;
}
.fa-minus-circle{
	cursor:pointer;
}
.user{
	margin-bottom:10px;
}
/* .ui-autocomplete-input {
  border: none; 
  font-size: 14px;
  width: 300px;
  height: 24px;
  margin-bottom: 5px;
  padding-top: 2px;
  border: 1px solid #DDD !important;
  padding-top: 0px !important;
  z-index: 1511;
  position: relative;
} */
.ui-menu .ui-menu-item a {
  font-size: 12px;
}
.ui-autocomplete {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 1051 !important;
  float: left;
  display: none;
  min-width: 160px;
  _width: 160px;
  padding: 4px 0;
  margin: 2px 0 0 0;
  list-style: none;
  background-color: #ffffff;
  border-color: #ccc;
  border-color: rgba(0, 0, 0, 0.2);
  border-style: solid;
  border-width: 1px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  -webkit-background-clip: padding-box;
  -moz-background-clip: padding;
  background-clip: padding-box;
  *border-right-width: 2px;
  *border-bottom-width: 2px;
}
.ui-menu-item > a.ui-corner-all {
    display: block;
    padding: 3px 15px;
    clear: both;
    font-weight: normal;
    line-height: 18px;
    color: #555555;
    white-space: nowrap;
    text-decoration: none;
}
.ui-state-hover, .ui-state-active {
      color: #ffffff;
      text-decoration: none;
      background-color: #0088cc;
      border-radius: 0px;
      -webkit-border-radius: 0px;
      -moz-border-radius: 0px;
      background-image: none;
}
#modalIns{
    width: 500px;
}
</style>
<script type="text/javascript">

var uList = [];
<c:forEach items="${userList}" var="item">
uList.push("${item}");
</c:forEach>

$(document).ready(function(){
	
	
	$('#move_node').on('shown.bs.modal', function() {
		$('#room').focus();
		var pattern_name = $('h1[name=p_name]').text();
		$('input[name=pattern_name]').val(pattern_name);
		
	});
	
	var modalbox = $('form[name=NodeForm]').html();
	var index = 0;
	
	$('#move_node').on('hidden.bs.modal', function () {//모달창이 close되었을때 발생하는 이벤트
 		$('form[name=NodeForm]').html("");
 		$('form[name=NodeForm]').append(modalbox);
	});
	
	$(document).on('click','.fa-plus-circle', function(event){ //동적으로 생성된 태그에는 .on() 형식으로 이벤트를 달아야함
		event.preventDefault();
	
	// 동적 생성된 태그에 자동완성 함수 추가하기 위하여 태그 생성방식을 바꿈
	var $userlist = $('.user_list');
	var $mailinput = $("<input id='tags' class='form-control users' type='email' name='user_email' placeholder='이메일을 입력해주세요' style='width:80% ; display:inline' required /><i class='fa fa-minus-circle fa-2x' aria-hidden='true' style='float:right ; margin:7px 30px 0 0'></i><br /></div>");
	var $userdiv = $("<div class='user'>");
	
	
	$mailinput.autocomplete({  
		source : uList
 	});
	
	$userdiv.append($mailinput);
	
	$userlist.append($userdiv);
	/* $('.user_list').append("<div class='user'><input id='tags' class='form-control users' type='email' name='user_email' placeholder='이메일을 입력해주세요' style='width:80% ; display:inline' required /><i class='fa fa-minus-circle fa-2x' aria-hidden='true' style='float:right ; margin:7px 30px 0 0'></i><br /></div>"); */
	/* $('.user_list').append("<div class='user'><input class='form-control user' type='email' name='user_email' placeholder='이메일을 입력해주세요' required /><i class='fa fa-minus-circle fa-2x' aria-hidden='true'></i><button type='button' class='btn btn-default sendmail'><span class='glyphicon glyphicon-envelope' aria-hidden='true'></span>전송</button><br /></div>"); */
	});
	
 	$(document).on('click','.fa-minus-circle', function(event){ 
		event.preventDefault();
		$(this).parent().remove();
	});

 	/* $(document).on('click', '.sendmail', function(event){
 		event.preventDefault();
 		
 	var array = [];
  	for(int i=0; ){
 		array[i] = arraylist
 	}
 	var email = $(this).parent().children('input').val();	//클릭한 버튼의 부모(div)의 자식(input)의 value값(email)을 변수에 저장
 		
 	array.push(email);
 		
 		
 		
 		alert(email);
 		var uservo = $('#userid').val();
 		alert(uservo);
 		$.ajax({
			url:"http://localhost:8080/user/sendmail",
			type: "POST",
			data:{"usermail" : email , "vo" : uservo },
			success:function(data){
			},
			error:function(request, status, error){
				alert(error);
			}
		});
 		
 	}); */
 	
 	$('#move_node').on('hidden.bs.modal', function () { //모달창이 close되었을때 발생하는 이벤트
 		$('form[name=NodeForm]').html("");
 		$('form[name=NodeForm]').append(modalbox);
	});
});
	
</script>

<div class="modal fade" id="move_node" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="myModalLabel2">


					<i class="fa fa-spinner" aria-hidden="true"></i>THINKPATTERN &nbsp;
					생성

				</h3>
			</div>

			<form action="/user/createroom" method="post" name="NodeForm">
				<div class="modal-body">
					<label>프로젝트 이름</label>
					<input id="room" class="form-control" type="text" name="room" placeholder="방이름을 입력해주세요" autocomplete="off" required /> <br />
					<input type="hidden" class="form-control" name="pattern_name" value="" />
					<label>참여자</label><i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="margin-left:10px; margin-top:3px;"></i> <br />
					<input type="hidden" id="userid" value="${user.getId() }"/>
					<div class="user_list">
					<!-- <div class="user">
						<input class="form-control" type="email" name="user_email" placeholder="이메일을 입력해주세요" required /> <i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i> <br />
						<button type='button' class='btn btn-default sendmail'> <span class='glyphicon glyphicon-envelope' aria-hidden='true'></span>전송</button><br />
					</div> -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="button special fit small">설계시작</button>
				</div>
			</form>
		</div>
	</div>
</div>




<!-- <i class="fa fa-plus-circle" aria-hidden="true"></i> -->