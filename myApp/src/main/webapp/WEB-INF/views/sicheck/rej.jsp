<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2019 신규시책 발굴을 위한 설문</title>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<style>
	.container {
	  margin-right: auto;
	  margin-left: auto;
	  padding-bottom: 300px;
	  width:45%;
	  height:auto;
	}
	.question {
		font-weight:bold;
	}
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
	th{
		background-color:#ddd;
		width:50px;
		border-bottom : 1px solid #ddd;
	}
	td{
		border-bottom : 1px solid #ddd;
	}
</style>

<script>
	$(document).ready(function(){
		var poNum = $('#poNum').val();
		
		$.ajax({
			url : 'sicheckRej',
			data : {'poNum':poNum},
			dataType : 'json',
			type : 'post',
			success : function(data){
				
			}
		})
	})
</script>
</head>
<body>
<div class="container">
	<input type="hidden" id="poNum" name="poNum" value="${poNum }"/>
	<h2 style="text-align:center;background-color:#ddd;">2019년 신규시책 발굴을 위한 도민여론조사</h2>
	</br></br>
	<p style="font-weight:bold;font-size:30px;">
		문자수신거부 처리를 완료하였습니다.<br/>
		불편을 드려 죄송합니다.
	</p>
</div>
</body>
</html>