<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전북 농생명산업 보수교육 수요조사서</title>
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
	th{background-color:#ddd;width:80px;border-bottom : 1px solid #ddd;}
	td{}
	.radioTd{text-align:center;border-right:1px solid #ddd;}
	.cate{font-weight:bold;font-size:16px;color:#030066;}
	input{width:99%;height:28px;border-radius:5px;}
</style>

<script>
	$(document).ready(function(){
		alert('설문에 응해주셔서 감사합니다~!!');		
	})
	
	function closeThis(){
		window.open('about:blank','_self').self.close();
	}
</script>
</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">전라북도 농생명산업 보수교육 수요조사서</h2>
	
	<table style="padding:4px;border:1px solid #000000;width:100%;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;">
					<font id="nowDate" style="background-color:#F2CB61;"></font>
					&nbsp;설문에 응해주셔서 대단히 감사하겠습니다.<br/>
				</p> <br/>
				<p style="text-align:right;">2018년 2월</p>
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주관기관 : 전라북도생물산업진흥원<br/>
				- 조사기관 : (주)한국정보통계 (연구책임 : 오민권 (주)한국정보통계 대표)<br/> 
				- 담 당 자 : 양서진/ TEL. 063-288-0488<br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="closeThis();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="창닫기"/></td>
		</tr>
	</table>
</div>
</body>
</html>