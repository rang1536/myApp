<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018 신규시책 발굴을 위한 도민여론조사</title>
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
	
	/* 7번질문 기타 선택시 입력창 포커스주기 */
	$(document).on('click','#q7EtcRadio',function(){
		$('#q7Etc').focus();
	});
	
	/* 인사말 > 응답자 정보문항 */
	$(document).on('click','#nextBtn',function(){
		$('#intro').css('display','none');
		$('#user').css('display','');
	});
	
	/* 응답자정보 > 질문1 */
	$(document).on('click','#userInfo',function(){
		$('#intro').css('display','none');
		if($('input:radio[name="gender"]:checked').length < 1){
			alert('성별을 선택하세요');
			return;
		}else if($('input:radio[name="age"]:checked').length < 1){
			alert('연령대를 선택하세요');
			return;
		}else if($('input:radio[name="local"]:checked').length < 1){
			alert('지역을 선택하세요');
			return;
		}else if($('input:radio[name="job"]:checked').length < 1){
			alert('직업을 선택하세요');
			return;
		}
		
		$('#user').css('display','none');
		$('#q1Table').css('display','');
	});
	
	/* 질문1 > 2 */
	$(document).on('click','.q1',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','');
	});
	
	/* 질문2 > 3 */
	$(document).on('click','.q2',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','');
	});
	
	/* 질문3 > 4 */
	$(document).on('click','.q3',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','');
	});
	
	/* 질문4 > 5 */
	$(document).on('click','.q4',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','');
	});
	
	/* 질문5 > 6 */
	$(document).on('click','.q5',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','');
	});
	
	/* 질문6 > 7 */
	$(document).on('click','.q6',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','none');
		$('#q7Table').css('display','');
	});
	
	/* 질문7 > 8 */
	$(document).on('click','.q7',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','none');
		$('#q7Table').css('display','none');
		$('#q8Table').css('display','');
	});
	
	/* 질문8 > 9 */
	$(document).on('click','.q8',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','none');
		$('#q7Table').css('display','none');
		$('#q8Table').css('display','none');
		$('#q9Table').css('display','');
	});
	
	/* 질문9 > 10 */
	$(document).on('click','.q9',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','none');
		$('#q7Table').css('display','none');
		$('#q8Table').css('display','none');
		$('#q9Table').css('display','none');
		$('#q10Table').css('display','');
	});
	
	/* 질문10 > 11 */
	$(document).on('click','.q10',function(){
		$('#intro').css('display','none');
		$('#user').css('display','none');
		$('#q1Table').css('display','none');
		$('#q2Table').css('display','none');
		$('#q3Table').css('display','none');
		$('#q4Table').css('display','none');
		$('#q5Table').css('display','none');
		$('#q6Table').css('display','none');
		$('#q7Table').css('display','none');
		$('#q8Table').css('display','none');
		$('#q9Table').css('display','none');
		$('#q10Table').css('display','none');
		$('#q11Table').css('display','');
	});
	
	/* 질문11 > 12 */
	$(document).on('click','.q11',function(){
		$('#surveyForm').submit();
	});
	
	$(document).ready(function(){
		var date = new Date();
		
		var nowDate = date.getFullYear() + "년 " + (date.getMonth()+1) + "월 " + date.getDate() + "일 " + date.getHours() + "시 "+date.getMinutes()+"분 ";
		$('#nowDate').append(nowDate);
	});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int poNum=0;
	if(request.getParameter("PO_NUM") != null){
		
		poNum = Integer.parseInt(request.getParameter("PO_NUM"));
	}else{
		poNum = 0;
	}	
