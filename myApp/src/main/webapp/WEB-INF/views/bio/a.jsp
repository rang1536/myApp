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
	function infoStart(){
		$('#intro').css('display','none');
		$('#infoDiv').slideDown();
	}
	
	// 설문응답 시작
	function start(){
		var comName = $('#comName').val();
		var comImport17 = $('#comImport17').val();
		var comWorkerCnt = $('#comWorkerCnt').val();
		var comAddress = $('#comAddress').val();
		
		if(comName == null || comName == ''){
			alert('기업명을 입력해주세요!!');
			$('#comName').focus();
			return;
		}else if(comImport17 == null || comImport17 == ''){
			alert('17년도 매출액을 입력해주세요!!');
			$('#comImport17').focus();
			return;
		}else if(comWorkerCnt == null || comWorkerCnt == ''){
			alert('현재 고용인력을 입력해주세요!!');
			$('#comWorkerCnt').focus();
			return;
		}else if(comAddress == null || comAddress == ''){
			alert('기업주소를 입력해주세요!!');
			$('#comAddress').focus();
			return;
		} 
		
		$('#infoDiv').css('display','none');
		$('#section1').slideDown();	
	}
	
	function nextQuestion(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		
		var ans = $('input[name="q'+nowPageNum+'"]:checked').val();
		var ansC = $('input[name="q'+nowPageNum+'c"]:checked').val();
		var ansFir = $('input[name="q'+nowPageNum+'Fir"]').val();
		
		if(ans == null || ans == ''){
			alert("사업의 필요성 점수를 선택하세요!");
			return;
		}
		if(ansC == null || ansC == ''){
			alert("참여여부를 선택하세요!");
			return;
		}
		
		$('#'+nowTag).css('display','none');
		$('#'+nextTag).slideDown();	
	}
	
	//설문 DB입력
	function insertBioRes(){
		$('#resForm').attr('action','/insertBioRes').submit();
	}
	
	// 만족도평가항목 보이기
	function showHiddenTb(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		
		$('#'+nowTag).find('#hiddenTb').slideDown();
	}
	
	//만족도평가항목 감추기
	function hideHiddenTb(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		$('#'+nowTag).find('#hiddenTb').slideUp();
	}
</script>
</head>
<body>

