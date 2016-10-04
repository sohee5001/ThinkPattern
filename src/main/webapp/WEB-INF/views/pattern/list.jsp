<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<%@ include file="/WEB-INF/views/include/move_node.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		var list_temp = $("#p_list").html();	//#p_list에 있는 디자인 패턴의 개요를 태그 통째로 변수에 저장
		var user = $("#user").val();
		
		
		
		
		
		$(".list-group-item").on("click",function(event){	//디자인 패턴 리스트를 클릭하면 함수 호출
			event.preventDefault();		// 버튼 클릭 시 발생한 이벤트를 정지시킴
			var name = $(this).attr('name');	//클릭한 버튼의 name값을 변수에 저장
			$.ajax({
				url:"http://localhost:8081/pattern/read",
				type: "POST",
				data:{"p_name" : name},
				success:function(data){
					
					$("#patterns").empty();	//#patterns의 태그는 남기고 내부 요소들을 모두 비움, 이때 모든 하위태그들이 다 지워져서 그냥 html로 넣으면 들어가지 않음
					$("#patterns").append(list_temp);	// 문서 로드 후 저장했던 list_temp(태그들이 다 들어있음)를 추가하여 아래에 html로 치환할 태그들을 생성해줌
					$("#p_name").html("<h1 name='p_name'>"+data.p_name+"</h1>");
					$("#p_name").append("<input type='hidden' name='p_name' value='"+data.p_name+"' />");
					$("#p_contents").html("<hr /><h2>개요</h2><br /><p>"+data.p_contents+"</p><br/>");
					$("#p_contents").append("<img src=../../resources/res/images/patterns/"+decodeURIComponent(data.p_name)+".png"+" alt=패턴>");
					$("#p_strong").html("<hr /><h1>장점</h1><p>"+data.p_strong+"</p>");
					$("#p_weak").html("<hr /><h1>단점</h1><p>"+data.p_weak+"</p>");
					$("#move").html("<hr /><a class='button small' data-toggle='modal' data-target='#move_node'><i class='fa fa-caret-square-o-right' aria-hidden='true'></i> Create Project </a>");
					/* $("#move").html("<hr /><button type='button' class='btn btn-primary'><a href='http://localhost:8210/?id="+user+"&"+data.p_name+"'>이동</a></button>") */
				},
				error:function(request, status, error){
					alert(error);
				}
			});
			
		});
		
		$("#p_title").on("click", function(event){
			event.preventDefault();
			var name = $(this).attr('name');
			$.ajax({
				url:"http://localhost:8080/pattern/read",
				type: "POST",
				data:{"p_name" : name},
				success:function(data){
					$("#patterns").empty();
					$("#p_list").empty();
					$("#patterns").append(list_temp);
				},
				error:function(request, status, error){
					alert(error);
				}
			});
		});
	});
	
</script>

	<div class="pattern_list">
		<input type="hidden" id="user" value="${vo.getName()}"/>
		<div class="col-md-2">
		<h1 id="p_title" name="default">Design Patterns</h1>
		<div class="list-group">
		<c:forEach items="${list}" var="patternVO">
			<c:set var="pname" value="${patternVO.p_name }"/>
			<c:if test="${pname != 'default' }">
			<button type="button" class="list-group-item" name="${patternVO.p_name}">${patternVO.p_name}</button>
			</c:if>
		</c:forEach>
		</div>		
		</div>
		<div class="col-md-10">
			<div id="patterns">
				<c:forEach items="${list}" var="patternVO">
					<c:set var="pname" value="${patternVO.p_name }"/>
					
					<c:if test="${pname eq 'default' }">
						<div id="p_list">
							<div id="p_name" ><h1 name='p_name'>디자인 패턴이란?</h1><hr /></div>
							<div id="p_contents"><h2>개요</h2><br /><p>${patternVO.p_contents}</p><img src=../../resources/res/images/patterns/${patternVO.p_name}.png alt=패턴 style="width:70%;height:70%;"></div>
							<div id="p_strong"></div>
							<div id="p_weak"></div>
							<div id="move"></div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
