<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전주대 Glocal Master 양성 사업 만족도 조사</title>
<script src="resources/js/jquery.js"></script>
<style>
	.container {margin-right: auto;margin-left: auto;padding-bottom: 300px;width:45%;height:auto;}
	.question {font-weight:bold;}
	@media ( max-width: 480px ) {
		.container {
		 width:auto;
		}
		.question {
		font-weight:bold;
		float:none;
		width:auto;
		}
	}
	th{background-color:#ddd;width:50px;border-bottom : 1px solid #ddd;}
	td{text-align:center; border:1px solid #ddd;}
	.radioTd{text-align:center;border-right:1px solid #ddd;}
	.cate{font-weight:bold;font-size:16px;color:#030066;}
</style>

<script>
	function sendMmsRe(){
		if(confirm('참여문자를 재발송 하시겠습니까?')){
			$.ajax({
				url : 'sendMmsRe',
				dataType:'json',
				type:'post',
				success:function(data){
					var html = '';
					$.each(data, function(i, result){
						html += '<h4>'+result[i]+'</h4>';
					});
					$('#sendResult').html(html);
					$('#reSendBtn').css('display','none');
					$('#sendResult').slideDown();
					
				}
			})
		}
	}

</script>
</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">GLOCAL MASTER 응답현황표</h2>
	<br/>
	<c:forEach var="list" items="${sendList }" varStatus="i">
		<h4 style="color:blue;">${i.index + 1 } 차 문자발송 : ${list }</h4>
	</c:forEach>
	
	<table style="width:100%;">
		<tr>
			<th rowspan="2">표본수</th>
			<th colspan="3">응답자</th>
			<th colspan="3">미응답자</th>
		</tr>
		<tr>
			<th>전체응답</th>
			<th>부분응답</th>
			<th>합계</th>
			<th>무응답</th>
			<th>전송실패</th>	
			<th>합계</th>		
		</tr>
		<tr>
			<td>${total }</td>
			<td>${resAll }</td>
			<td>${resTotal - resAll }</td>
			<td>${resTotal }</td>
			<td>${total - resTotal - mmsFail }</td>
			<td>${mmsFail }</td>
			<td>${total - resTotal }</td>
		</tr>
	</table>
	<br/>
	<div id="reSendBtn">
		<h4 style="font-size:14px;">* 미응답자, 문자전송 실패자 동시에 발송합니다.</h4>
		<button type="button" onclick="sendMmsRe();" style="width:100%;">미응답자 문자 재발송</button>
	</div>
	<div id="sendResult" style="display:none;">
	
	</div>
</div>
</body>
</html>