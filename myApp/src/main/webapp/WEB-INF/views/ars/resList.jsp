<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>여론조사 응답현황표</title>
	
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
		
		function getResList(){
			var startDate = $('#startDate').val();
			var time = $('#startTime').val();
			var min = $('#startMin').val();
			
			if(startDate == null || startDate == ''){
				alert('날짜를 선택하세요');
				return;
			}
			if(time == null || time == ''){
				alert('몇시인지 입력하세요');
				return;
			}
			
			if(min == null || min == ''){
				min = '00';
			}else if(min.length == 1){
				min = '0'+min;
			}
			
			var endDate = $('#endDate').val();
			var endTime = $('#endTime').val();
			var endMin = $('#endMin').val();
			
			if(endTime == null || endTime == ''){
				if(parseInt(endTime)<10){
					endTime = '0'+endTime;
				}
			}
			
			if(endMin == null || endMin == ''){
				endMin = '00';
			}else if(min.length == 1){
				endMin = '0'+min;
			}
			
			$('#start').text(startDate+' '+time+':'+min+':00');
			$('.loader').css('display','');
			$.ajax({
				url : 'getResInfo',
				data : {'startDate':startDate, 'time':time, 'min':min, 'type':1, 'endDate':endDate, 'endTime':endTime, 'endMin':endMin},
				dataType : 'json',
				type : 'post',
				success : function(data){
					arsRes = data.arsRes;
					var resRate = (arsRes.completeCnt/arsRes.succCnt*100).toFixed(1);
					console.log(resRate)
					var html = '';
					html += '<td>'+arsRes.totalCnt+'</td>';
					html += '<td>'+(arsRes.succCnt-arsRes.completeCnt)+'</td>';
					html += '<td>'+arsRes.completeCnt+'</td>';
					html += '<td>'+arsRes.succCnt+'</td>';
					html += '<td>'+resRate+'%</td>';
					html += '<td>'+arsRes.failCnt+'</td>';
					html += '<td>'+arsRes.failCnt2+'</td>';
					html += '<td>'+arsRes.unqCnt+'</td>';
					html += '<td>'+arsRes.unqCnt2+'</td>';
					
					$('#resResultTr').html(html);
					$('.loader').css('display','none');
					$('#resListDiv').slideDown();
					
					getList(startDate,time,min, endDate, endTime, endMin);
				}
			})
		}
		
		function getList(startDate, time, min, endDate, endTime, endMin){
			$('#payList').DataTable({
		          dom: 'Bfrtip',
		          lengthChange: false,
		          autoWidth : false,
		          processing: false,
		          ordering: true,
		          serverSide: false,
		          searching: true,
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
		             sSearch : "상세 검색 : "                
		       },
			    ajax : {			   
					"url":"getResInfo?startDate="+startDate+"&time="+time+"&min="+min+"&endDate="+endDate+"&endTime="+endTime+"&endMin="+endMin,
					"type":"POST",
					"dataSrc": function(json){
						var list = json.list;			    	   
						return list;
					}
				  },            
				  columns : [
					  {data: "no", sClass:"counNo"},
				      {data: "sendDate"},
				      {data: "duration"},
				      {data: "ans1"},
				      {data: "ans2"},
				      {data: "ans3"},
				      {data: "ans4"},
				      {data: "ans5"}
				  ],
			         initComplete : function() {
			  
			        	 $('#payList_filter').prepend( $('#buttonWrap')) ;
			        	 
			         } 
			   });
			$('#payList').slideDown();
		}
		
		//응답자 표본에서 삭제
		function deleteResList(){
			var startDate = $('#startDate').val();
			var time = $('#startTime').val();
			var min = $('#startMin').val();
			
			if(min == null || min == ''){
				min = '00';
			}else if(min.length == 1){
				min = '0'+min;
			}
			console.log(startDate);
			if(confirm('삭제 대상을 표본에서 삭제하시겠습니까?')){
				$.ajax({
					url : 'deleteResList',
					type : 'post',
					dataType : 'json',
					data : {'startDate':startDate, 'time':time, 'min':min},
					success : function(data){
						html = '';
						html += '** (접촉)'+data.res1+' 건, '+'(연결이상)'+data.res2+' 건, '+'(결번)'+data.res3+' 건 삭제 완료~!!';
						
						$('#deleteResult').html(html);
					}
				})
			} 
		}
	</script>
</head>
<body>
	<div class="loader" style="display:none;">
		<img src="resources/img/2.gif" alt="loading">
	</div>
	<div class="container">
		<h2 style="text-align:center;background-color:#030066;color:#F6F6F6;">선거여론조사 현황표</h2>
		
		<table style="width:100%;">
			<tr>
				<td style="width:20%;"><input type="date" name="startDate" id="startDate" class="form-control"/></td>
				<td style="text-align:center;width:8%;"><input type="text" name="startTime" id="startTime" class="form-control" placeholder="시"/></td>
				<td style="text-align:center;width:8%;"><input type="text" name="startMin" id="startMin" class="form-control" placeholder="분"/></td>
				<td style="text-align:center;width:8%;">~</td>
				<td style="width:20%;"><input type="date" name="endDate" id="endDate" class="form-control"/></td>
				<td style="text-align:center;width:8%;"><input type="text" name="endTime" id="endTime" class="form-control" placeholder="시"/></td>
				<td style="text-align:center;width:8%;"><input type="text" name="endMin" id="endMin" class="form-control" placeholder="분"/></td>
				<td style="width:20%;"><button type="button" onclick="getResList();" class="btn btn-primary">응답현황 검색</button></td>
			</tr>
		</table>
		
		<div style="width:100%;display:none;" id="resListDiv">
			<h3>조회시작 : <font id="start"></font></h3>
			<h3 id="nowDate" style="background-color:#FAECC5"></h3>
			<br/>
			<button type="button" style="width:100%;height:30px;font-weight:bold;background-color:#030066;color:#F6F6F6;font-size:17px;">응답현황</button>
			<table style="border:1px solid #000000;width:100%;">
				<tr>
					<th rowspan="2" class="firTh">총발송</th>
					<th colspan="2" class="firTh">접촉사례</th>
					<th rowspan="2" class="firTh">접촉합계</th>
					<th rowspan="2" class="firTh">응답률</th>
					<th colspan="2" class="firTh">접촉실패</th>
					<th colspan="2" class="firTh">비적격</th>
				</tr>
				<tr>
					<th class="firTh">중도이탈</th>
					<th class="firTh">응답완료</th>
					<th class="firTh">부재중</th>
					<th class="firTh">통화중</th>
					<th class="firTh">결번</th>
					<th class="firTh">기타3번</th>
				</tr>
				<tr id="resResultTr">
					
				</tr>				
			</table>
			<br/><br/>
			<button type="button" onclick="deleteResList();" style="width:100%;height:30px;font-weight:bold;background-color:#FF0000;color:#F6F6F6;font-size:17px;">대상목록에서 응답내용 삭제</button>			
		</div>
		
		<div id="deleteResult" style="width:100%;font-weight:bold;color:#002266;">
		
		</div>
		
		<div id="page-wrapper">
			<br/>
			<div class="row">
				<div id="content">
					<table id="payList" style="display:none;">
						<colgroup>
							<col width="100px">
							<col width="200px">
							<col width="100px">
							<col width="100px">               
							<col width="100px">
							<col width="100px">
							<col width="100px">
							<col width="100px">							
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>발송시간</th>
								<th>통화시간(초)</th>
								<th>연령</th>
								<th>성별</th>
								<th>지역</th>
								<th>4번</th>
								<th>5번</th>					
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