%>
<div class="container">
	<h2 style="text-align:center;background-color:#ddd;">2018년 신규시책 발굴을 위한 도민여론조사</h2>
	
	<table style="padding:4px;border:1px solid #000000;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;font-size:25px;"><font id="nowDate" style="background-color:#F2CB61;"></font>현재 설문이 모두 완료되었습니다.<br/>
				2018년 신규시책 발굴을 위한 도민여론조사 설문에 참여해주셔서 감사드립니다. </p> <br/>
				<p style="text-align:right;">2017년 8월</p>
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관 : 전라북도청 <br/>
				- 조사기관 : (주)한국정보통계 <br/>
				- 담&nbsp; 당 &nbsp;자 : 조화연 연구원 / 063-288-0488 <br/>
				- 회&nbsp; 신&nbsp; 처 : Fax. 063-232-0466 / Email. girinhy@gmail.com <br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;" /></td>
		</tr>
	</table>
	<br/><br/><br/><br/>
	
	<%-- <form id="surveyForm" action="<%=request.getContextPath()%>/18/0816_Input.jsp" method="post">
		<input type="hidden" name="poNum" value="<%=poNum %>"/>
		<!-- 1.응답자 인적사항 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="user">
			<tr>
				<th colspan="4">응답자 인적사항</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남성"/>남성 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여성"/>여성				
				</td>
			</tr>
			<tr>
				<th>연령</th>
				<td>
					<input type="radio" name="age" value="20"/>20대
					<input type="radio" name="age" value="30"/>30대
					<input type="radio" name="age" value="40"/>40대
					<input type="radio" name="age" value="50"/>50대
					<input type="radio" name="age" value="60"/>60대이상
				</td>
			</tr>
			<tr>
				<th>거주<br/>구역</th>
				<td>
					<input type="radio" name="local" value="01.전주덕진"/>전주덕진
					<input type="radio" name="local" value="02.전주완산"/>전주완산<br/>
					<input type="radio" name="local" value="04.익산"/>익산 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="03.군산"/>군산<br/>
					<input type="radio" name="local" value="07.김제"/>김제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="05.정읍"/>정읍<br/>
					<input type="radio" name="local" value="06.남원"/>남원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="10.무주"/>무주<br/>
					<input type="radio" name="local" value="09.진안"/>진안 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="13.순창"/>순창<br/>
					<input type="radio" name="local" value="11.장수"/>장수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="08.완주"/>완주<br/>
					<input type="radio" name="local" value="15.부안"/>부안 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="14.고창"/>고창<br/>
					<input type="radio" name="local" value="12.임실"/>임실 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<input type="radio" name="job" value="1.농림어업"/>농림어업<br/>
					<input type="radio" name="job" value="2차 산업"/>제조업 등 2차 산업<br/>
					<input type="radio" name="job" value="3차 서비스업"/>상업 등 3차 서비스업<br/>
					<input type="radio" name="job" value="4.전문직"/>의사, 법조인, 기자등 전문직<br/>
					<input type="radio" name="job" value="5.공무원"/>공무원, 군인<br/>
					<input type="radio" name="job" value="6.비경제활동"/>학생,주부 등 비경제활동<br/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;" id="userInfo" value="다음"/></td>
			</tr>
		</table>
	
		<!--도정 핵심과제 - 문항1  -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q1Table">
			<tr>
				<th colspan="2">도정 핵심과제</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					1. '2020 전북 대도약' 을 위해 전라북도가 중점 추진해야 할 핵심과제는 무엇이라고 생각합니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q1" class="q1" value="1"/></td>
				<td>
					대통령 임기 내 속도감 있는 새만금 개발				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q1" class="q1" value="2"/></td>
				<td>
					종자, 식품 등 5개 농생명클러스터를 연계한 농생명산업 수도로 육성				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q1" class="q1" value="3"/></td>
				<td>
					전북혁신도시를 연기금,농생명 특화 금융중심지로 조성				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q1" class="q1" value="4"/></td>
				<td>
					전북투어패스와 4차산업 연계 문화콘텐츠 개발				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q1" class="q1" value="5"/></td>
				<td>
					한국탄소산업진흥원 설립 등 탄소산업을 성장동력 산업으로 육성				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
	
		<!--삼락농정 - 문항2,3  -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q2Table">
			<tr>
				<th colspan="2">삼락농정</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					2.농민,농업,농촌이 즐거운 "삼락농정"이 정착되기 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q2" class="q2" value="1"/></td>
				<td>
					청년 농어업 인력 육성 및 귀농,귀촌 지원				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q2" class="q2" value="2"/></td>
				<td>
					농축수산업 생산기반 확충 및 친환경농업 확대			
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q2" class="q2" value="3"/></td>
				<td>
					마을 공동체 회복 및 농어업인 삶의 질 향상				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q2" class="q2" value="4"/></td>
				<td>
					농어촌 자원을 활용한 6차산업육성				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q2" class="q2" value="5"/></td>
				<td>
					농가 소득안정을 위한 지원 확대				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!--삼락농정 - 문항2,3  -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q3Table">
			<tr>
				<th colspan="2">삼락농정</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					3. 농생명,식품분야에서 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q3" class="q3" value="1"/></td>
				<td>
					민간육종단지 인프라 지원체계 구축				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q3" class="q3" value="2"/></td>
				<td>
					ICT 농기계 R&D 및 첨단농업 보급 지원			
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q3" class="q3" value="3"/></td>
				<td>
					국가식품클러스터 활성화 지원				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q3" class="q3" value="4"/></td>
				<td>
					농업,식품,미생물 자원의 산업화 기반 구축				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q3" class="q3" value="5"/></td>
				<td>
					전통식품 및 농식품 가공산업 육성				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 토탈관광. 문항 4 -->
		
		<table style="border:1px solid #000000;width:100%;display:none;" id="q4Table">
			<tr>
				<th colspan="2">토탈관광</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					4.토탈관광 실현을 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q4" class="q4" value="1"/></td>
				<td>
					전북투어패스 지속적 홍보를 통한 활성화 지원				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q4" class="q4" value="2"/></td>
				<td>
					문화유산, 전통공연 등 지역문화자원 연계 문화콘텐츠 개발		
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q4" class="q4" value="3"/></td>
				<td>
					시군별 대표관광지 및 생태관광지 연계 관광코스 개발				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q4" class="q4" value="4"/></td>
				<td>
					대규모 국내외 회의 개최, 전시컨벤션센터 확충 등 MICE산업 육성				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q4" class="q4" value="5"/></td>
				<td>
					외국인 관광객 유치를 통환 세계 속의 '전라북도' 인지도 제고				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 탄소. 문항5 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q5Table">
			<tr>
				<th colspan="2">탄소</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					5.전라북도 미래 먹거리 탄소산업 육성을 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q5" class="q5" value="1"/></td>
				<td>
					연구개발 특구와 연계한 기업유치 및 창업 지원				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q5" class="q5" value="2"/></td>
				<td>
					탄소제품 상용화 촉진 연구개발 강화	
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q5" class="q5" value="3"/></td>
				<td>
					탄소제품 공공구매 등 탄소기업 지원 확대				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q5" class="q5" value="4"/></td>
				<td>
					탄소산업 육성 국가기관 설립,유치				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q5" class="q5" value="5"/></td>
				<td>
					탄소산업 해외시장 개척				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 건설. 문항6,7 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q6Table">
			<tr>
				<th colspan="2">건설</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					6.균형있는 지역발전을 위해 건설교통분야에서 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q6" class="q6" value="1"/></td>
				<td>
					지역특성에 맞는 지역개발사업 추진				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q6" class="q6" value="2"/></td>
				<td>
					새만금 SOC(공항, 항만, 도로) 조기 확충	
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q6" class="q6" value="3"/></td>
				<td>
					지능형 교통시스템을 활용한 교통체계 구축				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q6" class="q6" value="4"/></td>
				<td>
					인재와 신산업이 모이는 산업단지 혁신				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q6" class="q6" value="5"/></td>
				<td>
					혁신도시를 4차 산업혁명의 전진기지로 육성				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 건설. 문항6,7 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q7Table">
			<tr>
				<th colspan="2">건설</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					7.주거환경이 열악한 지역을 개선하는 도시재생 뉴딜사업에서 가장 중요한 것은 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q7" class="q7" value="1"/></td>
				<td>
					지속가능한 양질의 일자리 창출				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q7" class="q7" value="2"/></td>
				<td>
					노후주거지의 생활 밀착형 편의시설 확충	
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q7" class="q7" value="3"/></td>
				<td>
					취약계층을 위한 맞춤형 공동체 주택공급, 개량 지원				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q7" class="q7" value="4"/></td>
				<td>
					지역특성에 맞는 다양한 프로그램 발굴 지원				
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		
		<!-- 환경 문항8 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q8Table">
			<tr>
				<th colspan="2">환경</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					8.일상 속 주민불편 생활환경 개선을 위해 우선 추진해야 할 사업은 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q8" class="q8" value="1"/></td>
				<td>
					악취 관리				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q8" class="q8" value="2"/></td>
				<td>
					생활폐기물 관리
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q8" class="q8" value="3"/></td>
				<td>
					도민 환경교육 및 적극 참여 유도				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q8" class="q8" value="4"/></td>
				<td>
					환경오염물질 배출사업장 관리				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q8" class="q8" value="5"/></td>
				<td>
					미세먼지 저감대책 마련				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 복지 문항9 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q9Table">
			<tr>
				<th colspan="2">복지</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					9.출산장려를 위해 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q9" class="q9" value="1"/></td>
				<td>
					저출산 극복을 위한 인식,문화개선				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q9" class="q9" value="2"/></td>
				<td>
					국공립 어린이집 확대 등 보육정책 강화
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q9" class="q9" value="3"/></td>
				<td>
					공동육아나눔터 조성				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q9" class="q9" value="4"/></td>
				<td>
					일가정양립 지원 시책 확대				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q9" class="q9" value="5"/></td>
				<td>
					출산장려금, 아동수당 등 재정 지원				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<!-- 새만금 문항10 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q10Table">
			<tr>
				<th colspan="2">새만금</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					10.속도감 있는 새만금 개발을 위해 우선 추진해야 할 사업은 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q10" class="q10" value="1"/></td>
				<td>
					사람과 물류가 쉽게 이동할 수 있도록 도로,공항 등 건설			
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q10" class="q10" value="2"/></td>
				<td>
					새만금 개발계획대로 추진할 수 있도록 내부용지 매립
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q10" class="q10" value="3"/></td>
				<td>
					새만금산업단지 기업유치를 통한 지역경제 활성화				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q10" class="q10" value="4"/></td>
				<td>
					머물러가는 새만금 조성을 위한 관광인프라 건설				
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q10" class="q10" value="5"/></td>
				<td>
					글로벌 경쟁력을 갖춘 첨단농업용지 조성				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		
		<!-- 대외 혹은 잼버리 문항11 -->
		<table style="border:1px solid #000000;width:100%;display:none;" id="q11Table">
			<tr>
				<th colspan="2">대외</td>
			</tr>
			<tr>
				<td colspan="2" style="font-weight:bold;">
					11.지난 16일 폴란드와의 치열한 접전 끝에 '2023 세계 잼버리' 최종 개최지로 결정된 우리 도가 대회 유치 효과를 극대화하기 위해 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q11" class="q11" value="1"/></td>
				<td>
					새만금 ~ 전주 고속도로, 국제공항 등 접근성 향상을 위한 SOC조기 건설			
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q11" class="q11" value="2"/></td>
				<td>
					잼버리 프로그램을 활용한 도내 관광자원 연계 관광상품 개발
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q11" class="q11" value="3"/></td>
				<td>
					새만금의 세계적 명소화를 통한 새만금 및 전북 브랜드 가지 제고			
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="q11" class="q11" value="4"/></td>
				<td>
					청소년 관련 부대행사 등 청소년 문화체험 활동의 중심지 조성			
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width:100%;background-color:#ddd;" /></td>
			</tr>
		</table>
		
		<table style="border:1px solid #000000;width:100%;display:none;" id="q12Table">
			<tr>
				<td style="width:100%;background-color:#ddd;">끝까지 응답해주셔서 감사합니다</td>
			</tr>
		</table>
		
		
	</form> --%>
</div>
</body>
</html>