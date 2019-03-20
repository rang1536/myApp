<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>해외 저작권 실태 조사 설문</title>
<script src="resources/js/jquery.js"></script>
<style>
	.container {margin-right: auto;margin-left: auto;padding-bottom: 300px;width:60%;height:auto;}
	.question {font-weight:bold;}
	.qTd {font-weight:bold;height:40px;border-right:1px solid #ddd;border-bottom:1px solid #ddd;}
	.aTd{text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;font-weight:bold;height:40px;}
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
	th{}
	td{}
	.radioTd{text-align:center;border-right:1px solid #ddd;}
	.cate{font-weight:bold;font-size:16px;color:#030066;}
</style>
<script>
	$(document).ready(function(){
		var check = '${check}';
		if(check == 'already'){
			if(confirm('진행중인 내용이 있습니다. 해당 페이지로 이동하겠습니까?')){
				var lastNum = '${lastQuNum}';
				var nextNum = parseInt(lastNum)+1;
				var nextTag = 'section'+nextNum;
				
				$('#intro').css('display','none');
				$('#'+nextTag).slideDown();
			}
		}
	})
	// 설문응답 시작
	function start(){
		$('#intro').css('display','none');
		$('#section1').slideDown();
	}
	
	function next(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		
		$('#'+nowTag).css('display','none');
		$('#'+nextTag).slideDown();
	}
	
	// 다음문제 넘어가기 (부분 저장 실행)
	function nextQuestion(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		
		var resNo = $('#resNo').val();
		var userNo = $('#userNo').val();
		var ansC = '';
		var ansEtc = '';
		var ansK = '';
		var ansM = '';
		if(nowPageNum < 15){
			ansC = $('input[name="q'+nowPageNum+'c"]:checked').val();
			if(ansC == null || ansC == ''){
				alert("참여여부를 선택하세요!");
				return;
			}
		}
		
		if(nowPageNum == 1 || nowPageNum == 6 || nowPageNum == 11 || nowPageNum == 14 || nowPageNum == 16 || nowPageNum == 18 || nowPageNum == 20 || nowPageNum == 21 || nowPageNum == 23 || nowPageNum == 26 || nowPageNum == 30 || nowPageNum == 31){
			ansEtc = $('#q'+nowPageNum+'Etc').val();
		}
		
		if(nowPageNum != 31){
			ansK = $('input[name="q'+nowPageNum+'k"]:checked').val();
			ansM = $('input[name="q'+nowPageNum+'m"]:checked').val();
			if(ansK == null || ansK == ''){
				alert('기대도를 선택해주세요');
				return;
			}
			if(nowPageNum < 15){
				if(ansC == 1 && ansM == null){
					alert('만족도를 선택하세요');
					return;
				}
			}else if(nowPageNum > 14){
				if(ansM == null || ansM == ''){
					alert('만족도를 선택하세요');
					return;
				}
			}
		}	
		
		$.ajax({
			url : 'modifyRes',
			type : 'post',
			dataType : 'json',
			data : {'userNo':userNo, 'resNo':resNo ,'ansC':ansC ,'ansEtc':ansEtc ,'ansK':ansK ,'ansM':ansM,'nowPageNum':nowPageNum },
			success : function(data){
				
			}
		})
		
		
		$('#'+nowTag).css('display','none');
		$('#'+nextTag).slideDown();
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
	<h2 style="text-align:center;background-color:#F2CB61;;">해외 저작권 실태 조사 설문</h2>
	<input type="hidden" id="resNo" value="${res.resNo }"/>
	<input type="hidden" id="userNo" value="${user.userNo }"/>
	
	<table style="padding:4px;border:1px solid #000000;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;">
					<font id="nowDate" style="background-color:#F2CB61;"></font>
					&nbsp;안녕하십니까?<br/><br/>
					&nbsp;저희는 조사기관 (주)한국정보통계 입니다.<br/><br/>
					&nbsp;본 조사는 '한국 컨텐츠 이용'에 대해 조사를 진행하고 있습니다.<br/>
					&nbsp;저희가 여쭙는 질문에는 맞고 틀리는 답이 없으며, 통계 분석에만 사용되고, 그 외 목적으로는 절대 사용되는 일이 없으니 평소 생각하시는 대로 솔직하게 응답해 주시기 바랍니다. <br/>
					&nbsp;본 조사는 약 20분 정도 소요될 예정이며, 한 문항도 빠짐없이 응답해 주시기 바랍니다. <br/><br/>
					&nbsp;바쁜 시간을 내어 조사에 참여해 주심에 진심으로 감사드립니다. <br/> 
				</p> <br/>
				
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주관기관 : 저작권해외진흥협회 <br/>
				- 수행기관 : (주)한국정보통계<br/><br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="start();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
		</tr>
	</table>
	
	<!-- 파트1. Demography -->	
	<div style="width:100%;display:none;" id="section1">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part I.</font> Demography
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="width:50%;background-color:#ddd;" colspan="2">답변</th>
			</tr>
			<tr>
				<td class="qTd">D_Q1. [성별] 성별은 어떻게 되시나요?</td>
				<td class="aTd"><input type="radio" name="dQ1" value="1" /> 남성</td>
				<td class="aTd"><input type="radio" name="dQ1" value="2" /> 여성</td>
			</tr>
			<tr>
				<td class="qTd">D_Q2. [연령] 나이는 어떻게 되시나요?</td>
				<td class="aTd" colspan="2">만 <input type="number" name="dQ2"/> 세</td>
			</tr>
			<tr>
				<td class="qTd">D_Q3. [거주지] 현재 거주하는 지역은 어디인가요?</td>
				<td class="aTd" style="width:25%;"><input type="radio" name="dQ3" value="1" /> 대한민국</td>
				<td class="aTd"><input type="radio" name="dQ3" value="2" /> 태국</td>
			</tr>
			<tr>
				<td class="qTd" rowspan="3">D_Q4. [직업] 직업은 무엇입니까?</td>
				<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="1" /> 고등학생 이하</td>
				<td class="aTd"><input type="radio" name="dQ4" value="2" /> 대학생</td>
			</tr>
			<tr>
				<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="3" /> 직장인</td>
				<td class="aTd"><input type="radio" name="dQ4" value="4" /> 주부</td>
			</tr>
			<tr>
				<td class="aTd"><input type="radio" name="dQ4" value="5" /> 무직</td>
				<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="6" /> 기타 (<input type="text" name="dQ4Etc" />)</td>
			</tr>
			<tr>
				<td class="qTd">D_Q5. [동거 가족수] 현재 같이 살고 있는 가족 수는 몇 명입니까?</td>
				<td class="aTd" colspan="2">총 <input type="number" name="dQ5"/> 명</td>
			</tr>
			<tr>
				<td class="qTd">D_Q6. [개인소득] 귀하의 한 달 평균 수입은 대략 어느 정도 입니까?</td>
				<td class="aTd" colspan="2">년간 <input type="number" name="dQ6"/> </td>
			</tr>
			<tr>
				<td class="qTd">D_Q7. [가구소득] 현재 함께 살고 있는 가족 모두의 한 달 평균 총 수입은 어느 정도입니까?</td>
				<td class="aTd" colspan="2">년간 <input type="number" name="dQ7"/> </td>
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('1');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
		
	</div>
	
	<!-- 파트2. 저작권 보호 관련 인식 -->	
	<div style="width:100%;display:none;" id="section2">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part II.</font> 저작권 보호 관련 인식
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="width:50%;background-color:#ddd;" colspan="2">답변</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="8">R_Q1. 귀하께서는 온라인상에서 합법 저작물과 불법 복제물을 어떤 기준으로 구분하십니까?</td>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="1" /> 사이트 배너에 표시되는 광고의 종류</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="2" /> 콘텐츠 이용 시, 결제 여부 및 결제 금액</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="3" /> 사이트 접속 경로 (예: 직접 검색이 되지않고, 주소를 직접 입력하여 접속)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="4" /> 화질, 음질, 자막 등 콘텐츠의 품질</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="5" /> 이용 경로의 저작권OK 지정 여부 확인</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="6" /> 무료, 광고 기반형 콘텐츠 이용 시 일단 불법 복제물로 의심한다 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="7" /> 구분하지 않는다 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="8" /> 기타 (<input type="text" name="rQ1Etc"/>) </td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="5">R_Q2. 귀하께서는 불법 복제물 유통 및 이용으로 인한 저작권 침해 문제에 대해 어떻게 생각하십니까?</td>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="1" /> 전혀 심각하지 않다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="2" /> 심각하지 않다 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="3" /> 보통이다 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="4" /> 심각하다 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="5" /> 매우 심각하다 </td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="11">R_Q3. 불법 복제물 근절을 위해 가장 효과적인 방법은 무엇이라고 생각하십니까?</td>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="1" /> 불법 복제물 단속 강화를 통한 불법 복제물 제거 및 경로 폐쇄</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="2" /> 불법 복제물 생산자 처벌</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="3" /> 불법 복제물 업로더(공유한 자) 처벌</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="4" /> 불법 복제물 공유 사이트 등 운영자 처벌</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="5" /> 불법 복제물 다운로더(이용자) 처벌</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="6" /> 저작권 보호에 대한 교육 및 홍보 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="7" /> 저작권 보호 관련 법규 강화 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="8" /> 기술적 보호조치 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="9" /> 정품 콘텐츠의 가격 인하 </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="10" /> 이용 가능한 정품 콘텐츠 확대 (콘텐츠 확보, 이용 경로 확대 등) </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="11" /> 기타 (<input type="text" name="rQ3Etc"/>) </td>
			</tr>
			
			<tr>
				<td class="qTd" colspan="2">R_Q4. 귀하의 저작권에 대한 인식 및 준수 수준은 어느 정도라고 생각하십니까?</td>
			</tr>
		</table>
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('2');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section3">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">진로/취업<br/>탐색영역</td>
				<td>
					<font style="font-weight:bold;">진로탐색을 위한 외부전문가 초청특강</font><br/>(진로탐색 시간을 활용, 총 7회 실시)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3c" value="1" onclick="showHiddenTb('3');"/></td>
				<td class="radioTd"><input type="radio" name="q3c" value="2" onclick="hideHiddenTb('3');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q3k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q3k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q3k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q3k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q3m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q3m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q3m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q3m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('3');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section4">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">진로/취업<br/>탐색영역</td>
				<td>
					<font style="font-weight:bold;">진로 및 취업정보 공유캠프</font><br/>(14개 기관 전문가들을 통한 진로, 취업정보 공유)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q4c" value="1" onclick="showHiddenTb('4');"/></td>
				<td class="radioTd"><input type="radio" name="q4c" value="2" onclick="hideHiddenTb('4');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q4k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q4k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q4k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q4k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q4k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q4m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q4m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q4m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q4m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q4m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('4');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section5">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">진로/취업<br/>탐색영역</td>
				<td>
					<font style="font-weight:bold;">하계/동계방학 산업체 인턴쉽 프로그램</font><br/>(4주 과정, 인턴십 참여 지원금지급)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q5c" value="1" onclick="showHiddenTb('5');"/></td>
				<td class="radioTd"><input type="radio" name="q5c" value="2" onclick="hideHiddenTb('5');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q5k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q5k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q5k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q5k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q5k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q5m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q5m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q5m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q5m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q5m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('5');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section6">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">진로/취업<br/>탐색영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">산업체 인턴십 확대를 위한 산학연 협력 협약 체결</font><br/>: 2017년도 2개 기관 MOU 체결 완료<br/>- (주)그린이펙트솔루션<br/>- (주)원트리즈뮤직
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q6c" value="1" onclick="showHiddenTb('6');"/></td>
				<td class="radioTd"><input type="radio" name="q6c" value="2" onclick="hideHiddenTb('6');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q6k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q6k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q6k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q6k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q6k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q6m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q6m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q6m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q6m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q6m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q6Etc" rows="5" style="width:99%;font-size:14px;" placeholder="진로/취업 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('6');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section7">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공특성화<br/>영역</td>
				<td>
					<font style="font-weight:bold;">특성화 관련 팀 프로젝트 과제 수행</font><br/>(1,2학기에 8개 팀 프로젝트 운영)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q7c" value="1" onclick="showHiddenTb('7');"/></td>
				<td class="radioTd"><input type="radio" name="q7c" value="2" onclick="hideHiddenTb('7');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q7k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q7k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q7k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q7k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q7k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q7m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q7m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q7m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q7m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q7m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('7');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section8">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공특성화<br/>영역</td>
				<td>
					<font style="font-weight:bold;">정보공유 및 LOD캠프 개최 – 4학년 대상</font><br/>(도서관 빅데이터 기반의 의사결정 과학화와 자동화)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q8c" value="1" onclick="showHiddenTb('8');"/></td>
				<td class="radioTd"><input type="radio" name="q8c" value="2" onclick="hideHiddenTb('8');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q8k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q8k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q8k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q8k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q8k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q8m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q8m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q8m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q8m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q8m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('8');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section9">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공특성화<br/>영역</td>
				<td>
					<font style="font-weight:bold;">국내 기관 견학 프로그램 운영</font><br/>(세종국립도서관, 대통령기록관, 국립중앙도서관, 제천기적의도서관, 국립한글박물관, 합천해인사)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q9c" value="1" onclick="showHiddenTb('9');"/></td>
				<td class="radioTd"><input type="radio" name="q9c" value="2" onclick="hideHiddenTb('9');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q9k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q9k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q9k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q9k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q9k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q9m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q9m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q9m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q9m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q9m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('9');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section10">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공특성화<br/>영역</td>
				<td>
					<font style="font-weight:bold;">국외 기관 견학 프로그램</font><br/>(대만 기관 연수 체험)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q10c" value="1" onclick="showHiddenTb('10');"/></td>
				<td class="radioTd"><input type="radio" name="q10c" value="2" onclick="hideHiddenTb('10');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q10k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q10k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q10k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q10k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q10k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q10m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q10m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q10m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q10m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q10m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('10');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section11">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공특성화<br/>영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">특성화 역량 개발을 위한 특성화동아리 운영</font><br/>(마따호세프, 도약)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q11c" value="1" onclick="showHiddenTb('11');"/></td>
				<td class="radioTd"><input type="radio" name="q11c" value="2" onclick="hideHiddenTb('11');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q11k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q11k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q11k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q11k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q11k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q11m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q11m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q11m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q11m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q11m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q11Etc" rows="5" style="width:99%;font-size:14px;" placeholder="전공특성화 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('11');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section12">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">학생활동<br/>영역</td>
				<td>
					<font style="font-weight:bold;">선후배간의 소통 및 전공학습 멘토링</font><br/>(멘토1인, 멘티6인으로 구성, 멘토 장학금 지급)<br/>(1학기에 4팀, 2학기 4팀 총 8팀 운영)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q12c" value="1" onclick="showHiddenTb('12');"/></td>
				<td class="radioTd"><input type="radio" name="q12c" value="2" onclick="hideHiddenTb('12');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q12k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q12k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q12k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q12k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q12k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q12m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q12m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q12m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q12m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q12m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('12');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section13">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">학생활동<br/>영역</td>
				<td>
					<font style="font-weight:bold;">자체학습모임 활동</font><br/>(4개의 팀으로 자발적인 학습모임 진행)<br/>(E-PLUS, LOC, LST, 한국사스터디)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q13c" value="1" onclick="showHiddenTb('13');"/></td>
				<td class="radioTd"><input type="radio" name="q13c" value="2" onclick="hideHiddenTb('13');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q13k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q13k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q13k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q13k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q13k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q13m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q13m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q13m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q13m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q13m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('13');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section14">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">학생활동<br/>영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">사회실천 봉사활동</font><br/>(책마루 도서관, 지방자치인재개발원 도서관, 개골개골 도서관, 독서문화한마당)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q14c" value="1" onclick="showHiddenTb('14');"/></td>
				<td class="radioTd"><input type="radio" name="q14c" value="2" onclick="hideHiddenTb('14');"/></td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q14k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q14k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q14k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q14k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q14k" value="5"/></td>
			</tr>
		</table>
		<table id="hiddenTb" style="padding:2px;border:1px solid #000000;width:100%;display:none;">
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q14m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q14m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q14m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q14m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q14m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q14Etc" rows="5" style="width:99%;font-size:14px;" placeholder="학생활동 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('14');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section15">
		<h4 class="cate">■ 교육환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공실습<br/>환경개선</td>
				<td>
					<font style="font-weight:bold;">-학과 전용 전공실습실(407호)구축 및 체계적 운영<br/>-실습실 TV모니터 2대 확충, 프린터기 1대 등(2017년도 신설)</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q15k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q15k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q15k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q15k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q15k" value="5"/></td>
			</tr>

			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q15m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q15m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q15m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q15m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q15m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('15');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section16">
		<h4 class="cate">■ 교육 환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">전공실습<br/>환경개선</td>
				<td colspan="2">
					<font style="font-weight:bold;">-도서관자동화프로그램을 활용한 실습환경 마련 및 운영<br/>※ LAS는 도서관자동화시스템으로 사서들이 도서관 업무를 할 때 사용하는 소프트웨어임. 2017년도에 도입함으로써 전공교과과정 중 도서관업무관련 실습환경을 강화함</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q16k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q16k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q16k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q16k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q16k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q16m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q16m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q16m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q16m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q16m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q16Etc" rows="5" style="width:99%;font-size:14px;" placeholder="전공실습환경 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('16');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section17">
		<h4 class="cate">■ 교육환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">행정지원</td>
				<td>
					<font style="font-weight:bold;">특성화 사업 행정지원 전담인력 운영</font><br/>(전담직원 1명, 전담조교 1명)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q17k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q17k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q17k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q17k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q17k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q17m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q17m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q17m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q17m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q17m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('17');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section18">
		<h4 class="cate">■ 교육 환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">행정지원</td>
				<td colspan="2">
					<font style="font-weight:bold;">근로 장학생 운영을 통한 행정지원 및 실습(2명)</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q18k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q18k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q18k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q18k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q18k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q18m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q18m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q18m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q18m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q18m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q18Etc" rows="5" style="width:99%;font-size:14px;" placeholder="행정지원 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('18');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section19">
		<h4 class="cate">■ 교육환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">재정지원</td>
				<td>
					<font style="font-weight:bold;">특성화동아리/자체학습동아리/전공학습멘토링/팀프로젝트/사회봉사실천활동 등에 대한 운영비 지원</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q19k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q19k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q19k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q19k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q19k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q19m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q19m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q19m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q19m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q19m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('19');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section20">
		<h4 class="cate">■ 교육 환경 개선 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">재정지원</td>
				<td colspan="2">
					<font style="font-weight:bold;">국내외 견학 및 체험프로그램 운영비 지원</font><br/>(국외의 경우 대만 1인당 152만원)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q20k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q20k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q20k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q20k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q20k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q20m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q20m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q20m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q20m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q20m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q20Etc" rows="5" style="width:99%;font-size:14px;" placeholder="재정지원 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('20');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section21">
		<h4 class="cate">■ 홍보 및 만족도 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">홍보영역</td>
				<td>
					<font style="font-weight:bold;">특성화 교육프로그램 및 교육활동에 대한 학생 대상 공지 및 안내</font><br/>(게시판, 카카오톡, 홍보 리플릿 배포 등)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q21k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q21k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q21k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q21k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q21k" value="5"/></td>
			</tr>
		
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q21m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q21m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q21m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q21m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q21m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q21Etc" rows="5" style="width:99%;font-size:14px;" placeholder="홍보 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('21');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section22">
		<h4 class="cate">■ 홍보 및 만족도 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">만족도영역</td>
				<td>
					<font style="font-weight:bold;">세부 프로그램 종료할 때 마다 참여 학생의 만족도조사 실시</font><br/>(예 : 전문가초청특강 종료 후 학생 만족도 조사)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q22k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q22k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q22k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q22k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q22k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q22m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q22m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q22m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q22m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q22m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('22');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section23">
		<h4 class="cate">■ 홍보 및 만족도 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">만족도영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">특성화 종료 시 학과 전체 학생의 만족도 조사 실시</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q23k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q23k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q23k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q23k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q23k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q23m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q23m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q23m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q23m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q23m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q23Etc" rows="5" style="width:99%;font-size:14px;" placeholder="만족도 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('23');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section24">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">평가영역</td>
				<td>
					<font style="font-weight:bold;">참여 프로그램 종료 시 결과보고서 작성 및 제출</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q24k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q24k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q24k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q24k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q24k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q24m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q24m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q24m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q24m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q24m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('24');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section25">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">평가영역</td>
				<td>
					<font style="font-weight:bold;">학기말에 프로그램별 지도교수가 진행하는 자체평가회 진행</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q25k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q25k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q25k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q25k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q25k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q25m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q25m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q25m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q25m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q25m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('25');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section26">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">평가영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">매년 말에 4가지 핵심역량 평가를 통한 LIStar 포인트 부여 : 글로벌 역량, 산업실무역량, 전공역량, 융합소통역량</font>
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q26k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q26k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q26k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q26k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q26k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q26m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q26m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q26m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q26m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q26m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q26Etc" rows="5" style="width:99%;font-size:14px;" placeholder="평가 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('26');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section27">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">장학영역</td>
				<td>
					<font style="font-weight:bold;">LIStar 포인트 합산하여 우수 장학금 지급</font><br/>(LIStar 포인트 상위 22명에게 지급)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q27k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q27k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q27k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q27k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q27k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q27m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q27m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q27m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q27m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q27m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('27');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section28">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">장학영역</td>
				<td>
					<font style="font-weight:bold;">팀 프로젝트 성과달성 장학금 지급</font><br/>(매 학기 팀 프로젝트 참여 학생에 한하여, 수행결과를 평가하여 우수 장학금 지급)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q28k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q28k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q28k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q28k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q28k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q28m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q28m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q28m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q28m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q28m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('28');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section29">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">장학영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">전공학습 멘토링 장학금 지급</font><br/>(매 학기 멘토링 운영 멘토 4명에 대하여 격려 장학금 지급)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q29k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q29k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q29k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q29k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q29k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q29m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q29m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q29m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q29m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q29m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('29');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section30">
		<h4 class="cate">■ 평가 및 장학금 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">장학영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">근로 장학생 장학금 지급</font><br/>(매 학기 사무실 및 실습실 관리, 행정보조 업무 1명)
				</td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th colspan="5">기대도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q30k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q30k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q30k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q30k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q30k" value="5"/></td>
			</tr>
			<tr>
				<th colspan="5">만족도</th>
			</tr>
			<tr>
				<th>1점</th>
				<th>2점</th>
				<th>3점</th>
				<th>4점</th>
				<th>5점</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q30m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q30m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q30m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q30m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q30m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q30Etc" rows="5" style="width:99%;font-size:14px;" placeholder="장학 분야에 불만족했다면 그 이유와 개선방안을 기술해 주세요."></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('30');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
	
	<div style="width:100%;display:none;" id="section31">
		<h4 class="cate">■ 2018년도 학과 특성화 프로그램으로 진행하면 좋겠다는 아이디어가 있으면 자유롭게 기술해 주십시오.</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea id="q31Etc" rows="5" style="width:99%;font-size:14px;"></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('31');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>	
	</div>

	<div style="width:100%;display:none;" id="section32">
		<h4 style="text-align:center;background-color:#F2CB61;;">■ 설문에 응해주셔서 감사합니다.</h4>
		<br/><br/><br/>
		
		<!-- <button type="button" onclick="javascript:window.open('','_self').close();">창닫기</button> -->
	</div>
</div>
</body>
</html>