<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.fa-plus-circle{
	cursor:pointer;
}
.fa-minus-circle{
	cursor:pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#move_node').on('shown.bs.modal', function() {
		$('#roomname').focus();
		var pattern_name = $('h1[name=p_name]').text();
		$('input[name=pattern_name]').val(pattern_name);
		
	});
	
	var modalbox = $('form[name=NodeForm]').html();
	var index = 0;
	
	$(document).on('click','.fa-plus-circle', function(event){ //동적으로 생성된 태그에는 .on() 형식으로 이벤트를 달아야함
		event.preventDefault();
		$('.user_list').append("<div class='user'><input class='form-control user' type='email' name='user_email' placeholder='이메일을 입력해주세요' required /><i class='fa fa-minus-circle fa-2x' aria-hidden='true'></i><br /></div>");
		/* $('.user_list').append("<div class='user'><input class='form-control user' type='email' name='user_email' placeholder='이메일을 입력해주세요' required /><i class='fa fa-minus-circle fa-2x' aria-hidden='true'></i><button type='button' class='btn btn-default sendmail'><span class='glyphicon glyphicon-envelope' aria-hidden='true'></span>전송</button><br /></div>"); */
	});
	
 	$(document).on('click','.fa-minus-circle', function(event){ 
		event.preventDefault();
		$(this).parent().remove();
	});

 	$(document).on('click', '.sendmail', function(event){
 		event.preventDefault();
 		
 	var array = [];
/*  	for(int i=0; ){
 		array[i] = arraylist
 	} */
 	var email = $(this).parent().children('input').val();	//클릭한 버튼의 부모(div)의 자식(input)의 value값(email)을 변수에 저장
 		
 	array.push(email);
 		
 		
 		
 		alert(email);
 		var uservo = $('#userid').val();
 		alert(uservo);
 		$.ajax({
			url:"http://localhost:8081/user/sendmail",
			type: "POST",
			data:{"usermail" : email , "vo" : uservo },
			success:function(data){
			},
			error:function(request, status, error){
				alert(error);
			}
		});
 		
 	});
 	
 	$('#move_node').on('hidden.bs.modal', function () {//모달창이 close되었을때 발생하는 이벤트
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
					<label>방이름</label>
					<input id="room" class="form-control" type="text" name="room" placeholder="방이름을 입력해주세요" required /> <br />
					<input type="hidden" class="form-control" name="pattern_name" value="" />
					<label>참여자</label>
					<input type="hidden" id="userid" value="${user.getId() }"/>
					<div class="user_list">
					<div class="user">
						<!-- <input class="form-control" type="email" name="user_email" placeholder="이메일을 입력해주세요" required /> --> <i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i> <br />
						<!-- <button type='button' class='btn btn-default sendmail'> <span class='glyphicon glyphicon-envelope' aria-hidden='true'></span>전송</button>--><br />
					</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="button special fit small">방생성</button>
				</div>
			</form>
		</div>
	</div>
</div>




<!-- <i class="fa fa-plus-circle" aria-hidden="true"></i> -->