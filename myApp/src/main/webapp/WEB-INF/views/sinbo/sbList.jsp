<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>전북 신용보증재단 서비스만족도 조사 현황표</title>
	
	<script src="resources/js/jquery.js"></script>
	
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.css"/>
	
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.bootstrap.min.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.colVis.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	               
	<link rel="StyleSheet" href="<c:url value='resources/css/datatable.css'/>" type="text/css">
	<link rel="StyleSheet" href="<c:url value='resources/css/datatableUse.css'/>" type="text/css"> 
	
	<style>
		.container {margin-right: auto;margin-left: auto;padding-bottom: 300px;width:45%;height:auto;}
		.question {font-weight:bold;}
		@media ( max-width: 480px ) {
			.container {width:auto;}
			.question {font-weight:bold;float:none;width:auto;}
		}
		.firTh{background-color:#FFF2E6;width:12%;border-bottom : 1px solid #ddd;text-align:center;}
		.firTd{border-bottom : 1px solid #ddd;text-align:center;}
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
			left: 50%;
			z-index: 100;
		}
	</style>
	
	<script>
		$(document).ready(function(){
			setInterval("server_time()", 1000);
		});
		
		function server_time(){
			var now = new Date();
		    now.setSeconds(now.getSeconds()+1);
		 
		    var year = now.getFullYear();
		    var month = now.getMonth() + 1;
		    var date = now.getDate();
		    var hours = now.getHours();
		    var minutes = now.getMinutes();
		    var seconds = now.getSeconds();
		 
		    if (month < 10) month = "0" + month;
		 	if (date < 10) date = "0" + date;
		 	if (hours < 10) hours = "0" + hours;
		 	if (minutes < 10) minutes = "0" + minutes;
		   	if (seconds < 10) seconds = "0" + seconds;
		    
		    $('#nowDate').text("현재시간 : "+year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds);
		}
		
		function getList(type){
			$('.loader').css('display','');
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			
			$('#payList').DataTable({
		          dom: 'Bfrtip',
		          lengthChange: false,
		          autoWidth : false,
		          processing: false,
		          ordering: true,
		          serverSide: false,
		          searching: false,
		          //lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
		          pageLength: 50,
		          bPaginate: false,
		          bLengthChange: false,
		          bAutoWidth: false,
		          bStateSave: true,
		          buttons: ['excel'], 
		          oLanguage : {
		             sProcessing : "처리중...",
		             sZeroRecords : "데이터가 없습니다(전체보기시 10초정도 소요될 수 있습니다)",
		             oPaginate : {
		                   sFirst : "처음",
		                   sNext : ">",
		                   sPrevious : "<",
		                   sLast : "끝"
		 
		             },
		             sInfo : "총_TOTAL_건 중, _START_건부터_END_건까지 표시",
		             sInfoEmpty : "0 건 중, 0부터 0 까지 표시", 
		             sInfoFiltered : "(총 _MAX_ 건에서 추출 )",
		             /* sSearch : "상세 검색 : " */                
		       },
			    ajax : {
			   
			      "url":"getResList?startDate="+startDate+"&endDate="+endDate+"&type="+type,
			      "type":"POST",
			      "dataSrc": function(json){
						var list = json.list;			    	   
						return list;
			      	}
				  },            
				  columns : [
				      {data: "sbNum"},
				      {data: "sbSex"},
				      {data: "sbAge"},
				      {data: "sbLocal"},
				      {data: "sbBusiness"},
				      {data: "sbYears"},
				      {data: "sbBranch"},
				      {data: "sbJosaja"},
				      {data: "q1"},
				      {data: "q2"},
				      {data: "q3"},
				      {data: "q4"},
				      {data: "q5"},
				      {data: "q6"}
				  ],
			         initComplete : function() {		  
			        	 $('#payList_filter').prepend( $('#buttonWrap')) ;
			        	 $('.loader').css('display','none');
			         } 
			   });
		}
		
		function sendMms(order){
			if(confirm('문자를 보내시겠습니까?')){
				$('.loader').css('display','');
				
				$.ajax({
					url : 'sendSmsSinbo',
					data : {'order':order, 'msg':$('#msg').val()},
					type : 'post',
					dataType : 'json',
					success : function(data){
						$('.loader').css('display','none');
						
						alert(data.succ+' 건 성공!!  '+data.fail+' 건 실패!!');
					}
				})
			}
			
		}
		
		$(document).on('click','#btn-upload',function(){
			var formData = new FormData($("#event")[0]);
			$('.loader').css('display','');
			
	        $.ajax({
	            type : 'post',
	            url : 'addSinboExcel',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(data) {
	            	$('.loader').css('display','none');
	            	alert(data.succ+" 건 등록 하였습니다.");           
	            },
	            error : function(error) {
	            	$('.loader').css('display','none');
	                alert("등록에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
		})
		
		$(document).on('click','#surveyBtn',function(){
			var sbHp = $('#sbHp').val();
			
			if(sbHp == null || sbHp == ''){
				alert('핸드폰번호를 입력하세요');
				return;
			}
			
			$.ajax({
				url : 'getSbNum',
				data : {'sbHp':sbHp},
				dataType : 'json',
				type : 'post',
				success : function(data){
					location.href = "http://bestpoll.kr/19/0726.jsp?SB_NUM="+data.sbNum;
				}
			})
		})
	</script>
</head>
<body>
	<div class="loader" style="display:none;">
		<img src="resources/img/2.gif" alt="loading">
	</div>
	
	<div class="container">
		<h2 style="text-align:center;background-color:#662500;color:#F6F6F6;">전북 신용보증재단 서비스만족도 조사 현황표</h2>
		<h3>조사시작 : 2018.04.01 ~ </h3>
		<h3 id="nowDate" style="background-color:#FAECC5"></h3>
		<br/>
		<button type="button" onclick="javascript:window.location.reload(true);" style="width:100%;height:30px;font-weight:bold;background-color:#662500;color:#F6F6F6;font-size:17px;">응답현황 최신화  <span class="glyphicon glyphicon-refresh"></span></button>
		<table style="border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" class="firTh">-</th>
				<th rowspan="2" class="firTh">대상자</th>
				<th rowspan="2" class="firTh">응답자</th>
				<th rowspan="2" class="firTh">응답률</th>
				<th colspan="5" class="firTh">미응답자</th>
			</tr>
			<tr>
				<th class="firTh">부재중</th>
				<th class="firTh">추후응답</th>
				<th class="firTh">응답거부</th>
				<th class="firTh">문자1,2차</th>
				<th class="firTh">합계</th>
			</tr>
			<c:forEach var="list" items="${list}" varStatus="i">
				<tr>
					<td class="firTd">${i.index+3 }월</td>
					<td class="firTd">${list.totalCnt }명</td>
					<td class="firTd">${list.resCnt }명</td>
					<td class="firTd"><fmt:formatNumber value="${(list.resCnt/list.totalCnt)*100 }" pattern=".0"/>%</td>
					<td class="firTd">${list.bujeCnt }</td>
					<td class="firTd">${list.afterCnt }</td>
					<td class="firTd">${list.rejectCnt }</td>
					<td class="firTd">${list.mmsCnt }</td>
					<td class="firTd">${list.totalCnt - list.resCnt }</td>
				</tr>
			</c:forEach>		
		</table>
		
		<br/><br/>
		<table style="width:100%;">
			<tr>
				<td style="width:70%;"><input type="text" name="sbHp" id="sbHp" class="form-control" style="width:95%;" placeholder="전화번호 숫자만 입력"/></td>
				<td style="width:30%;"><button type="button" class="btn btn-info btn-block" id="surveyBtn">설문응답바로가기</button></td>
			</tr>
		</table>
		
		<br/><br/>
		<form name="event" id="event" enctype="multipart/form-data" method="post" action="<c:url value="eventWrite"/>">
			<table style="width:100%;border:1px solid #ddd;">
				<tr>
					<td style="width:70%;"><input type="file" name="excelFile" id="excelFile" /></td>
					<td style="width:30%;"><button type="button" class="btn btn-success btn-block" id="btn-upload">조사대상 업로드</button></td>
				</tr>
			</table>
		</form>
		
		
		<br/><br/>
		<table style="width:100%;">
			<tr>
				<td style="width:45%;" rowspan="3">
					<p style="background-color:#662500;color:#F6F6F6;font-size:17px;">문자내용 <span class="glyphicon glyphicon-envelope"></span></p>
					<textarea style="width:100%;height:200px;" name="msg" id="msg">
전북신용보증재단 서비스 만족도 조사입니다.
아래 링크를 눌러 조사에 응답해 주시면 더욱 좋은 서비스로 보답 하겠습니다.
편하신 시간에 응답해 주시기 바랍니다.
					</textarea>
				</td>
				<td style="width:50%;text-align:center;"><button type="button" class="btn btn-info btn-block" onclick="sendMms('first')" style="width:60%;margin-left:40px;height:85%;">신규데이터 문자발송 <span class="glyphicon glyphicon-share-alt"></span></button></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;"><button type="button" class="btn btn-warning btn-block" onclick="sendMms('second')" style="width:60%;margin-left:40px;height:85%;">문자1,2차 문자발송  <span class="glyphicon glyphicon-share-alt"></span></button></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;"><button type="button" class="btn btn-danger btn-block" onclick="sendMms('last')" style="width:60%;margin-left:40px;height:85%;">부재, 추후응답 문자발송  <span class="glyphicon glyphicon-share-alt"></span></button></td>
			</tr>
		</table>
		
		<br/><br/>
		<table style="width:100%;">
			<tr>
				<td><input type="date" name="startDate" id="startDate" class="form-control"/></td>
				<td><input type="date" name="startDate" id="endDate" class="form-control"/></td>
				<td><button type="button" onclick="getList('after');" class="btn btn-primary">응답현황(보정)</button></td>
				<td><button type="button" onclick="getList('before');" class="btn btn-success">응답현황(원본)</button></td>
			</tr>
		</table>
		
		<div id="page-wrapper">
			<br/>
			<!-- <div class="row">
				<div style="text-align:left;margin-right:10px;">
					<button type="button" class="btn btn-success" onclick="sendMms();">일괄메세지</button>
					<button type="button" class="btn btn-primary" onclick="addBranchPop();">지점등록</button>
				</div>
			</div> -->
			
			<div class="row">
				<div id="content">
					<table id="payList" style="display:none;">
						<colgroup>
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">               
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="300px">
						</colgroup>
						<thead>
							<tr>
								<th>id</th>
								<th>sex</th>
								<th>age</th>
								<th>local</th>
								<th>business</th>
								<th>year</th>
								<th>branch</th>
								<th>manager</th>
								<th>q1</th>
								<th>q2</th>
								<th>q3</th>
								<th>q4</th>
								<th>q5</th>
								<th>q6</th>						
							</tr>
						</thead>
						<tbody>
						    
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>