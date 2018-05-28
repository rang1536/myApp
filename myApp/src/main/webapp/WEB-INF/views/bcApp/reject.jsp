<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HuNet- 수신거부</title>
	<link rel="stylesheet" href="resources/js/jquery.mobile-1.4.5.css">
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery.mobile-1.4.5.js"></script>

    <link href="resources/js/jquery.modal.css" type="text/css" rel="stylesheet" />
    <script src="resources/js/jquery.modal.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js" type="text/javascript" ></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<style>
		.loader{width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			position: fixed;
			display: block;
			opacity: 0.8;
			background: white;
			z-index: 99;
			text-align: center;
		}
		.loader img{
			position: absolute;
			top: 50%;
			left: 42%;
			z-index: 100;
		}
	</style>
	<script>
		function rejectCheck(){
			var rejHp = $('#rejHp').val();
			
			if(rejHp == null || rejHp == ''){
				alert('번호를 입력하셔야 수신거부 처리가 됩니다');
				return;
			}	
			
			$('.loader').css('display','');
			
			$.ajax({
				url : 'huNetRejCheck',
				data : {'rejHp':rejHp},
				dataType : 'json',
				type : 'post',
				success : function(data){
					$('.loader').css('display','none');
					
					if(data.result == 'succ'){
						$('#mainDiv').css('display','none');
						$('#rejSuccDiv').slideDown();
					}
				}
			})
		}
		
		
	</script>
    
</head>
<body>
<div class="loader" style="display:none;">
	<img src="resources/img/2.gif" alt="loading">
</div>

<section id="page1" data-role="page">
	<header data-role="header" data-tap-toggle="false" data-position="fixed">
		<img src="resources/img/alio_logo.PNG" style="width:100%;"/>
		<div data-role="navbar">
			<ul>
				<li><a href="#" class="ui-btn-active ui-state-persist" data-transition="none"><font style="font-size:16px;">수신거부</font></a></li>							
			</ul>
		</div><!-- /navbar -->
	</header>
	
	<div class="content" data-role="content" style="margin-top:-15px;font-size:15px;">
 		<div id="mainDiv" style="width:100%;">
	 		<br/>
	 		
	 		<p style="width:100%;background-color:#791212;color:#D5D5D5;">
	 			◆ 아래에 핸드폰 번호를 입력해주시면 앞으로 관련 문자 발송을 하지 않도록 하겠습니다. <br/><br/>
	 			◆ 입력한 번호는 개인정보보호법에 따라 어떠한 목적으로도 사용하지 않습니다. <br/><br/>
	 			◆ 불편을 드려 죄송합니다
	 		</p>
	 		<br/><br/>
	 		<input type="number" name="rejHp" id="rejHp" placeholder="수신거부 할 핸드폰 번호 입력"/>
	 		<br/>
	 		<button type="button" onclick="rejectCheck();" class="btn btn-default btn-block" style="color:#030066;font-size:18px;font-weight:bold;">수신거부&nbsp;&nbsp; <span class="glyphicon glyphicon-remove-sign"></span></button>
 		</div>
 		
 		<div id="rejSuccDiv" style="display:none;">
 			<br/><br/><br/>
	 		<p style="width:100%;background-color:#791212;color:#D5D5D5;font-size:18px;text-align:center;">
	 			<br/>◆ 수신거부 처리가 완료되었습니다<br/><br/>		 			
	 		</p>
 		</div>
 	</div>
 	
</section>
</body>
</html>