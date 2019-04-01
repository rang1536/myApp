<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2019 신규시책 발굴을 위한 설문 현황표</title>

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

<script>
	function getList(){		
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
		   
		      "url":"getSicheckList",
		      "type":"POST",
		      "dataSrc": function(json){
					var list = json.list;			    	   
					return list;
		      	}
			  },            
			  columns : [
			      {data: "no"},
			      {data: "gender"},
			      {data: "age"},
			      {data: "local"},
			      {data: "job"},
			      {data: "q1"},
			      {data: "q2"},
			      {data: "q3"},
			      {data: "q4"},
			      {data: "q5"},
			      {data: "q6"},
			      {data: "q7"},
			      {data: "q8"},
			      {data: "q9"},
			      {data: "q10"}
			  ],
		         initComplete : function() {		  
		        	 $('#payList_filter').prepend( $('#buttonWrap')) ;
		         } 
		   });
	}
	
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
	
	function sendMms(){
		var msg = $('#msg').val();
		
		$.ajax({
			url : 'sicheckSendMms',
			type : 'post',
			dataType : 'json',
			success : function(data){
				if(data.result == 'succ'){
					alert('대표님 개인자료 미응답자에게 문자를 모두 발송하였습니다');
					return;
				}
			}
		})
	}
</script>
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
	.firTh{background-color:#FFF2E6;width:12%;border-bottom : 1px solid #ddd;text-align:center;}
	.firTd{border-bottom : 1px solid #ddd;text-align:center;}
</style>

</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#662500;color:#F6F6F6;">2019 신규시책 발굴을 위한 설문 현황표</h2>
	<h3>조사시작 : 2018.08.13 ~ </h3>
	<h3 id="nowDate" style="background-color:#FAECC5"></h3>
	<br/>
	<button type="button" onclick="javascript:window.location.reload(true);" style="width:100%;height:30px;font-weight:bold;background-color:#662500;color:#F6F6F6;font-size:17px;">응답현황 최신화  <span class="glyphicon glyphicon-refresh"></span></button>
	
	<table style="border:1px solid #000000;width:100%;">
		<tr>
			<th class="firTh">지역</th>
			<th class="firTh">응답자수(남/여)</th>
			<th class="firTh">목표표본</th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td class="firTd">${list.local }</td>
				<td class="firTd">${list.totalCnt }(${list.manCnt }/${list.womanCnt })</td>
				<td class="firTd">${list.targetCnt }</td>
			</tr>
		</c:forEach>
	</table>
	
	<br/><br/>
	<table style="width:100%;">
		<tr>
			<td style="width:45%;" rowspan="3">
				<p style="background-color:#662500;color:#F6F6F6;font-size:17px;">문자내용 <span class="glyphicon glyphicon-envelope"></span></p>
				<textarea style="width:100%;height:200px;" name="msg" id="msg">
2019 신규시책 발굴을 위한 설문조사입니다.
아래 링크를 눌러 조사에 응답해 주시면 도정에 반영하여 더욱 나은 전라북도를 만드는데 더욱 노력하겠습니다.
편하신 시간에 응답해 주시기 바랍니다.
				</textarea>
			</td>
			<td style="width:50%;text-align:center;"><button type="button" class="btn btn-info btn-block" onclick="sendMms()" style="width:60%;margin-left:40px;height:85%;">문자발송 <span class="glyphicon glyphicon-share-alt"></span></button></td>
		</tr>
		<tr>
			<td style="width:50%;text-align:center;"></td>
		</tr>
		<tr>
			<td style="width:50%;text-align:center;"></td>
		</tr>
	</table>
	
	<br/><br/>
	<table style="width:100%;">
		<tr>	
			<td><button type="button" onclick="getList();" class="btn btn-primary">응답현황</button></td>			
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
						<col width="100px">
						<col width="100px">
					</colgroup>
					<thead>
						<tr>
							<th>no</th>
							<th>gender</th>
							<th>age</th>
							<th>local</th>
							<th>job</th>
							<th>q1</th>
							<th>q2</th>
							<th>q3</th>
							<th>q4</th>
							<th>q5</th>
							<th>q6</th>
							<th>q7</th>
							<th>q8</th>
							<th>q9</th>	
							<th>q10</th>					
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