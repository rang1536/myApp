<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		var d = new Date();
		var year = d.getFullYear();
		var month = d.getMonth()+1;
		var date = d.getDate();
		var hour = d.getHours();
		var minutes = d.getMinutes();
		
		var nowDate = year + " 년 " + month + " 월 " + date + " 일  "+hour + " 시 "+minutes+" 분";
		$('#nowDate').html(nowDate);
	})
</script>
</head>
<body>

<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">전라북도 농생명산업 보수교육 수요조사 응답수</h2>
	
	<table style="padding:4px;border:1px solid #000000;width:100%;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;">
					<p id="nowDate" style="background-color:#F2CB61;"></p>
					<p style="font-size:18px;font-weight:bold;">&nbsp;현재응답수 : ${count } 건</p> 
				</p> <br/>
				
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주관기관 : 전라북도생물산업진흥원<br/>
				- 조사기관 : (주)한국정보통계 (연구책임 : 오민권 (주)한국정보통계 대표)<br/> 
				- 담 당 자 : 양서진/ TEL. 063-288-0488<br/>
			</td>
		</tr>
		
	</table>
</div>

</body>
</html>