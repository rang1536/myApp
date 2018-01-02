<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	td{}
	.radioTd{text-align:center;border-right:1px solid #ddd;}
	.cate{font-weight:bold;font-size:16px;color:#030066;}
</style>
<script>
	function start(){
		$('#intro').css('display','none');
		$('#section1').slideDown();
	}
	
	function nextQuestion(nowPageNum){
		var nextNum = parseInt(nowPageNum)+1;
		var nowTag = 'section'+nowPageNum;
		var nextTag = 'section'+nextNum;
		$('#'+nowTag).css('display','none');
		$('#'+nextTag).slideDown();
	}
</script>
</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">학술정보 Glocal Master 양성 사업 만족도 및 수요조사</h2>
	
	<table style="padding:4px;border:1px solid #000000;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;">
					<font id="nowDate" style="background-color:#F2CB61;"></font>
					&nbsp;안녕하십니까?<br/><br/>
					&nbsp;학술정보 Global Master 양성 사업은 산업체 수요자 중심의 맞춤형 교육과 현장실무 중심의 인력을 양성하는 사업입니다.<br/><br/>
					&nbsp;본 조사는 학생들을 대상으로 만족도와 수요를 조사하여, 향후 양성사업의 개선 방향과 발전 전략 수립 등을 위한 기초 자료로 활용하기 위함입니다.<br/><br/>
					&nbsp;귀하께서 답변해 주신 내용은 모두 무기명으로 전산 처리되고, 개인적인 응답내용은 통계법 제33조(비밀의 보호)에 의거하여 본 조사목적 이외의 다른 목적으로 사용되지 않습니다.<br/>
				</p> <br/>
				<p style="text-align:right;">2018년 1월</p>
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주관기관 : 전주대 학술정보 Glocal Master 양성사업단<br/>(TEL. 063-220-4786) <br/>
				- 수행기관 : (주)한국정보통계<br/> (TEL. 063-288-0488)<br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="start();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;" value="다음"/></td>
		</tr>
	</table>
	
	<div style="width:100%;display:none;" id="section1">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">글로벌<br/>역량<br/>영역</td>
				<td colspan="2">
					<font style="font-weight:bold;">기초역량 강화를 위한 비학점 교육프로그램</font><br/>(자체학습모임과 연계)
				</td>
			</tr>
			<tr>
				<td>1) 영어회화</td>
				<td>2) 영문법 및 독해</td>
			</tr>
			<tr>
				<td>3) 기초전공한자</td>
				<td>4) 데이터베이스</td>
			</tr>
			<tr>
				<td>5) 정보처리기사</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q1c" value="y"/></td>
				<td class="radioTd"><input type="radio" name="q1c" value="n"/></td>
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
				<td class="radioTd"><input type="radio" name="q1k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q1k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q1k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q1k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q1k" value="5"/></td>
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
				<td class="radioTd"><input type="radio" name="q1m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q1m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q1m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q1m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q1m" value="5"/></td>
			</tr>
		</table>
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<td>
					<textarea name="q1Etc" rows="5" style="width:99%;font-size:14px;" placeholder="교육프로그램에 불만족했다면 그 이유와 개선방안을 기술해 주세요!"></textarea>
				</td>
			</tr>			
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('1');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
	</div>
	
	<div style="width:100%;display:none;" id="section2">
		<h4 class="cate">■ 교육프로그램 영역</h4>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>영역</th>
				<th>내용</th>
			</tr>
			<tr>
				<td rowspan="4" style="text-align:center;border-right:1px solid #ddd;font-weight:bold;">진로/취업<br/>탐색영역</td>
				<td>
					<font style="font-weight:bold;">진로 적성검사 프로그램 실시 및 CA상담 진행</font><br/>(1,2학년 대상 실시)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q2c" value="y"/></td>
				<td class="radioTd"><input type="radio" name="q2c" value="n"/></td>
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
				<td class="radioTd"><input type="radio" name="q2k" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q2k" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q2k" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q2k" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q2k" value="5"/></td>
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
				<td class="radioTd"><input type="radio" name="q2m" value="1"/></td>
				<td class="radioTd"><input type="radio" name="q2m" value="2"/></td>
				<td class="radioTd"><input type="radio" name="q2m" value="3"/></td>
				<td class="radioTd"><input type="radio" name="q2m" value="4"/></td>
				<td class="radioTd"><input type="radio" name="q2m" value="5"/></td>
			</tr>
		</table>
		<br/>
		<button type="button" onclick="nextQuestion('2');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>
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
					<font style="font-weight:bold;">진로탐색을 위한 외부전문가 초청특강</font><br/>(진로탐색 시간을 활용, 총 5회 실시)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3c" value="y"/></td>
				<td class="radioTd"><input type="radio" name="q3c" value="n"/></td>
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
					<font style="font-weight:bold;">진로 및 취업정보 공유캠프(2차년도 신설)</font><br/>(11개 기관 전문가들을 통한 진로, 취업정보 공유)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3c" value="y"/></td>
				<td class="radioTd"><input type="radio" name="q3c" value="n"/></td>
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
					<font style="font-weight:bold;">진로 및 취업정보 공유캠프(테스트)</font><br/>(11개 기관 전문가들을 통한 진로, 취업정보 공유)
				</td>
			</tr>
		</table>
		
		<table style="padding:2px;border:1px solid #000000;width:100%;">
			<tr>
				<th>참여</th>
				<th>불참여</th>
			</tr>
			<tr>
				<td class="radioTd"><input type="radio" name="q3c" value="y"/></td>
				<td class="radioTd"><input type="radio" name="q3c" value="n"/></td>
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
		<button type="button" onclick="nextQuestion('4');" style="border-radius:4px;width:100%;background-color:#F2CB61;height:30px;font-weight:bold;font-size:16px;">다음</button>				
	</div>
</div>
</body>
</html>