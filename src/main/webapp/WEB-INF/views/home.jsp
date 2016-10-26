<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="http://beneposto.pl/jqueryrotate/js/jQueryRotateCompressed.js"></script>
<script type="text/javascript">
	var c_arr = [ "resources/res/images/Rcircle.png",
			"resources/res/images/Lcircle.png" ];
	// 원Array번호 

	var m_arr = [ "resources/res/images/real.png",
			"resources/res/images/chat.png", "resources/res/images/web.png",
			"resources/res/images/desin.png" ];
	// 이름Array번호

	var i_arr = [ "resources/res/images/share_ic.png",
			"resources/res/images/chat_ic.png",
			"resources/res/images/web_ic.png", "resources/res/images/ds_ic.png" ];
	// 아이콘Array번호
	var cidx = 0, midx = 0;
	// 원이 머무는 시간 
	var interval = 3000;
	// 다른것들이 머무는 시간 
	var minterval = 3000;

	// 원이미지전환시간 
	var c_interval = 1000;
	// 다른이미지전환시간 
	var m_interval = 1000;

	$(function() {
		var g1 = $('.gear1'), g2 = $('.gear2'), d = $('.Dname');
		var angle = 0;
		// M_circle 에 이미지 태그를 넣어준다 
		for ( var i in c_arr) {
			$("#M_circle").append(
					"<img class=\"Ccircle\" src=\""+c_arr[i]+"\">");

		}
		// M_name 에 이미지 태그를 넣어준다 
		for ( var i in m_arr) {

			$("#M_name").append("<img class=\"Cname\" src=\""+m_arr[i]+"\">");

		}
		// M_icon 에 이미지 태그를 넣어준다 
		for ( var i in i_arr) {
			$("#M_icon").append("<img class=\"Cicon\" src=\""+i_arr[i]+"\">");
		}
		// idx 가 일치할경우 보여주고 나머지는 감춘다. 
		$('.Ccircle').each(function(index) {
			if (cidx == index) {
				$(this).show();

			} else {
				$(this).hide();
			}
		});
		// idx 가 일치할경우 보여주고 나머지는 감춘다. 
		$('.Cname').each(function(index) {
			if (midx == index) {
				$(this).show();

			} else {
				$(this).hide();
			}
		});
		// idx 가 일치할경우 보여주고 나머지는 감춘다. 
		$('.Cicon').each(function(index) {
			if (midx == index) {
				$(this).show();

			} else {
				$(this).hide();
			}
		});

		// 무한 반복 
		setInterval("Cloc()", interval);
		setInterval("Mloc()", minterval);
		setInterval("move()", 100);
	/* 	setInterval(function() {
			angle += 3;
			g1.rotate(angle);
			g2.rotate(angle);
		}, 100); */
	});
	// 반복함수구성 
	function Cloc() {
		// idx번호를 올린다 
		cidx++;
		// idx번호가 넘칠경우 0번으로 초기화 
		if (cidx >= c_arr.length) {
			cidx = 0;
		}
		// idx가 일치할경우 fadeIn 불일치하면 fadeOut 
		$(".Ccircle").each(function(index) {
			if (cidx == index) {
				$(this).fadeIn(c_interval);
			} else {
				$(this).fadeOut(c_interval);
			}
		});
	}
	// 반복함수구성 
	function Mloc() {
		// idx번호를 올린다 
		midx++;
		// idx번호가 넘칠경우 0번으로 초기화 
		if (midx >= m_arr.length) {
			midx = 0;
		}
		// idx가 일치할경우 fadeIn 불일치하면 fadeOut 
		$(".Cname").each(function(index) {
	
				if (midx == index) {
					$(this).fadeIn(m_interval);
				} else {
					$(this).fadeOut(m_interval);
				}


		});
		// idx가 일치할경우 fadeIn 불일치하면 fadeOut 
		$(".Cicon").each(function(index) {
			if (midx == index) {
				$(this).fadeIn(m_interval);
			} else {
				$(this).fadeOut(m_interval);
			}
		});
	}
	function move() {
		
		var d = $(".Dname"), i = $('.icon');

		
		d.animate("slow"), d.animate("slow"),
		d.animate("slow"), d.animate("slow"), 
		d.animate({left:1400,opacity : '0.4'}, "slow"),
		i.animate("slow"), i.animate("slow"), i.animate("slow"),
		i.animate("slow"), i.animate({left : 300,opacity : '0.4'}, "slow"),
		d.animate("slow"), i.animate("slow"), 

		i.animate({left : 0,opacity : '0.8'}, "slow", function() {move();});
	}
</script>

<body class="background_color_h">
	<%-- 	<h1>${pageContext.request.contextPath}</h1> --%>

	<div class="container">
		<div class="home_css">

			<div class="wir">
				<div style="z-index:0;" class="pic"></div>

				<div style="z-index: 6;" id="M_name" class="Dname"></div>
				<div style="z-index: 1;" id="M_circle" class="circle"></div>

				<img src="resources/res/images/logo.png" width="200" height="200"
					style="z-index: 4;" class="logo"> <img
					src="resources/res/images/Gear1.png" width="150" height="150"
					style="z-index: 3;" class="gear1"> <img
					src="resources/res/images/Gear2.png" width="80" height="80"
					style="z-index: 5;" class="gear2">
				<div style="z-index: 2;" id="M_icon" class="icon"></div>

			</div>



		</div>

	</div>
</body>

<script>
	var result = '${result}';
	var inviteurl = '${inviteurl}';
	var node_user = '${node_user}';//인코딩하려고 만듬

	if (result == 'joinFail') {
		alert("회원가입에 실패하셨습니다 다시 하세요");
	}
	/* if(result == 'loginFail')
	{
		alert("아이디가 다르거나 비밀번호를 잘못 입력하셨습니다 다시 시도하세요");	
	} */
	if (result == 'needLogin') {
		alert("로그인을 해주세요");
		$(document).ready(function() {
			$('.loginGet').trigger('click');//로그인 버튼 클릭이벤트 강제로 발생
		});

	}
	if (result == 'inviteLogin') {
		alert("로그인을 해주세요");
		$(document).ready(function() {
			$('.loginGet').trigger('click');
		});
	}
	if (result == 'move_node') {
		alert("초대받은 방으로 이동합니다.");
		alert(inviteurl);
		window.location.href = "http://localhost:8210/temp?"
				+ encodeURI(inviteurl) + "&id=" + encodeURI(node_user);
	}
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>