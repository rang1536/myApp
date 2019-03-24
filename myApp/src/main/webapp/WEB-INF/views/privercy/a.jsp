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

	// 설문응답 시작
	function start(){
		$('#intro').css('display','none');
		$('#section1').slideDown();
	}
	
	function next(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		
		if(nowPageNum == 1){
			if(partICheck()){
				
				$.ajax({
					url : 'addSuv2019',
					data : $('#demographyForm').serialize(),
					dataType : 'json',
					type : 'post',
					success : function(data){
						
					}
				})
				$('#'+nowTag).css('display','none');
				$('#'+nextTag).slideDown();
			}	
		}else{
			$('#'+nowTag).css('display','none');
			$('#'+nextTag).slideDown();
		}
	
	}		
	
	//Demography 유효성검사
	function partICheck(){
		if(!$('input:radio[name="dQ1"]').is(':checked')){
			alert('성별을 선택하세요');
			return false;
		}
		
		if($('input:text[name="dQ2"]').val() == null || $('input:text[name="dQ2"]').val() == ''){
			alert('나이를 입력하세요');
			return false;
		}else{
			if($('input:text[name="dQ2"]').val() < 13 || $('input:text[name="dQ2"]').val() > 69){
				alert('13세 ~ 69세 만 응답을 하실수 있습니다\n감사합니다');
				return false;
			}
		}
		
		if(!$('input:radio[name="dQ3"]').is(':checked')){
			alert('거주지를 선택하세요');
			return false;
		} 
		
		if(!$('input:radio[name="dQ4"]').is(':checked')){
			alert('직업을 선택하세요');
			return false;
		}else{
			if($('input:radio[name="dQ4"]:checked').val() == '6'){
				if($('input:text[name="dQ4Etc"]').val() == null || $('input:text[name="dQ4Etc"]').val() == ''){
					alert('기타 직업을 입력해주세요');
					return false;
				}	
			}
		}
		
		if($('input:text[name="dQ5"]').val() == null || $('input:text[name="dQ5"]').val() == ''){
			alert('동거 가족수를 입력하세요');
			return false;
		}
		
		if($('input:text[name="dQ6"]').val() == null || $('input:text[name="dQ6"]').val() == ''){
			alert('한 달 평균 수입을 입력하세요');
			return false;
		}
		
		if($('input:text[name="dQ7"]').val() == null || $('input:text[name="dQ7"]').val() == ''){
			alert('동거 가족의 한 달 평균 수입을 입력하세요');
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">해외 저작권 실태 조사 설문</h2>
	
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
		
		<form id="demographyForm">
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
					<td class="aTd" colspan="2">만 <input type="text" name="dQ2"/> 세</td>
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
					<td class="aTd" colspan="2">총 <input type="text" name="dQ5"/> 명</td>
				</tr>
				<tr>
					<td class="qTd">D_Q6. [개인소득] 귀하의 한 달 평균 수입은 대략 어느 정도 입니까?</td>
					<td class="aTd" colspan="2"> <input type="text" name="dQ6"/> </td>
				</tr>
				<tr>
					<td class="qTd">D_Q7. [가구소득] 현재 함께 살고 있는 가족 모두의 한 달 평균 총 수입은 어느 정도입니까?</td>
					<td class="aTd" colspan="2"> <input type="text" name="dQ7"/> </td>
				</tr>
				
			</table>
			<br/><br/>
			<div style="text-align:center;">
				<button type="button" onclick="next('1');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
			</div>
		</form>
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
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th rowspan="2" style="width:9%;background-color:#ddd;">구분</th>
				<th style="width:9%;background-color:#ddd;">매우낮음</th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;">보통</th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;"></th>
				<th style="width:9%;background-color:#ddd;">매우높음</th>
			</tr>
			<tr>
				<th style="background-color:#ddd;">1</th>
				<th style="background-color:#ddd;">2</th>
				<th style="background-color:#ddd;">3</th>
				<th style="background-color:#ddd;">4</th>
				<th style="background-color:#ddd;">5</th>
				<th style="background-color:#ddd;">6</th>
				<th style="background-color:#ddd;">7</th>
				<th style="background-color:#ddd;">8</th>
				<th style="background-color:#ddd;">9</th>
				<th style="background-color:#ddd;">10</th>
			</tr>
			<tr>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;">인식수준</td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="1"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="2"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="3"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="4"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="5"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="6"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="7"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="8"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="9"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ41" value="10"/></td>
			</tr>
			<tr>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;">준수수준</td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="1"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="2"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="3"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="4"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="5"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="6"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="7"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="8"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="9"/></td>
				<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><input type="radio" name="rQ42" value="10"/></td>
			</tr>
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<td class="qTd" style="width:50%;">R_Q5. 귀하께서는 저작권 보호와 관련된 교육, 정보, 홍보물을 경험이 있습니까?</td>
				<td class="aTd" style="text-align:center;height:20px;width:25%;"><input type="radio" name="rQ5" value="1" /> 있다</td>
				<td class="aTd" style="text-align:center;height:20px;width:25%;"><input type="radio" name="rQ5" value="2" /> 없다</td>
			</tr>		
		</table>
		
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('2');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section3">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part III.</font> 한국 콘텐츠 장르, 유통경로별 이용 실태
		</p>
		<div style="width:100%;padding:1%;">
			<p style="width:90%;border:1px solid #000000;padding:1%;">
				* 용어설명<br/>
				입수 - 다운로드 등에 의해 콘텐츠 파일을 자신의 단말기에 다운로드 하거나 복사하는 행위, 패키지를 구입하는 행위<br/>
				시청 - 스트리밍 등을 통해 파일을 입수하지 않고 열람하는 행위<br/>
				유료 - 정품 콘텐츠를 정가를 지불하고 구입한 경우<br/>
				무료 - 유료 콘텐츠를 무료로 이용했거나 정가에 비해 낮은 가격으로 이용한 경우
			</p>
		</div>
		
		<table style="width:100%;border:1px solid #ddd;">
			<!-- <tr>
				<th style="background-color:#ddd;" colspan="3">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr> -->
			<tr>
				<td class="qTd" colspan="6">K_Q1. 최근 3개월 동안 한국의 영화, 방송, 음악, 게임, 웹툰의 콘텐츠를 인터넷이나 휴대전화, 매장을 통해 입수·시청한 경험 유무와 입수·시청 건수를 적어주세요.</td>
			</tr>
			<tr>
				<th rowspan="2" colspan="2" style="width:20%;background-color:#ddd;">장르</th>
				<th colspan="2" style="background-color:#ddd;">입수</th>
				<th colspan="2" style="background-color:#ddd;">시청(플레이)</th>
			</tr>
			<tr>
				<th style="width:12%;background-color:#ddd;">경험</th>
				<th style="width:12%;background-color:#ddd;">건수</th>
				<th style="width:12%;background-color:#ddd;">경험</th>
				<th style="width:12%;background-color:#ddd;">건수</th>
			</tr>
			<tr>
				<td class="aTd" colspan="2">영화</td>
				<td class="aTd" style="width:20%;text-align:center;">
					<input type="radio" name="kQ11" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ11" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ11Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ12" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ12" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ12Etc" style="width:70%;"/> 건 </td>
			</tr>
			<tr>
				<td class="aTd" colspan="2">방송</td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ21" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ21" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ21Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ22" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ22" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ22Etc" style="width:70%;"/> 건 </td>
			</tr>
			<tr>
				<td class="aTd" colspan="2">음악</td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ31" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ31" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ31Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ32" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ32" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ32Etc" style="width:70%;"/> 건 </td>
			</tr>
			<tr>
				<td class="aTd" style="width:10%;" rowspan="2">게임</td>
				<td class="aTd" style="width:20%;">온라인</td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ41" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ41" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ41Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ42" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ42" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ42Etc" style="width:70%;"/> 건 </td>
			</tr>
			<tr>
				<td class="aTd" style="width:20%;">비온라인</td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ51" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ51" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ51Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ52" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ52" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ52Etc" style="width:70%;"/> 건 </td>
			</tr>
			<tr>
				<td class="aTd" colspan="2">웹툰</td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ61" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ61" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ61Etc" style="width:70%;"/> 건 </td>
				<td class="aTd" style="width:20%;">
					<input type="radio" name="kQ62" value="1"/> 있다&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="kQ62" value="2"/> 없다
				</td>
				<td class="aTd" style="width:10%;"><input type="text" name="kQ62Etc" style="width:70%;"/> 건 </td>
			</tr>
		</table>
		
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('3');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section4">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> 영화(애니메이션 포함)
		</p>
		
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq1-1 -->
			<tr>
				<td class="qTd">C_Q1. 귀하께서 입수·시청하는 모든 영화 중에서 한국 영화가 차지하는 비율은 어느 정도입니까?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ11"/> %</td>
			</tr>
			
			<!-- cq1-2 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q2. 귀하께서 이용하시는 한국 영화는 주로 어떤 장르입니까?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="1"/> 어드벤처</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="2"/> 애니메이션</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="3"/> 스릴러</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="4"/> 전쟁</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="5"/> SF</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="6"/> 코미디</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="7"/> 멜로/로맨스</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="8"/> 공포(호러)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="9"/> 액션</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="10"/> 사극</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="11"/> 범죄</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="12"/> 뮤지컬</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="13"/> 판타지</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="14"/> 미스터리</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="15"/> 기타</td>
			</tr>
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq1-3 -->
			<tr>
				<td class="qTd" colspan="5">C_Q3. 최근3개월 동안 한국 영화를 무료 입수 및 시청 건수와 유료 입수 및 시청 건수를 적어주시기 바랍니다.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">무료</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">유료</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
				<th class="aTd" style="background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">온라인<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">특정 사업자·운영자에 의한 콘텐츠 배포</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A11" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">동영상 공유 사이트를 통해 유통 (Youtube 등)</td>
				<td class="aTd"><input type="text" name="cQ13A21" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">링크 사이트 / 리치 사이트를 통해 유통</td>
				<td class="aTd"><input type="text" name="cQ13A31" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">P2P 사이트 / P2P 소트프웨어에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ13A41" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">스토리지 서비스에 의한 유통(파일공유 사이트 포함)</td>
				<td class="aTd"><input type="text" name="cQ13A51" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">이메일이나 메신저 등을 통한 지인 간의 유통</td>
				<td class="aTd"><input type="text" name="cQ13A61" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">앱에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ13A71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ13A74" style="width:70%;"/> 건</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">패키지<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">실제 매장에서의 패키지 판매</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13B13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">잡지나 TV 등에 의한 패키지의 통신 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B23" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">인터넷을 통한 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B33" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">경매 등에 의한 패키지 유통</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B43" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd"><input type="text" name="cQ13B51" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B53" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">이벤트 행사장에서의 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B63" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">패키지 렌탈</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B73" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">지인 사이의 패키지 유통</td>
				<td class="aTd"><input type="text" name="cQ13B81" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B83" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="5" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV·<br/>영화</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">지상파 TV방송 시청</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13C12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13C14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">위성 TV 방송 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C22" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">케이블 TV 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C32" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">영화관에서 감상</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">노래방 기계 이용</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C52" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C54" style="width:70%;"/> 건</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq1-4 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 영화를 유료로 입수·시청하기 위해 지불한 비용은 어느 정도입니까?</td>
				<td class="aTd" colspan="2"><input type="text" name="cQ14"/> </td>
			</tr>
			
			<!-- cq1-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. 귀하께서 무료 한국 영화를 입수하기 위해 C_Q3 문항에 응답하신 경로를 가장 자주 사용하시는 이유는 무엇입니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="1"/> 접근 및 사용이 용이해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="2"/> 계속 사용하던 곳으로 익숙해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="3"/> 바이러스 감염으로부터 안전해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="4"/> 다른 경로에 비해 자료가 풍부해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="5"/> 경로차단 또는 폐쇄가 안 될 것 같아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="6"/> 다른경로를 몰라서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="7"/> 불편하지만 광고만 보면 되므로</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="8"/> 기타(<input type="text" name="cQ15Etc"/>)</td>
			</tr>
			
			<!-- cq1-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. 귀하께서는 어떤 경로를 통해 무료 한국 영화에 대한 정보를 알게 되셨나요?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="1"/> 콘텐츠 홀더의 웹사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="2"/> 뉴스 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="3"/> 콘텐츠를 입수하고 있는 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="4"/> TV·라디오</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="5"/> 입소문(리뷰)</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="6"/> 카페, 블로그, SNS</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="7"/> 친구나 동료 등 지인을 통해</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="8"/> 기타(<input type="text" name="cQ16Etc"/>)</td>
			</tr>
			
			<!-- cq1-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. 무료 한국 영화를 입수(복사 또는 다운로드) 또는 시청하는 경우, 사용하는 단말기는 무엇입니까? 해당되는 모든 장비를 선택해주세요</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="8"/> 기타<br/>(<input type="text" name="cQ17Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="9"/> 인터넷에서 구매 (스트리밍 또는 패키지 구매에 한함)</td>
			</tr>
			
			<!-- cq1-8 -->
			<tr>
				<td class="qTd" rowspan="10">C_Q8. 귀하께서 무료 한국 영화를 이용하시는 이유는 무엇입니까? 모두 선택해주세요</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="1"/> 저렴하거나 무료이기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="2"/> 유료 콘텐츠를 결제해서 이용할 만 한 가치가 있다고 생각하지 않아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="3"/> 원하는 콘텐츠를 이용할 수 있는 방법이 무료 콘텐츠 이용밖에 없어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="4"/> 유료 콘텐츠보다 이용하기 편해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="5"/> 무료 콘텐츠 이용이 심각한 일이 아니라고 생각해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="6"/> 많은 사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="7"/> ITEM당 콘텐츠를 스트리밍 하거나 다운로드 할 수 있기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="8"/> 유료 콘텐츠보다 더 빨리 이용할 수 있어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="9"/> 계속 사용해 왔기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="10"/> 기타(<input type="text" name="cQ18Etc"/>)</td>
			</tr>
			
			<!-- cq1-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. 한국 영화를 입수·시청하는 경우 정품 또는 불법 복제판이라고 의식합니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq1-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">C_Q9_1. 정품 또는 불법 복제판 여부가 입수·시청에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="1"/> 입수·시청에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="2"/> 정품이 있으면 정품을 입수·시청하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 입수·시청한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="3"/> 정품만 입수·시청 한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="4"/> 정품은 비싸기 때문에 불법 복제판만 입수한다</td>
			</tr>
			
			<!-- cq1-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. 한국의 권리자가 한국 영화를 합법적으로 인터넷에서 입수·시청할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="3"/> 음성이 원래 콘텐츠 제작국의 언어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="4"/> 조사대상국 자막이 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="5"/> 영어 자막이 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="6"/> 콘텐츠 제작국 방송이나 극장 개봉과 거의 같은 시기에 입수·시청 할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="7"/> HD 품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="8"/> 다운로드 가능한지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="9"/> 콘텐츠의 시간(용량)에 따라 가격이 설정되는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="10"/> 한국의 콘텐츠가 같은 사이트에서 많이 정리되어 배포되는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="11"/> 입수·시청하고 싶은 콘텐츠를 쉽게 찾을 수 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="12"/> 특별히 조건 없음</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="13"/> 특별히 정품을 원하지 않음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="14"/> 기타(<input type="text" name="cQ110Etc"/>)</td>
			</tr>
			
			<!-- cq1-11 -->
			<tr>
				<td class="qTd">C_Q11. 위의 질문 <font style="color:#blue">C_Q10]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 영화를 합법적으로 인터넷에서 입수·시청할 수 있게 한 경우 콘텐츠 1건 당 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ111" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
			<!-- cq1-12 -->
			<tr>
				<td class="qTd">C_Q12. 귀하께서는 자신 이외의 다른 사람에게 자신의 무료 한국 영화를 공유하거나, 또는 경로를 재공유 하신 경험이 있습니까?(둘 중 하나라도 경험이 있다면 '있다' 로 답해주세요)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ112" value="1"/> 있다</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ112" value="2"/> 없다</td>
			</tr>
			
			<!-- cq1-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_1. 귀하께서는 무료 한국 영화를 어떤 경로를 통해 공유하셨습니까? 모두 선택해주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="1"/> USB, CD, DVD 등 오프라인</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="2"/> 카페, 블로그 등에 업로드</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="3"/> SNS(Facebook, Twitter, Instagram 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="4"/> 토렌트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="5"/> P2P 또는 웹하드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="6"/> 개인적인 공유(이메일, 카카오톡 등)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="7"/> 클라우드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="8"/> 기타(<input type="text" name="cQ1121Etc"/>)</td>
			</tr>
			
			<!-- cq1-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_2. 귀하께서 무료 한국 영화를 공유하신 이유를 모두 선택해 주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="1"/> 가족 및 친구 등 지인이 무료 콘텐츠에 접근 방법을 몰라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="2"/> 많은사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="3"/> 금전적인 수익을 얻기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="4"/> 불특정 다수에게 공유하기 위해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="5"/> 더 많은 무료 콘텐츠를 이용하기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="6"/> 요청이 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="7"/> 특별한 이유는 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="8"/> 기타(<input type="text" name="cQ1122Etc"/>)</td>
			</tr>
			
			<!-- cq1-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. 귀하께서 무료 한국 영화를 이용하시는 경로가 차단 또는 폐쇄될 경우 어떻게 하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="1"/> 콘텐츠 이용 자체를 포기한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="2"/> 유료 콘텐츠를 이용한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="3"/> 무료로 이용할 수 있는 다른 경로를 찾는다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="4"/> 기존 경로를 우회할수 있는 방법을 찾는다</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="5"/> 기타(<input type="text" name="cQ113Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq1-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. 귀하께서는 올해(2019년)의 무료 한국 영화 이용이 전년도(2018년)와 비교하여 증가하셨습니까 또는 감소하였습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="1"/> (<input type="text" name="cQ1141"/> %) 증가</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="2"/> (<input type="text" name="cQ1142"/> %) 감소</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="3"/> 변화없다</td>
			</tr>
			
			<!-- cq1-15 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. 귀하께서 전년과 비교하여 무료 한국 영화 이용이 증가한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="1"/> 유료 콘텐츠의 가격이 너무 올라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="2"/> 무료 콘텐츠 가격이 예년보다 더 낮아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="3"/> 이용 가능한 무료 콘텐츠의 양이 예년보다 더 많아져서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="4"/> 무료 콘텐츠를 이용할 수 있는 경로가 많아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="5"/> 전체적인 콘텐츠 소비가 증가해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="6"/> 무료 콘텐츠 이용이 편리해서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="7"/> 기타(<input type="text" name="cQ115Etc"/>)</td>				
			</tr>
			
			<!-- cq1-16 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. 귀하께서 전년과 비교하여 무료 한국 영화 이용이 감소한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="1"/> 단속으로 인한 이용 가능한 무료 콘텐츠나 경로가 줄어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="2"/> 유료 콘텐츠의 가격이 적정해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="3"/> 저작권을 지켜야 한다는 홍보 캠페인, 뉴스기사 등을 보고 유료 콘텐츠 구매의사가 늘어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="4"/> 저작권 침해로 인한 소송, 해킹, 바이러스 감염 등의 문제가 생길까봐</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="5"/> 콘텐츠 이용 자체가 감소</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="6"/> 양심적인 결정에 따라 유료 콘텐츠의 이용횟수를 늘려서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="7"/> 기타(<input type="text" name="cQ116Etc"/>)</td>				
			</tr>
			
			<!-- cq1-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. 귀하께서는 어떤 상황이 되면 무료 한국 영화 이용을 중단하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="1"/> 유료 콘텐츠 및 서비스의 가격 인하</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="2"/> 전체적인 무료 콘텐츠의 감소</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="3"/> 무료 콘텐츠 이용자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="4"/> 저작권 보호에 대한 교육 및 홍보를 통한 인식 개선</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="5"/> 유료 콘텐츠와 무료 콘텐츠의 명확한 구분</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="6"/> 바이러스 감염, 신용카드 해킹 등으로 인한 개인적인 피해</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="7"/> 무료 콘텐츠 공급자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="8"/> 이용 가능한 유료 콘텐츠의 양 확보</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="9"/> 유료 콘텐츠의 이용 편리성 제고(접근성, 결제 방식, 로그인 간편화 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="10"/> 기타(<input type="text" name="cQ117Etc"/>)</td>				
			</tr>
			
			<!-- cq1-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. 귀하께서는 무료 한국 영화를 이용 또는 구입하는 주위 사람들을 볼 때 어떤 행동을 하고 계십니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="1"/> 무료 콘텐츠와 관련된 정보를 공유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="2"/> 무료 콘텐츠 이용을 저지한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="3"/> 유료 콘텐츠 이용을 권유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="4"/> 특별한 행동을 하지는 않는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="5"/> 기타(<input type="text" name="cQ118Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('4');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section5">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> 방송(TV 드라마, 버라이어티, 다큐멘터리 등)
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq2-1 -->
			<tr>
				<td class="qTd">C_Q1. 귀하께서 입수·시청하는 모든 방송 중에서 한국 방송이 차지하는 비율은 어느 정도입니까?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ21"/> %</td>
			</tr>
			
			<!-- cq2-2 -->
			<tr>
				<td class="qTd" rowspan="2">C_Q2. 귀하께서 이용하시는 한국 방송은 주로 어떤 장르입니까?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="1"/> 드라마</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="2"/> 예능</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="3"/> 애니메이션</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="4"/> 교양/다큐멘터리</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="5"/> 음악</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="6"/> 기타<br/>(<input type="text" name="cQ22Etc" style="width:70%;"/>)</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq2-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. 최근3개월 동안 한국 방송(TV 드라마, 버라이어티, 다큐멘터리 등)를 무료 입수 및 시청 건수와 유료 입수 및 시청 건수를 적어주시기 바랍니다.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">무료</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">유료</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
				<th class="aTd" style="background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">온라인<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">특정 사업자·운영자에 의한 콘텐츠 배포</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A11" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">동영상 공유 사이트를 통해 유통 (Youtube 등)</td>
				<td class="aTd"><input type="text" name="cQ23A21" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">링크 사이트 / 리치 사이트를 통해 유통</td>
				<td class="aTd"><input type="text" name="cQ23A31" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">P2P 사이트 / P2P 소트프웨어에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ23A41" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">스토리지 서비스에 의한 유통(파일공유 사이트 포함)</td>
				<td class="aTd"><input type="text" name="cQ23A51" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">이메일이나 메신저 등을 통한 지인 간의 유통</td>
				<td class="aTd"><input type="text" name="cQ23A61" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">앱에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ23A71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ23A74" style="width:70%;"/> 건</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">패키지<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">실제 매장에서의 패키지 판매</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23B13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">잡지나 TV 등에 의한 패키지의 통신 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B23" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">인터넷을 통한 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B33" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">경매 등에 의한 패키지 유통</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B43" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd"><input type="text" name="cQ23B51" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B53" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">이벤트 행사장에서의 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B63" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">패키지 렌탈</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B73" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">지인 사이의 패키지 유통</td>
				<td class="aTd"><input type="text" name="cQ23B81" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B83" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="5" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV·<br/>영화</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">지상파 TV방송 시청</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23C12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23C14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">위성 TV 방송 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C22" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">케이블 TV 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C32" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">영화관에서 감상</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">노래방 기계 이용</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C52" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C54" style="width:70%;"/> 건</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq2-4 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 방송을 유료로 입수·시청하기 위해 지불한 비용은 어느 정도입니까?</td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ24"/> )</td>
			</tr>
			
			<!-- cq2-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. 귀하께서 무료 한국 방송을 입수하기 위해 C_Q3 문항에 응답하신 경로를 가장 자주 사용하시는 이유는 무엇입니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="1"/> 접근 및 사용이 용이해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="2"/> 계속 사용하던 곳으로 익숙해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="3"/> 바이러스 감염으로부터 안전해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="4"/> 다른 경로에 비해 자료가 풍부해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="5"/> 경로차단 또는 폐쇄가 안 될 것 같아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="6"/> 다른경로를 몰라서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="7"/> 불편하지만 광고만 보면 되므로</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="8"/> 기타(<input type="text" name="cQ25Etc"/>)</td>
			</tr>
			
			<!-- cq2-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. 귀하께서는 어떤 경로를 통해 무료 한국 방송에 대한 정보를 알게 되셨나요?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="1"/> 콘텐츠 홀더의 웹사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="2"/> 뉴스 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="3"/> 콘텐츠를 입수하고 있는 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="4"/> TV·라디오</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="5"/> 입소문(리뷰)</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="6"/> 카페, 블로그, SNS</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="7"/> 친구나 동료 등 지인을 통해</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="8"/> 기타(<input type="text" name="cQ26Etc"/>)</td>
			</tr>
			
			<!-- cq2-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. 무료 한국 방송을 입수(복사 또는 다운로드) 또는 시청하는 경우, 사용하는 단말기는 무엇입니까? 해당되는 모든 장비를 선택해주세요</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="8"/> 기타<br/>(<input type="text" name="cQ27Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="9"/> 인터넷에서 구매 (스트리밍 또는 패키지 구매에 한함)</td>
			</tr>
			
			<!-- cq2-8 -->
			<tr>
				<td class="qTd" rowspan="10">C_Q8. 귀하께서 무료 한국 방송을 이용하시는 이유는 무엇입니까? 모두 선택해주세요</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="1"/> 저렴하거나 무료이기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="2"/> 유료 콘텐츠를 결제해서 이용할 만 한 가치가 있다고 생각하지 않아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="3"/> 원하는 콘텐츠를 이용할 수 있는 방법이 무료 콘텐츠 이용밖에 없어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="4"/> 유료 콘텐츠보다 이용하기 편해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="5"/> 무료 콘텐츠 이용이 심각한 일이 아니라고 생각해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="6"/> 많은 사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="7"/> ITEM당 콘텐츠를 스트리밍 하거나 다운로드 할 수 있기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="8"/> 유료 콘텐츠보다 더 빨리 이용할 수 있어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="9"/> 계속 사용해 왔기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ28" value="10"/> 기타(<input type="text" name="cQ28Etc"/>)</td>
			</tr>
			
			<!-- cq2-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. 한국 방송을 입수·시청하는 경우 정품 또는 불법 복제판이라고 의식합니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq2-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">C_Q9_1. 정품 또는 불법 복제판 여부가 입수·시청에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="1"/> 입수·시청에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="2"/> 정품이 있으면 정품을 입수·시청하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 입수·시청한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="3"/> 정품만 입수·시청 한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="4"/> 정품은 비싸기 때문에 불법 복제판만 입수한다</td>
			</tr>
			
			<!-- cq2-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. 한국의 권리자가 한국 방송을 합법적으로 인터넷에서 입수·시청할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="3"/> 음성이 원래 콘텐츠 제작국의 언어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="4"/> 조사대상국 자막이 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="5"/> 영어 자막이 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="6"/> 콘텐츠 제작국 방송이나 극장 개봉과 거의 같은 시기에 입수·시청 할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="7"/> HD 품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="8"/> 다운로드 가능한지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="9"/> 콘텐츠의 시간(용량)에 따라 가격이 설정되는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="10"/> 한국의 콘텐츠가 같은 사이트에서 많이 정리되어 배포되는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="11"/> 입수·시청하고 싶은 콘텐츠를 쉽게 찾을 수 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="12"/> 특별히 조건 없음</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="13"/> 특별히 정품을 원하지 않음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="14"/> 기타(<input type="text" name="cQ110Etc"/>)</td>
			</tr>
			
			<!-- cq2-11 -->
			<tr>
				<td class="qTd">C_Q11. 위의 질문 <font style="color:#blue">C_Q10]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 방송을 합법적으로 인터넷에서 입수·시청할 수 있게 한 경우 콘텐츠 1건 당 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ211" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
			<!-- cq2-12 -->
			<tr>
				<td class="qTd">C_Q12. 귀하께서는 자신 이외의 다른 사람에게 자신의 무료 한국 방송을 공유하거나, 또는 경로를 재공유 하신 경험이 있습니까?(둘 중 하나라도 경험이 있다면 '있다' 로 답해주세요)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ212" value="1"/> 있다</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ212" value="2"/> 없다</td>
			</tr>
			
			<!-- cq2-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_1. 귀하께서는 무료 한국 방송을 어떤 경로를 통해 공유하셨습니까? 모두 선택해주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="1"/> USB, CD, DVD 등 오프라인</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="2"/> 카페, 블로그 등에 업로드</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="3"/> SNS(Facebook, Twitter, Instagram 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="4"/> 토렌트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="5"/> P2P 또는 웹하드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="6"/> 개인적인 공유(이메일, 카카오톡 등)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="7"/> 클라우드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="8"/> 기타(<input type="text" name="cQ2121Etc"/>)</td>
			</tr>
			
			<!-- cq2-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_2. 귀하께서 무료 한국 방송을 공유하신 이유를 모두 선택해 주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="1"/> 가족 및 친구 등 지인이 무료 콘텐츠에 접근 방법을 몰라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="2"/> 많은사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="3"/> 금전적인 수익을 얻기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="4"/> 불특정 다수에게 공유하기 위해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="5"/> 더 많은 무료 콘텐츠를 이용하기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="6"/> 요청이 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="7"/> 특별한 이유는 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="8"/> 기타(<input type="text" name="cQ2122Etc"/>)</td>
			</tr>
			
			<!-- cq2-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. 귀하께서 무료 한국 방송을 이용하시는 경로가 차단 또는 폐쇄될 경우 어떻게 하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="1"/> 콘텐츠 이용 자체를 포기한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="2"/> 유료 콘텐츠를 이용한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="3"/> 무료로 이용할 수 있는 다른 경로를 찾는다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="4"/> 기존 경로를 우회할수 있는 방법을 찾는다</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="5"/> 기타(<input type="text" name="cQ213Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq2-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. 귀하께서는 올해(2019년)의 무료 한국 방송 이용이 전년도(2018년)와 비교하여 증가하셨습니까 또는 감소하였습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="1"/> (<input type="text" name="cQ2141"/> %) 증가</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="2"/> (<input type="text" name="cQ2142"/> %) 감소</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="3"/> 변화없다</td>
			</tr>
			
			<!-- cq2-15 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. 귀하께서 전년과 비교하여 무료 한국 방송 이용이 증가한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="1"/> 유료 콘텐츠의 가격이 너무 올라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="2"/> 무료 콘텐츠 가격이 예년보다 더 낮아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="3"/> 이용 가능한 무료 콘텐츠의 양이 예년보다 더 많아져서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="4"/> 무료 콘텐츠를 이용할 수 있는 경로가 많아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="5"/> 전체적인 콘텐츠 소비가 증가해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="6"/> 무료 콘텐츠 이용이 편리해서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="7"/> 기타(<input type="text" name="cQ215Etc"/>)</td>				
			</tr>
			
			<!-- cq2-16 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. 귀하께서 전년과 비교하여 무료 한국 방송 이용이 감소한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="1"/> 단속으로 인한 이용 가능한 무료 콘텐츠나 경로가 줄어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="2"/> 유료 콘텐츠의 가격이 적정해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="3"/> 저작권을 지켜야 한다는 홍보 캠페인, 뉴스기사 등을 보고 유료 콘텐츠 구매의사가 늘어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="4"/> 저작권 침해로 인한 소송, 해킹, 바이러스 감염 등의 문제가 생길까봐</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="5"/> 콘텐츠 이용 자체가 감소</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="6"/> 양심적인 결정에 따라 유료 콘텐츠의 이용횟수를 늘려서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="7"/> 기타(<input type="text" name="cQ216Etc"/>)</td>				
			</tr>
			
			<!-- cq2-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. 귀하께서는 어떤 상황이 되면 무료 한국 방송 이용을 중단하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="1"/> 유료 콘텐츠 및 서비스의 가격 인하</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="2"/> 전체적인 무료 콘텐츠의 감소</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="3"/> 무료 콘텐츠 이용자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="4"/> 저작권 보호에 대한 교육 및 홍보를 통한 인식 개선</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="5"/> 유료 콘텐츠와 무료 콘텐츠의 명확한 구분</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="6"/> 바이러스 감염, 신용카드 해킹 등으로 인한 개인적인 피해</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="7"/> 무료 콘텐츠 공급자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="8"/> 이용 가능한 유료 콘텐츠의 양 확보</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="9"/> 유료 콘텐츠의 이용 편리성 제고(접근성, 결제 방식, 로그인 간편화 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="10"/> 기타(<input type="text" name="cQ217Etc"/>)</td>				
			</tr>
			
			<!-- cq2-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. 귀하께서는 무료 한국 방송을 이용 또는 구입하는 주위 사람들을 볼 때 어떤 행동을 하고 계십니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="1"/> 무료 콘텐츠와 관련된 정보를 공유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="2"/> 무료 콘텐츠 이용을 저지한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="3"/> 유료 콘텐츠 이용을 권유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="4"/> 특별한 행동을 하지는 않는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="5"/> 기타(<input type="text" name="cQ218Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('5');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section6">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> 음악(휴대폰 멜로디 등)
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq3-1 -->
			<tr>
				<td class="qTd">C_Q1. 귀하께서 입수·시청하는 모든 음악 중에서 한국 음악이 차지하는 비율은 어느 정도입니까?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ31"/> %</td>
			</tr>
			
			<!-- cq3-2 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q2. 귀하께서 이용하시는 한국 음악은 주로 어떤 장르입니까?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="1"/> 발라드</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="2"/> 댄스</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="3"/> 랩/힙합</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="4"/> R&B/Soul</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="5"/> 인디음악</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="6"/> 트로트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="7"/> 록/메탈</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="8"/> 기타(<input type="text" name="cQ32Etc"/>)</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq3-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. 최근3개월 동안 한국 음악(휴대폰 멜로디 등)를 무료 입수 및 시청 건수와 유료 입수 및 시청 건수를 적어주시기 바랍니다.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">무료</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">유료</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
				<th class="aTd" style="background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">온라인<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">특정 사업자·운영자에 의한 콘텐츠 배포</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A11" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">동영상 공유 사이트를 통해 유통 (Youtube 등)</td>
				<td class="aTd"><input type="text" name="cQ33A21" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">링크 사이트 / 리치 사이트를 통해 유통</td>
				<td class="aTd"><input type="text" name="cQ33A31" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">P2P 사이트 / P2P 소트프웨어에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ33A41" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">스토리지 서비스에 의한 유통(파일공유 사이트 포함)</td>
				<td class="aTd"><input type="text" name="cQ33A51" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">이메일이나 메신저 등을 통한 지인 간의 유통</td>
				<td class="aTd"><input type="text" name="cQ33A61" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">앱에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ33A71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ33A74" style="width:70%;"/> 건</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">패키지<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">실제 매장에서의 패키지 판매</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33B13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">잡지나 TV 등에 의한 패키지의 통신 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B23" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">인터넷을 통한 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B33" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">경매 등에 의한 패키지 유통</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B43" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd"><input type="text" name="cQ33B51" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B53" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">이벤트 행사장에서의 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B63" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">패키지 렌탈</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B73" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">지인 사이의 패키지 유통</td>
				<td class="aTd"><input type="text" name="cQ33B81" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B83" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV·<br/>영화</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">지상파 TV방송 시청</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33C12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33C14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">위성 TV 방송 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C22" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">케이블 TV 시청</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C32" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">영화관에서 감상</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">노래방 기계 이용</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C52" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-6</td>
				<td class="qTd">라이브·콘서트의 감상</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C62" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">c-7</td>
				<td class="qTd">라디오 방송 청취</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C72" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C74" style="width:70%;"/> 건</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq3-4 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 음악을 유료로 입수·시청하기 위해 지불한 비용은 어느 정도입니까?</td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ34"/> )</td>
			</tr>
			
			<!-- cq2-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. 귀하께서 무료 한국 음악을 입수하기 위해 C_Q3 문항에 응답하신 경로를 가장 자주 사용하시는 이유는 무엇입니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="1"/> 접근 및 사용이 용이해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="2"/> 계속 사용하던 곳으로 익숙해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="3"/> 바이러스 감염으로부터 안전해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="4"/> 다른 경로에 비해 자료가 풍부해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="5"/> 경로차단 또는 폐쇄가 안 될 것 같아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="6"/> 다른경로를 몰라서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="7"/> 불편하지만 광고만 보면 되므로</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="8"/> 기타(<input type="text" name="cQ35Etc"/>)</td>
			</tr>
			
			<!-- cq3-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. 귀하께서는 어떤 경로를 통해 무료 한국 방송에 대한 정보를 알게 되셨나요?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="1"/> 콘텐츠 홀더의 웹사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="2"/> 뉴스 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="3"/> 콘텐츠를 입수하고 있는 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="4"/> TV·라디오</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="5"/> 입소문(리뷰)</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="6"/> 카페, 블로그, SNS</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="7"/> 친구나 동료 등 지인을 통해</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="8"/> 기타(<input type="text" name="cQ36Etc"/>)</td>
			</tr>
			
			<!-- cq3-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. 무료 한국 음악을 입수(복사 또는 다운로드) 또는 시청하는 경우, 사용하는 단말기는 무엇입니까? 해당되는 모든 장비를 선택해주세요</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="8"/> 기타<br/>(<input type="text" name="cQ37Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="9"/> 인터넷에서 구매 (스트리밍 또는 패키지 구매에 한함)</td>
			</tr>
			
			<!-- cq3-8 -->
			<tr>
				<td class="qTd" rowspan="10">C_Q8. 귀하께서 무료 한국 음악을 이용하시는 이유는 무엇입니까? 모두 선택해주세요</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="1"/> 저렴하거나 무료이기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="2"/> 유료 콘텐츠를 결제해서 이용할 만 한 가치가 있다고 생각하지 않아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="3"/> 원하는 콘텐츠를 이용할 수 있는 방법이 무료 콘텐츠 이용밖에 없어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="4"/> 유료 콘텐츠보다 이용하기 편해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="5"/> 무료 콘텐츠 이용이 심각한 일이 아니라고 생각해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="6"/> 많은 사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="7"/> ITEM당 콘텐츠를 스트리밍 하거나 다운로드 할 수 있기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="8"/> 유료 콘텐츠보다 더 빨리 이용할 수 있어서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="9"/> 계속 사용해 왔기 때문에</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="10"/> 기타(<input type="text" name="cQ38Etc"/>)</td>
			</tr>
			
			<!-- cq3-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. 한국 음악을 입수·시청하는 경우 정품 또는 불법 복제판이라고 의식합니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq3-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">C_Q9_1. 정품 또는 불법 복제판 여부가 입수·시청에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="1"/> 입수·시청에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="2"/> 정품이 있으면 정품을 입수·시청하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 입수·시청한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="3"/> 정품만 입수·시청 한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="4"/> 정품은 비싸기 때문에 불법 복제판만 입수한다</td>
			</tr>
			
			<!-- cq3-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. 한국의 권리자가 한국 음악을 합법적으로 인터넷에서 입수·시청할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="3"/> 음성이 원래 콘텐츠 제작국의 언어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="4"/> 조사대상국 자막이 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="5"/> 영어 자막이 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="6"/> 콘텐츠 제작국 방송이나 극장 개봉과 거의 같은 시기에 입수·시청 할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="7"/> HD 품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="8"/> 다운로드 가능한지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="9"/> 콘텐츠의 시간(용량)에 따라 가격이 설정되는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="10"/> 한국의 콘텐츠가 같은 사이트에서 많이 정리되어 배포되는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="11"/> 입수·시청하고 싶은 콘텐츠를 쉽게 찾을 수 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="12"/> 특별히 조건 없음</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="13"/> 특별히 정품을 원하지 않음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="14"/> 기타(<input type="text" name="cQ310Etc"/>)</td>
			</tr>
			
			<!-- cq3-11 -->
			<tr>
				<td class="qTd">C_Q11. 위의 질문 <font style="color:blue">C_Q10]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 음악을 합법적으로 인터넷에서 입수·시청할 수 있게 한 경우 콘텐츠 1건 당 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ311" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
			<!-- cq3-12 -->
			<tr>
				<td class="qTd">C_Q12. 귀하께서는 자신 이외의 다른 사람에게 자신의 무료 한국 음악을 공유하거나, 또는 경로를 재공유 하신 경험이 있습니까?(둘 중 하나라도 경험이 있다면 '있다' 로 답해주세요)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ312" value="1"/> 있다</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ312" value="2"/> 없다</td>
			</tr>
			
			<!-- cq3-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_1. 귀하께서는 무료 한국 음악을 어떤 경로를 통해 공유하셨습니까? 모두 선택해주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="1"/> USB, CD, DVD 등 오프라인</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="2"/> 카페, 블로그 등에 업로드</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="3"/> SNS(Facebook, Twitter, Instagram 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="4"/> 토렌트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="5"/> P2P 또는 웹하드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="6"/> 개인적인 공유(이메일, 카카오톡 등)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="7"/> 클라우드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="8"/> 기타(<input type="text" name="cQ3121Etc"/>)</td>
			</tr>
			
			<!-- cq3-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_2. 귀하께서 무료 한국 음악을 공유하신 이유를 모두 선택해 주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="1"/> 가족 및 친구 등 지인이 무료 콘텐츠에 접근 방법을 몰라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="2"/> 많은사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="3"/> 금전적인 수익을 얻기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="4"/> 불특정 다수에게 공유하기 위해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="5"/> 더 많은 무료 콘텐츠를 이용하기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="6"/> 요청이 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="7"/> 특별한 이유는 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="8"/> 기타(<input type="text" name="cQ3122Etc"/>)</td>
			</tr>
			
			<!-- cq3-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. 귀하께서 무료 한국 음악을 이용하시는 경로가 차단 또는 폐쇄될 경우 어떻게 하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="1"/> 콘텐츠 이용 자체를 포기한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="2"/> 유료 콘텐츠를 이용한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="3"/> 무료로 이용할 수 있는 다른 경로를 찾는다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="4"/> 기존 경로를 우회할수 있는 방법을 찾는다</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="5"/> 기타(<input type="text" name="cQ313Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq3-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. 귀하께서는 올해(2019년)의 무료 한국 음악 이용이 전년도(2018년)와 비교하여 증가하셨습니까 또는 감소하였습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="1"/> (<input type="text" name="cQ3141"/> %) 증가</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="2"/> (<input type="text" name="cQ3142"/> %) 감소</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="3"/> 변화없다</td>
			</tr>
			
			<!-- cq3-15 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. 귀하께서 전년과 비교하여 무료 한국 음악 이용이 증가한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="1"/> 유료 콘텐츠의 가격이 너무 올라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="2"/> 무료 콘텐츠 가격이 예년보다 더 낮아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="3"/> 이용 가능한 무료 콘텐츠의 양이 예년보다 더 많아져서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="4"/> 무료 콘텐츠를 이용할 수 있는 경로가 많아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="5"/> 전체적인 콘텐츠 소비가 증가해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="6"/> 무료 콘텐츠 이용이 편리해서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="7"/> 기타(<input type="text" name="cQ315Etc"/>)</td>				
			</tr>
			
			<!-- cq3-16 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. 귀하께서 전년과 비교하여 무료 한국 음악 이용이 감소한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="1"/> 단속으로 인한 이용 가능한 무료 콘텐츠나 경로가 줄어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="2"/> 유료 콘텐츠의 가격이 적정해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="3"/> 저작권을 지켜야 한다는 홍보 캠페인, 뉴스기사 등을 보고 유료 콘텐츠 구매의사가 늘어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="4"/> 저작권 침해로 인한 소송, 해킹, 바이러스 감염 등의 문제가 생길까봐</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="5"/> 콘텐츠 이용 자체가 감소</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="6"/> 양심적인 결정에 따라 유료 콘텐츠의 이용횟수를 늘려서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="7"/> 기타(<input type="text" name="cQ316Etc"/>)</td>				
			</tr>
			
			<!-- cq3-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. 귀하께서는 어떤 상황이 되면 무료 한국 음악 이용을 중단하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="1"/> 유료 콘텐츠 및 서비스의 가격 인하</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="2"/> 전체적인 무료 콘텐츠의 감소</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="3"/> 무료 콘텐츠 이용자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="4"/> 저작권 보호에 대한 교육 및 홍보를 통한 인식 개선</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="5"/> 유료 콘텐츠와 무료 콘텐츠의 명확한 구분</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="6"/> 바이러스 감염, 신용카드 해킹 등으로 인한 개인적인 피해</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="7"/> 무료 콘텐츠 공급자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="8"/> 이용 가능한 유료 콘텐츠의 양 확보</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="9"/> 유료 콘텐츠의 이용 편리성 제고(접근성, 결제 방식, 로그인 간편화 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="10"/> 기타(<input type="text" name="cQ317Etc"/>)</td>				
			</tr>
			
			<!-- cq3-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. 귀하께서는 무료 한국 음악을 이용 또는 구입하는 주위 사람들을 볼 때 어떤 행동을 하고 계십니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="1"/> 무료 콘텐츠와 관련된 정보를 공유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="2"/> 무료 콘텐츠 이용을 저지한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="3"/> 유료 콘텐츠 이용을 권유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="4"/> 특별한 행동을 하지는 않는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="5"/> 기타(<input type="text" name="cQ318Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('6');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section7">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> 게임
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq4-1 -->
			<tr>
				<td class="qTd">C_Q1. 귀하께서 입수·시청하는 모든 게임 중에서 한국 게임이 차지하는 비율은 어느 정도입니까?</td>
				<td class="aTd" colspan="3">(<input type="text" name="cQ41"/> %)</td>
			</tr>
			
			<!-- cq4-2 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q2. 귀하께서 이용하시는 한국 게임은 주로 어떤 장르입니까?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="1"/> RPG 게임</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="2"/> 전략시물레이션게임</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="3"/> 스포츠/레이싱</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="4"/> 아케이트/고전 게임</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="5"/> 액션/슈팅</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="6"/> 퀴즈/퍼즐 게임</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="7"/> 보드 게임</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="8"/> 교육용게임</td>
			</tr>
		</table>
		<table  style="width:100%;border:1px solid #ddd;">
			<!-- cq4-3 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q3. 한국 게임 정보를 어디에서 얻습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;width:50%;"><input type="radio" name="cQ43" value="1"/> 콘텐츠 홀더의 웹사이트</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="2"/> 뉴스 사이트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="3"/> 콘텐츠를 입수하고 있는 사이트</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="4"/> TV·라디오</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="5"/> 입소문(리뷰)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="6"/> 카페, 블로그, SNS</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="7"/> 친구나 동료 등 지인을 통해</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="8"/> 기타(<input type="text" name="cQ43Etc"/>)</td>				
			</tr>
			
			<tr>
				<td colspan="3" class="aTd" style="background-color:#FFE08C;color:#050099;font-size:16px;">온라인 게임</td>
			</tr>
			
			<!-- cq4-4 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 게임(온라인 게임)의 플레이 빈도는 어느 정도 입니까?</td>
				<td class="aTd" colspan="2">(한 달 평균 <input type="text" name="cQ44"/> 회)</td>
			</tr>
			
			<!-- cq4-5 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q5. 최근 3개월 동안 플레이 한 한국 게임(온라인 게임) 건수를 무료 / 유료 별로 응답해주시고 유료의 경우 가격을 적어주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ45" value="1"/> 무료 (<input type="text" name="cQ451"/>)건</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ45" value="2"/> 유료 (<input type="text" name="cQ452" style="width:15%;"/>)건 (<input type="text" name="cQ452Etc" placeholder="지불금액"/>)</td>
			</tr>
			
			<!-- cq4-6 -->
			<tr>
				<td class="qTd" rowspan="6">C_Q6. 한국 게임(온라인 게임)을 플레이하는 데 사용하는 단말기는 무엇입니까? 해당되는 모든 기기를 선택해주세요</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="checkbox" name="cQ46" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="checkbox" name="cQ46" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="7"/> PS</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="8"/> PSP</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="9"/> Nintendo</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="10"/> X Box</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="11"/> 인터넷 구매 (패키지 구입 만)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="12"/> 기타<br/>(<input type="text" name="cQ46Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-7 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q7. 한국 게임(온라인 게임)을 플레이 할 경우 정품 또는 불법 복제판이라고 의식하고 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq4-7-1 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q7_1. 한국 게임(온라인 게임)을 플레이 할 때 정품 또는 불법 복제판 여부가 입수·시청에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="1"/> 플레이에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="2"/> 정품이 있으면 정품을 플레이하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 플레이한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="3"/> 정품만 플레이한다</td>
			</tr>
			
			<!-- cq4-8 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q8. 한국의 권리자가 한국 게임을 합법적으로 인터넷에서 플레이 할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="3"/> 음성이 원래 콘텐츠 제작국의 언어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="4"/> 조사대상국의 언어로 표기되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="5"/> 영어로 표기되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="6"/> 제작국에서의 공개와 거의 같은 시기에 입수·시청 할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="7"/> HD 품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="8"/> 특별히 조건 없음</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="9"/> 특별히 정품을 원하지 않음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="10"/> 기타(<input type="text" name="cQ48Etc"/>)</td>
			</tr>
			
			<!-- cq4-9 -->
			<tr>
				<td class="qTd">C_Q9. 위의 질문 <font style="color:blue">C_Q8]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 게임을 합법적으로 인터넷에서 입수·시청할 수 있게 한 경우 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ49" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<td colspan="7" class="aTd" style="background-color:#FFE08C;color:#050099;font-size:16px;">비온라인 게임(온라인 게임 제외)</td>
			</tr>
			
			<!-- cq4-10 -->
			<tr>
				<td class="qTd" colspan="7">C_Q10. 최근3개월 동안 한국 게임(온라인게임 제외)을 무료 입수 및 플레이 건수와 유료 입수 및 플레이 건수를 적어주시기 바랍니다.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">무료</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">유료</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">플레이</th>
				<th class="aTd" style="background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">플레이</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">온라인<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">특정 사업자·운영자에 의한 콘텐츠 배포</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A11" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">동영상 공유 사이트를 통해 유통 (Youtube 등)</td>
				<td class="aTd"><input type="text" name="cQ410A21" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">링크 사이트 / 리치 사이트를 통해 유통</td>
				<td class="aTd"><input type="text" name="cQ410A31" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">P2P 사이트 / P2P 소트프웨어에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ410A41" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">스토리지 서비스에 의한 유통(파일공유 사이트 포함)</td>
				<td class="aTd"><input type="text" name="cQ410A51" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">이메일이나 메신저 등을 통한 지인 간의 유통</td>
				<td class="aTd"><input type="text" name="cQ410A61" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">앱에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ410A71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410A74" style="width:70%;"/> 건</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">패키지<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">실제 매장에서의 패키지 판매</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">잡지나 TV 등에 의한 패키지의 통신 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">인터넷을 통한 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">경매 등에 의한 패키지 유통</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">이벤트 행사장에서의 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">패키지 렌탈</td>
				<td class="aTd"><input type="text" name="cQ410B71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B74" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">지인 사이의 패키지 유통</td>
				<td class="aTd"><input type="text" name="cQ410B81" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B82" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B83" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ410B84" style="width:70%;"/> 건</td>
			</tr>
			
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq4-11 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 게임(비온라인)을 유료로 입수·시청하기 위해 지불한 비용은 어느 정도입니까?</td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ411"/> )</td>
			</tr>
			
			<!-- cq4-12 -->
			<tr>
				<td class="qTd" rowspan="6">C_Q12. 한국 게임(온라인 게임 제외)을 인터넷에서 입수(복사 또는 다운로드)하는 경우, 이를 위해 사용하는 단말기는 무엇입니까?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="7"/> PS</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="8"/> PSP</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="9"/> Nintendo</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="10"/> X Box</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="11"/> 인터넷 구매 (패키지 구입 만)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="12"/> 기타<br/>(<input type="text" name="cQ412Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-13 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q13. 한국 게임(온라인 게임 제외)을 인터넷에서 입수하는 경우 정품 또는 불법 복제판이라고 의식합니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq4-13-1 -->
			<tr>
				<td class="qTd" rowspan="4">C_Q13_1. 한국 게임(온라인 게임 제외)을 인터넷에서 입수하는 경우 정품 또는 불법 복제판 여부가 입수에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="1"/> 입수에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="2"/> 정품이 있으면 정품을 입수하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 입수한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="3"/> 정품만 입수한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="4"/> 정품은 비싸기 때문에 불법 복제판만 입수한다</td>
			</tr>
			
			<!-- cq4-14 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q14. 한국의 권리자가 한국 게임(온라인 게임 제외)을 합법적으로 인터넷에서 입수할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="3"/> 음성이 한국어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="4"/> 조사대상국가 언어로 표기되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="5"/> 영어로 표기되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="6"/> 한국에서의 공개와 거의 같은 시기에 입수·시청할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="7"/> 영상이 고품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="8"/> 콘텐츠의 시간(용량)에 따라 가격이 설정되는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="9"/> 한국의 콘텐츠가 같은 사이트에서 많이 정리되어 배포되는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="10"/> 입수·시청하고 싶은 콘텐츠를 쉽게 찾을 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="11"/> 특별히 조건 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="12"/> 특별히 정품을 원하지 않음</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="13"/> 기타(<input type="text" name="cQ414Etc"/>)</td>
			</tr>
			
			<!-- cq4-15 -->
			<tr>
				<td class="qTd">C_Q15. 위의 질문 <font style="color:blue">C_Q14]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 게임(온라인 게임 제외)을 합법적으로 입수할 수 있게 한 경우 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ415" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
			<!-- cq4-16 -->
			<tr>
				<td class="qTd">C_Q16. 귀하께서는 자신 이외의 다른 사람에게 자신의 무료 한국 게임(온라인 게임 제외)을 공유하거나, 또는 경로를 재공유 하신 경험이 있습니까?(둘 중 하나라도 경험이 있다면 '있다' 로 답해주세요)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ416" value="1"/> 있다</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ416" value="2"/> 없다</td>
			</tr>
			
			<!-- cq4-16-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16_1. 귀하께서는 무료 한국 게임(온라인 게임 제외)을 어떤 경로를 통해 공유하셨습니까? 모두 선택해주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="1"/> USB, CD, DVD 등 오프라인</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="2"/> 카페, 블로그 등에 업로드</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="3"/> SNS(Facebook, Twitter, Instagram 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="4"/> 토렌트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="5"/> P2P 또는 웹하드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="6"/> 개인적인 공유(이메일, 카카오톡 등)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="7"/> 클라우드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="8"/> 기타(<input type="text" name="cQ4161Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-16-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16_2. 귀하께서 무료 한국 게임(온라인 게임 제외)을 공유하신 이유를 모두 선택해 주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="1"/> 가족 및 친구 등 지인이 무료 콘텐츠에 접근 방법을 몰라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="2"/> 많은사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="3"/> 금전적인 수익을 얻기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="4"/> 불특정 다수에게 공유하기 위해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="5"/> 더 많은 무료 콘텐츠를 이용하기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="6"/> 요청이 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="7"/> 특별한 이유는 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="8"/> 기타(<input type="text" name="cQ4162Etc"/>)</td>
			</tr>
			
			<!-- cq4-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. 귀하께서 무료 한국 게임(온라인 게임 제외)을 이용하시는 경로가 차단 또는 폐쇄될 경우 어떻게 하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="1"/> 콘텐츠 이용 자체를 포기한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="2"/> 유료 콘텐츠를 이용한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="3"/> 무료로 이용할 수 있는 다른 경로를 찾는다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="4"/> 기존 경로를 우회할수 있는 방법을 찾는다</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="5"/> 기타(<input type="text" name="cQ417Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq4-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. 귀하께서는 올해(2019년)의 무료 한국 게임(온라인 게임 제외) 이용이 전년도(2018년)와 비교하여 증가하셨습니까 또는 감소하였습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="1"/> (<input type="text" name="cQ4181"/> %) 증가</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="2"/> (<input type="text" name="cQ4182"/> %) 감소</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="3"/> 변화없다</td>
			</tr>
			
			<!-- cq4-19 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q19. 귀하께서 전년과 비교하여 무료 한국 게임(온라인 게임 제외) 이용이 증가한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="1"/> 유료 콘텐츠의 가격이 너무 올라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="2"/> 무료 콘텐츠 가격이 예년보다 더 낮아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="3"/> 이용 가능한 무료 콘텐츠의 양이 예년보다 더 많아져서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="4"/> 무료 콘텐츠를 이용할 수 있는 경로가 많아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="5"/> 전체적인 콘텐츠 소비가 증가해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="6"/> 무료 콘텐츠 이용이 편리해서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="7"/> 기타(<input type="text" name="cQ419Etc"/>)</td>				
			</tr>
			
			<!-- cq4-20 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q20. 귀하께서 전년과 비교하여 무료 한국 게임(온라인 게임 제외) 이용이 감소한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="1"/> 단속으로 인한 이용 가능한 무료 콘텐츠나 경로가 줄어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="2"/> 유료 콘텐츠의 가격이 적정해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="3"/> 저작권을 지켜야 한다는 홍보 캠페인, 뉴스기사 등을 보고 유료 콘텐츠 구매의사가 늘어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="4"/> 저작권 침해로 인한 소송, 해킹, 바이러스 감염 등의 문제가 생길까봐</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="5"/> 콘텐츠 이용 자체가 감소</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="6"/> 양심적인 결정에 따라 유료 콘텐츠의 이용횟수를 늘려서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="7"/> 기타(<input type="text" name="cQ420Etc"/>)</td>				
			</tr>
			
			<!-- cq4-21 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q21. 귀하께서는 어떤 상황이 되면 무료 한국 게임(온라인 게임 제외) 이용을 중단하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="1"/> 유료 콘텐츠 및 서비스의 가격 인하</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="2"/> 전체적인 무료 콘텐츠의 감소</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="3"/> 무료 콘텐츠 이용자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="4"/> 저작권 보호에 대한 교육 및 홍보를 통한 인식 개선</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="5"/> 유료 콘텐츠와 무료 콘텐츠의 명확한 구분</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="6"/> 바이러스 감염, 신용카드 해킹 등으로 인한 개인적인 피해</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="7"/> 무료 콘텐츠 공급자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="8"/> 이용 가능한 유료 콘텐츠의 양 확보</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="9"/> 유료 콘텐츠의 이용 편리성 제고(접근성, 결제 방식, 로그인 간편화 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="10"/> 기타(<input type="text" name="cQ421Etc"/>)</td>				
			</tr>
			
			<!-- cq4-22 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q22. 귀하께서는 무료 한국 게임(온라인 게임 제외)을 이용 또는 구입하는 주위 사람들을 볼 때 어떤 행동을 하고 계십니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="1"/> 무료 콘텐츠와 관련된 정보를 공유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="2"/> 무료 콘텐츠 이용을 저지한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="3"/> 유료 콘텐츠 이용을 권유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="4"/> 특별한 행동을 하지는 않는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="5"/> 기타(<input type="text" name="cQ422Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('7');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section8">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> 웹툰
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th colspan="2" style="background-color:#ddd;">문항</th>
				<th colspan="2" style="background-color:#ddd;">답변</th>
			</tr>
			
			<!-- cq5-1 -->
			<tr>
				<td class="qTd" colspan="2">C_Q1. 귀하께서 입수·시청하는 모든 웹툰 중에서 한국 웹툰이 차지하는 비율은 어느 정도입니까?</td>
				<td class="aTd" colspan="2"><input type="text" name="cQ51"/> %</td>
			</tr>
			
			<!-- cq5-2 -->
			<tr>
				<td class="qTd" colspan="4" style="border-top:3px solid #ddd;">C_Q2. 귀하께서 이용하시는 한국 웹툰은 주로 어떤 장르입니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="1"/> 에피소드</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="2"/> 옴니버스</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="3"/> 스토리</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="4"/> 일상</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="5"/> 개그</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="6"/> 판타지</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="7"/> 액션</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="8"/> 드라마</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="9"/> 순정/감성</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="10"/> 스릴러</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="11"/> 시대극</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="12"/> 스포츠</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq5-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. 최근3개월 동안 한국 웹툰을 무료 입수 및 시청 건수와 유료 입수 및 시청 건수를 적어주시기 바랍니다.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">무료</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">유료</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
				<th class="aTd" style="background-color:#ddd;">입수</th>
				<th class="aTd" style="background-color:#ddd;">시청</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">온라인<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">특정 사업자·운영자에 의한 콘텐츠 배포</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A11" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A12" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A14" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">동영상 공유 사이트를 통해 유통 (Youtube 등)</td>
				<td class="aTd"><input type="text" name="cQ53A21" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A22" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A23" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A24" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">링크 사이트 / 리치 사이트를 통해 유통</td>
				<td class="aTd"><input type="text" name="cQ53A31" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A32" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A33" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A34" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">P2P 사이트 / P2P 소트프웨어에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ53A41" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A42" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A43" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A44" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">스토리지 서비스에 의한 유통(파일공유 사이트 포함)</td>
				<td class="aTd"><input type="text" name="cQ53A51" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A52" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A53" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A54" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">이메일이나 메신저 등을 통한 지인 간의 유통</td>
				<td class="aTd"><input type="text" name="cQ53A61" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A62" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A63" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A64" style="width:70%;"/> 건</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">앱에 의한 유통</td>
				<td class="aTd"><input type="text" name="cQ53A71" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A72" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A73" style="width:70%;"/> 건</td>
				<td class="aTd"><input type="text" name="cQ53A74" style="width:70%;"/> 건</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">패키지<br/>유통</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">실제 매장에서의 패키지 판매</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53B13" style="width:70%;"/> 건</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">잡지나 TV 등에 의한 패키지의 통신 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B23" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">인터넷을 통한 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B33" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">경매 등에 의한 패키지 유통</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B43" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<!-- <tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd"><input type="text" name="cQ33B51" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B53" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr> -->
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">이벤트 행사장에서의 패키지 판매</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B63" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">패키지 렌탈</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B73" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">지인 사이의 패키지 유통</td>
				<td class="aTd"><input type="text" name="cQ53B81" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B83" style="width:70%;"/> 건</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>						
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq5-4 -->
			<tr>
				<td class="qTd">C_Q4. 최근 3개월 동안 한국 웹툰을 유료로 입수·시청하기 위해 지불한 비용은 어느 정도입니까?</td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ54"/> )</td>
			</tr>
			
			<!-- cq5-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. 귀하께서 무료 한국 웹툰을 입수하기 위해 <font style="color:blue;">C_Q3 문항</font>에 응답하신 경로를 가장 자주 사용하시는 이유는 무엇입니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="1"/> 접근 및 사용이 용이해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="2"/> 계속 사용하던 곳으로 익숙해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="3"/> 바이러스 감염으로부터 안전해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="4"/> 다른 경로에 비해 자료가 풍부해서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="5"/> 경로차단 또는 폐쇄가 안 될 것 같아서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="6"/> 다른경로를 몰라서</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="7"/> 불편하지만 광고만 보면 되므로</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="8"/> 기타(<input type="text" name="cQ55Etc"/>)</td>
			</tr>
			
			<!-- cq5-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. 귀하께서는 어떤 경로를 통해 무료 한국 웹툰에 대한 정보를 알게 되셨나요?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="1"/> 콘텐츠 홀더의 웹사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="2"/> 뉴스 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="3"/> 콘텐츠를 입수하고 있는 사이트</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="4"/> TV·라디오</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="5"/> 입소문(리뷰)</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="6"/> 카페, 블로그, SNS</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="7"/> 친구나 동료 등 지인을 통해</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="8"/> 기타(<input type="text" name="cQ56Etc"/>)</td>
			</tr>
			
			<!-- cq5-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. 무료 한국 웹툰을 입수(복사 또는 다운로드) 또는 시청하는 경우, 사용하는 단말기는 무엇입니까? 해당되는 모든 장비를 선택해주세요</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="1"/> PC (자신 또는 가족 소유)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="2"/> PC (인터넷 카페)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="3"/> 휴대전화</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="4"/> 스마트폰</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="5"/> 테블릿</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="6"/> MP4 플레이어</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="8"/> 기타<br/>(<input type="text" name="cQ57Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="9"/> 인터넷에서 구매 (스트리밍 또는 패키지 구매에 한함)</td>
			</tr>
			
			<!-- cq5-8 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q8. 귀하께서 무료 한국 웹툰을 이용하시는 이유는 무엇입니까? 모두 선택해주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="1"/> 저렴하거나 무료이기 때문에</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="2"/> 유료 콘텐츠를 결제해서 이용할 만 한 가치가 있다고 생각하지 않아서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="3"/> 원하는 콘텐츠를 이용할 수 있는 방법이 무료 콘텐츠 이용밖에 없어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="4"/> 유료 콘텐츠보다 이용하기 편해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="5"/> 무료 콘텐츠 이용이 심각한 일이 아니라고 생각해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="6"/> 많은 사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="7"/> ITEM당 콘텐츠를 스트리밍 하거나 다운로드 할 수 있기 때문에</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="8"/> 유료 콘텐츠보다 더 빨리 이용할 수 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="9"/> 계속 사용해 왔기 때문에</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="10"/> 기타(<input type="text" name="cQ58Etc"/>)</td>
			</tr>
			
			<!-- cq5-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. 한국 웹툰을 입수·시청하는 경우 정품 또는 불법 복제판이라고 의식합니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="1"/> 의식하지 않음</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="2"/> 다소 의식한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="3"/> 의식한다</td>
			</tr>
			
			<!-- cq5-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">C_Q9_1. 정품 또는 불법 복제판 여부가 입수·시청에 영향을 줍니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="1"/> 입수·시청에는 영향이 없다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="2"/> 정품이 있으면 정품을 입수·시청하겠지만, 불법 복제판 밖에 없는 경우에는 불법 복제판을 입수·시청한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="3"/> 정품만 입수·시청 한다</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="4"/> 정품은 비싸기 때문에 불법 복제판만 입수한다</td>
			</tr>
			
			<!-- cq5-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. 한국의 권리자가 한국 웹툰을 합법적으로 인터넷에서 입수·시청할 수 있게 한다면, 어떤 조건에 의한 배포를 희망합니까? 그 조건에 해당되는 것을 모두 선택하세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="1"/> 음성이 조사대상국 언어로 더빙되어 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="2"/> 음성이 영어로 더빙되어 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="3"/> 음성이 원래 콘텐츠 제작국의 언어로 남아 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="4"/> 조사대상국 자막이 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="5"/> 영어 자막이 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="6"/> 콘텐츠 제작국 방송이나 극장 개봉과 거의 같은 시기에 입수·시청 할 수 있는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="7"/> HD 품질인지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="8"/> 다운로드 가능한지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="9"/> 콘텐츠의 시간(용량)에 따라 가격이 설정되는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="10"/> 한국의 콘텐츠가 같은 사이트에서 많이 정리되어 배포되는지</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="11"/> 입수·시청하고 싶은 콘텐츠를 쉽게 찾을 수 있는지</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="12"/> 특별히 조건 없음</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="13"/> 특별히 정품을 원하지 않음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="14"/> 기타(<input type="text" name="cQ510Etc"/>)</td>
			</tr>
			
			<!-- cq5-11 -->
			<tr>
				<td class="qTd">C_Q11. 위의 질문 <font style="color:blue">C_Q10]</font> 에서 선택한 조건을 충족하고, 한국의 권리자가 한국 웹툰을 합법적으로 인터넷에서 입수·시청할 수 있게 한 경우 콘텐츠 1건 당 어느 정도 가격이라면 지불할 의사가 있습니까?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ511" placeholder="조사대상국 화폐단위"/>)</td>
			</tr>
			
			<!-- cq5-12 -->
			<tr>
				<td class="qTd">C_Q12. 귀하께서는 자신 이외의 다른 사람에게 자신의 무료 한국 웹툰을 공유하거나, 또는 경로를 재공유 하신 경험이 있습니까?(둘 중 하나라도 경험이 있다면 '있다' 로 답해주세요)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ512" value="1"/> 있다</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ512" value="2"/> 없다</td>
			</tr>
			
			<!-- cq5-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_1. 귀하께서는 무료 한국 웹툰을 어떤 경로를 통해 공유하셨습니까? 모두 선택해주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="1"/> USB, CD, DVD 등 오프라인</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="2"/> 카페, 블로그 등에 업로드</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="3"/> SNS(Facebook, Twitter, Instagram 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="4"/> 토렌트</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="5"/> P2P 또는 웹하드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="6"/> 개인적인 공유(이메일, 카카오톡 등)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="7"/> 클라우드</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="8"/> 기타(<input type="text" name="cQ5121Etc"/>)</td>
			</tr>
			
			<!-- cq5-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q12_2. 귀하께서 무료 한국 웹툰을 공유하신 이유를 모두 선택해 주세요.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="1"/> 가족 및 친구 등 지인이 무료 콘텐츠에 접근 방법을 몰라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="2"/> 많은사람들이 하기 때문에</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="3"/> 금전적인 수익을 얻기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="4"/> 불특정 다수에게 공유하기 위해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="5"/> 더 많은 무료 콘텐츠를 이용하기 위해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="6"/> 요청이 있어서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="7"/> 특별한 이유는 없음</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="8"/> 기타(<input type="text" name="cQ5122Etc"/>)</td>
			</tr>
			
			<!-- cq5-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. 귀하께서 무료 한국 웹툰을 이용하시는 경로가 차단 또는 폐쇄될 경우 어떻게 하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="1"/> 콘텐츠 이용 자체를 포기한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="2"/> 유료 콘텐츠를 이용한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="3"/> 무료로 이용할 수 있는 다른 경로를 찾는다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="4"/> 기존 경로를 우회할수 있는 방법을 찾는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="5"/> 기타(<input type="text" name="cQ513Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq5-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. 귀하께서는 올해(2019년)의 무료 한국 웹툰 이용이 전년도(2018년)와 비교하여 증가하셨습니까 또는 감소하였습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="1"/> (<input type="text" name="cQ5141"/> %) 증가</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="2"/> (<input type="text" name="cQ5142"/> %) 감소</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="3"/> 변화없다</td>
			</tr>
			
			<!-- cq5-15 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. 귀하께서 전년과 비교하여 무료 한국 웹툰 이용이 증가한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="1"/> 유료 콘텐츠의 가격이 너무 올라서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="2"/> 무료 콘텐츠 가격이 예년보다 더 낮아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="3"/> 이용 가능한 무료 콘텐츠의 양이 예년보다 더 많아져서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="4"/> 무료 콘텐츠를 이용할 수 있는 경로가 많아져서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="5"/> 전체적인 콘텐츠 소비가 증가해서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="6"/> 무료 콘텐츠 이용이 편리해서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="7"/> 기타(<input type="text" name="cQ315Etc"/>)</td>				
			</tr>
			
			<!-- cq5-16 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. 귀하께서 전년과 비교하여 무료 한국 웹툰 이용이 감소한 주된 이유는 무엇인지 모두 선택해 주세요</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="1"/> 단속으로 인한 이용 가능한 무료 콘텐츠나 경로가 줄어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="2"/> 유료 콘텐츠의 가격이 적정해서</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="3"/> 저작권을 지켜야 한다는 홍보 캠페인, 뉴스기사 등을 보고 유료 콘텐츠 구매의사가 늘어서</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="4"/> 저작권 침해로 인한 소송, 해킹, 바이러스 감염 등의 문제가 생길까봐</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="5"/> 콘텐츠 이용 자체가 감소</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="6"/> 양심적인 결정에 따라 유료 콘텐츠의 이용횟수를 늘려서</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="7"/> 기타(<input type="text" name="cQ516Etc"/>)</td>				
			</tr>
			
			<!-- cq5-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. 귀하께서는 어떤 상황이 되면 무료 한국 웹툰 이용을 중단하시겠습니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="1"/> 유료 콘텐츠 및 서비스의 가격 인하</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="2"/> 전체적인 무료 콘텐츠의 감소</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="3"/> 무료 콘텐츠 이용자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="4"/> 저작권 보호에 대한 교육 및 홍보를 통한 인식 개선</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="5"/> 유료 콘텐츠와 무료 콘텐츠의 명확한 구분</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="6"/> 바이러스 감염, 신용카드 해킹 등으로 인한 개인적인 피해</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="7"/> 무료 콘텐츠 공급자 단속 및 처벌</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="8"/> 이용 가능한 유료 콘텐츠의 양 확보</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="9"/> 유료 콘텐츠의 이용 편리성 제고(접근성, 결제 방식, 로그인 간편화 등)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="10"/> 기타(<input type="text" name="cQ517Etc"/>)</td>				
			</tr>
			
			<!-- cq5-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. 귀하께서는 무료 한국 웹툰을 이용 또는 구입하는 주위 사람들을 볼 때 어떤 행동을 하고 계십니까?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="1"/> 무료 콘텐츠와 관련된 정보를 공유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="2"/> 무료 콘텐츠 이용을 저지한다</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="3"/> 유료 콘텐츠 이용을 권유한다</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="4"/> 특별한 행동을 하지는 않는다</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="5"/> 기타(<input type="text" name="cQ518Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('7');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	

	<div style="width:100%;display:none;" id="section32">
		<h4 style="text-align:center;background-color:#F2CB61;;">■ 설문에 응해주셔서 감사합니다.</h4>
		<br/><br/><br/>
		
		<!-- <button type="button" onclick="javascript:window.open('','_self').close();">창닫기</button> -->
	</div>
</div>
</body>
</html>