<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">전라북도 농생명산업 보수교육 수요조사서</h2>
	
	<table style="padding:4px;border:1px solid #000000;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;">
					<font id="nowDate" style="background-color:#F2CB61;"></font>
					&nbsp;안녕하십니까! 전라북도생물산업진흥원 입니다.<br/><br/>
					&nbsp;전라북도생물산업진흥원은 도내 농생명산업 관련 보수교육으로 2018년도에 계획 중인 식품산업 현장실무형 교육지원사업에 대해 수요조사를 실시하고 있습니다.<br/><br/>
					&nbsp;본 조사의 목적은 도내 기업의 직장인 보수교육 수요를 파악하여 기업 맞춤형 교육프로그램 개발과 각종 정보를 제공할 수 있는 기틀을 마련하고자 함입니다.<br/><br/>
					&nbsp;조사 내용은 기업체의 연락처 및 기업에 필요한 교육 등의 수요조사로 나뉘어져 있습니다. 응답하신 내용은 본 목적 이외에는 절대 사용하지 않으니 협조하여 주시기 바랍니다.<br/><br/>
					&nbsp;바쁘시겠지만 시간을 허락하시어 협조해 주시면 대단히 감사하겠습니다..<br/>
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
			<td colspan="2"><input type="button" onclick="infoStart();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
		</tr>
	</table>
	
	<form id="resForm" method="post" action="insertBioRes">
	<div style="width:100%;display:none;" id="infoDiv">
		<h4 class="cate">■ 기업정보</h4>
		<h4 style="color:#030066;">(* 필수입력정보는 꼭 입력해주시기 바랍니다.)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>기업명</th>
				<td><input type="text" name="comName" id="comName" placeholder="*필수입력" /></td>
				<th>대표자</th>
				<td><input type="text" name="comCeo"/></td>
			</tr>
			<tr>
				<th>주요<br/>생산품</th>
				<td colspan="3"><input type="text" name="comProduct"/></td>
			</tr>
			<tr>
				<th>'17년매출액</th>
				<td style="text-align:center;">( <input type="text" name="comImport17" id="comImport17" placeholder="*필수입력" style="width:50%;"/> )백만원</td>
				<th>현재<br/>고용인력</th>
				<td style="text-align:center;">( <input type="text" name="comWorkerCnt" id="comWorkerCnt" placeholder="*필수입력" style="width:35%;"/> )명</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3"><input type="text" name="comAddress" id="comAddress" placeholder="*필수입력" /></td>
			</tr>
			<tr>
				<th>전화</th>
				<td><input type="text" name="comTel"/></td>
				<th>홈페이지</th>
				<td><input type="text" name="comHomepage"/></td>
			</tr>
			<tr>
				<th>팩스</th>
				<td><input type="text" name="comFax"/></td>
				<th>이메일</th>
				<td><input type="text" name="comEmail"/></td>
			</tr>
			<tr>
				<td colspan="4"><br/><input type="button" onclick="start();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
			</tr>
		</table>
		
	</div>
	<div style="width:100%;display:none;" id="section1">
		<h4 class="cate">■ 문항수 (1/5)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" style="width:500px;">식품산업 현장실무교육 지원사업<br/>(1~3순위에 해당 번호 기입)</th>
				<th colspan="7">해당 칸에 체크</th>
			</tr>
			<tr>
				<th colspan="5">사업의필요성<br/> ◁ 낮음 보통 높음 ▷</th>
				<th colspan="2">참여여부</th>
			</tr>
			<tr>
				<td rowspan="2"> 1) 기업 수요 및 산업 트랜드를 반영한 맞춤형 교육.<br/>(세미나형 교육 프로그램)</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">1</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">2</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">3</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">4</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">5</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">O</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">X</td>
			</tr>
			<tr>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1" value="2"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1" value="3"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1" value="4"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1" value="5"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1c" value="1" onclick="showHiddenTb(1)"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q1c" value="2" onclick="hideHiddenTb(1)"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;display:none;" id="hiddenTb">
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="3">1-1)<br/>희망<br/>과목</td>
				<th>1순위:</th>
				<td><input type="text" name="q1First"/></td>
				<th>2순위:</th>
				<td><input type="text" name="q1First"/></td>
				<th>3순위:</th>
				<td><input type="text" name="q1First"/></td>
			</tr>
			<tr>
				<td colspan="2">① 고객관리</td>
				<td colspan="2">② 마케팅</td>
				<td colspan="2">③투자유치</td>
			</tr>
			<tr>
				<td colspan="2">④ 수출역량강화</td>
				<td colspan="2">⑤ SNS/온라인 쇼핑몰 운영</td>
				<td colspan="2">⑥ 회계 및 재무관리</td>
			</tr>
			
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td><br/><input type="button" onclick="nextQuestion(1);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
			</tr>
		</table>
	</div>
	
	<div style="width:100%;display:none;" id="section2">
		<h4 class="cate">■ 문항수 (2/5)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" style="width:500px;">식품산업 현장실무교육 지원사업<br/>(1~3순위에 해당 번호 기입)</th>
				<th colspan="7">해당 칸에 체크</th>
			</tr>
			<tr>
				<th colspan="5">사업의필요성<br/> ◁ 낮음 보통 높음 ▷</th>
				<th colspan="2">참여여부</th>
			</tr>
			<tr>
				<td rowspan="2"> 2) 강좌를 개설하고 수강생을 모집하여 이론 및 실습교육을 운영하는 유형(소규모 집체 교육 프로그램)</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">1</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">2</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">3</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">4</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">5</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">O</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">X</td>
			</tr>
			<tr>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2" value="2"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2" value="3"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2" value="4"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2" value="5"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2c" value="1" onclick="showHiddenTb(2)"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q2c" value="2" onclick="hideHiddenTb(2)"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;display:none;" id="hiddenTb">
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="4">2-1)<br/>희망과목</td>
				<th>1순위:</th>
				<td><input type="text" name="q2Fir"/></td>
				<th>2순위:</th>
				<td><input type="text" name="q2Sec"/></td>
				<th>3순위:</th>
				<td><input type="text" name="q2Thi"/></td>
			</tr>
			<tr>
				<td colspan="2">① HACCP</td>
				<td colspan="2">② 유가공인증</td>
				<td colspan="2">③ 미생물검사법</td>
			</tr>
			<tr>
				<td colspan="2">④ 식품관능평가</td>
				<td colspan="2">⑤ ISO22000</td>
				<td colspan="2">⑥ GMP</td>
			</tr>
			<tr>
				<td colspan="6">⑦ 기타 ( <input type="text" name="q2Etc" style="width:600px;"/> )</td>
				
			</tr>		
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td><br/><input type="button" onclick="nextQuestion(2);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
			</tr>
		</table>
	</div>
	
	<div style="width:100%;display:none;" id="section3">
		<h4 class="cate">■ 문항수 (3/5)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" style="width:500px;">식품산업 현장실무교육 지원사업<br/>(1~3순위에 해당 번호 기입)</th>
				<th colspan="7">해당 칸에 체크</th>
			</tr>
			<tr>
				<th colspan="5">사업의필요성<br/> ◁ 낮음 보통 높음 ▷</th>
				<th colspan="2">참여여부</th>
			</tr>
			<tr>
				<td rowspan="2"> 1) 기업현장을 찾아가는 교육유형<br/>(기업방문 맞춤형 교육 프로그램)</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">1</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">2</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">3</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">4</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">5</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">O</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">X</td>
			</tr>
			<tr>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3" value="2"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3" value="3"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3" value="4"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3" value="5"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3c" value="1" onclick="showHiddenTb(3)"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q3c" value="2" onclick="hideHiddenTb(3)"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;display:none;" id="hiddenTb">
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="3">3-1)<br/>희망과목</td>
				<th>1순위:</th>
				<td><input type="text" name="q3First"/></td>
				<th>2순위:</th>
				<td><input type="text" name="q3Sec"/></td>
				<th>3순위:</th>
				<td><input type="text" name="q3Thi"/></td>
			</tr>
			<tr>
				<td colspan="2">① 생산인력 위생교육</td>
				<td colspan="2">② HACCP & GMP교육</td>
				<td colspan="2">③ 제품개발교육</td>
			</tr>
			<tr>
				<td colspan="2">④ 공정설계/레이아웃</td>
				<td colspan="2">⑤ 생산관리/마케팅교육</td>
				<td colspan="2">⑥ 기타( <input type="text" name="q3Etc" style="width:140px;"/> )</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td><br/><input type="button" onclick="nextQuestion(3);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
			</tr>
		</table>
	</div>
	
	<div style="width:100%;display:none;" id="section4">
		<h4 class="cate">■ 문항수 (4/5)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" style="width:500px;">식품산업 현장실무교육 지원사업<br/>(1~3순위에 해당 번호 기입)</th>
				<th colspan="7">해당 칸에 체크</th>
			</tr>
			<tr>
				<th colspan="5">사업의필요성<br/> ◁ 낮음 보통 높음 ▷</th>
				<th colspan="2">참여여부</th>
			</tr>
			<tr>
				<td rowspan="2"> 4) 예비 취업인력 기업 맞춤형 교육 프로그램 운영.<br/>(취업 연계형 교육 지원)</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">1</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">2</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">3</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">4</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">5</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">O</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">X</td>
			</tr>
			<tr>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4" value="2"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4" value="3"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4" value="4"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4" value="5"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4c" value="1" onclick="showHiddenTb(4)"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q4c" value="2" onclick="hideHiddenTb(4)"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;display:none;" id="hiddenTb">
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="3">4-1)<br/>희망과목</td>
				<th>1순위:</th>
				<td><input type="text" name="q4Fir"/></td>
				<th>2순위:</th>
				<td><input type="text" name="q4Sec"/></td>
				<th>3순위:</th>
				<td><input type="text" name="q4Thi"/></td>
			</tr>
			<tr>
				<td colspan="2">① 생산인력</td>
				<td colspan="2">② 품질관리 인력</td>
				<td colspan="2">③ R&D인력</td>
			</tr>
			<tr>
				<td colspan="2">④ 공정관리 인력</td>
				<td colspan="2">⑤ 마케팅 인력</td>
				<td colspan="2">⑥ 기타 ( <input type="text" name="q4Etc" style="width:170px;"/> )</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td><br/><input type="button" onclick="nextQuestion(4);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
			</tr>
		</table>
	</div>
	
	<div style="width:100%;display:none;" id="section5">
		<h4 class="cate">■ 문항수 (5/5)</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th rowspan="2" style="width:500px;">식품산업 현장실무교육 지원사업</th>
				<th colspan="7">해당 칸에 체크</th>
			</tr>
			<tr>
				<th colspan="5">사업의필요성<br/> ◁ 낮음 보통 높음 ▷</th>
				<th colspan="2">참여여부</th>
			</tr>
			<tr>
				<td rowspan="2" style="font-size:14px;"> 5) 첨단기술동향 및 업계동향정보 공유, 포럼, 세미나, 연구회를 통해 기업기술 경쟁력 재고 및 최신기술동향을 파악하고 다양한 네트워킹을 추진하는 유형 (식품 기업간 네트워킹 지원)</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">1</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">2</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">3</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">4</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">5</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">O</td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;">X</td>
			</tr>
			<tr>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5" value="2"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5" value="3"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5" value="4"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5" value="5"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5c" value="1"/></td>
				<td style="width:40px;text-align:center;border:1px solid #ddd;"><input type="radio" name="q5c" value="2"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="2">5-1)<br/>의 견</td>
				<td><textarea name="q5Etc" style="width:98%;border-radius:5px;"></textarea></td>
			</tr>			
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td colspan="2"><br/>6) 본 사업 이외의 희망하는 지원분야를 자유롭게 서술해주세요.( 기타의견 )</td>
			</tr>
			<tr>
				<td style="text-align:center;border:1px solid #ddd;" rowspan="2">6-1)<br/>의 견</td>
				<td><textarea name="q6Etc" style="width:98%;border-radius:5px;height:50px;"></textarea></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td><br/><input type="submit" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="설문완료"/></td>
			</tr>
		</table>
	</div>	
	</form>
</div>

</body>
</html>