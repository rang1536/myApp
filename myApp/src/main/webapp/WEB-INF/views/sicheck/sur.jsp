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
	function nextPage(order){
		//console.log(order)
		if(order == 0){
			$('#intro').css('display','none');
			$('#user').slideDown();
		}else if(order == 1){
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
			
			addSuvUser();
		}else if(order >= 2 && order <= 11){ 
			upDateQ(order);
		}else if(order == 12){
			$('#no').val('');
			window.location.reload(true);
		}
	}
	
	//중간 문항 답 입력
	function upDateQ(cnt){
		var no = $('#no').val();
		var order = cnt-1;
		if($('input:radio[name="q'+order+'"]:checked').length < 1){
			alert('답변을 골라주세요~!!');
			return;
		}
		var ans = $('input:radio[name="q'+order+'"]:checked').val();
		//console.log('답확인 : '+ans);
		//console.log('no확인 : '+no);
		$.ajax({
			url : 'upDateQ',
			data : {'no':no, 'order':order, 'ans':ans},
			dataType : 'json',
			type : 'post',
			success : function(data){
				if(data.result == 'succ'){
					$('.qTable').css('display','none');
					$('#q'+cnt+'Table').slideDown();
				}else{
					alert('응답내용 중간저장에 실패하였습니다. 계속 응답을 진행하시려면 063-288-0488로 문의바랍니다. 죄송합니다');
					return;
				}							
			}
		})
	}
	
	//인구통계변수 응답자 응답등록
	function addSuvUser(){
		var data = $('#userInfo').serialize();
		console.log('data : '+data);
		
		$.ajax({
			url : 'addSurUser',
			data : data,
			dataType : 'json',
			type : 'post',
			success : function(data){
				//console.log(data)
				if(data.result == 'succ'){
					//console.log('succ');
					$('#no').val(data.no);
					/* localStorage.setItem('no', data.no);
					console.log('저장확인 : '+localStroage.getItem('no'));	 */
					
					$('#user').css('display','none');
					$('.qTable').css('display','none');
					$('#q1Table').slideDown();
				}else{
					alert('응답자 등록오류! 063-288-0488로 전화부탁드립니다~!! 담당 박민수 연구원');
					return;
				} 
			}
		})
	}
</script>
</head>
<div class="container">
	<h2 style="text-align:center;background-color:#ddd;">2019년 신규시책 발굴을 위한 도민여론조사</h2>
	<input type="hidden" name="no" id="no"/>
	<table style="padding:4px;border:1px solid #000000;" id="intro">
		<tr>
			<td>
				<p style="font-weight:bold;font-size:20px;">
					전라북도 민선7기 비전은 『아름다운 山河 웅비하는 생명의 삶터, 천년전북』입니다. 전북이 간직한 가장 아름다운 산과 들, 강과 바다를 잘 지키고 가꾸어 새로운 문명을 여는 새만금과 함께 전북대도약의 시대를 열어나가겠습니다.<br/>
				</p> <br/>
				<p style="text-align:right;">2018년 8월</p>
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관 : 전라북도청 <br/>
				- 조사기관 : (주)한국정보통계 <br/>
				- 담&nbsp; 당 &nbsp;자 : 박민수 연구원 / 063-288-0488 <br/>
				- 회&nbsp; 신&nbsp; 처 : Fax. 063-232-0466 / Email. facypole@daum.net <br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(0);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">조사시작</button></td>
		</tr>
	</table>
	<br/>
	
	
	<!-- 1.응답자 인적사항 -->
	<form id="userInfo" method="post" onsubmit="return false;" >
		<input type="hidden" name="poNum" id="poNum" value="${poNum }"/>
		<table style="border:1px solid #000000;width:100%;display:none;font-size:16px;" id="user">
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
					<input type="radio" name="local" value="1"/>전주덕진
					<input type="radio" name="local" value="2"/>전주완산<br/>
					<input type="radio" name="local" value="4"/>익산 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="3"/>군산<br/>
					<input type="radio" name="local" value="7"/>김제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="5"/>정읍<br/>
					<input type="radio" name="local" value="6"/>남원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="10"/>무주<br/>
					<input type="radio" name="local" value="9"/>진안 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="13"/>순창<br/>
					<input type="radio" name="local" value="11"/>장수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="8"/>완주<br/>
					<input type="radio" name="local" value="15"/>부안 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="local" value="14"/>고창<br/>
					<input type="radio" name="local" value="12"/>임실 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<input type="radio" name="job" value="1"/>농림어업<br/>
					<input type="radio" name="job" value="2"/>제조업 등 2차 산업<br/>
					<input type="radio" name="job" value="3"/>상업 등 3차 서비스업<br/>
					<input type="radio" name="job" value="4"/>의사, 법조인, 기자 등 전문직<br/>
					<input type="radio" name="job" value="5"/>공무원, 군인<br/>
					<input type="radio" name="job" value="6"/>학생,주부 등 비경제활동<br/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="nextPage(1);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
			</tr>
		</table>
	</form>
	
	<!--도정 핵심과제 - 문항1  -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q1Table" class="qTable">
		<tr>
			<th colspan="2">도정 5대목표</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				1. 전라북도가 대도약을 이루기 위해 중점적으로 추진해야 할 핵심과제는 무엇이라고 생각합니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q1" class="q1" value="1"/></td>
			<td>
				『삼락농정 농생명산업』을 통해 농업수도로 대도약				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q1" class="q1" value="2"/></td>
			<td>
				4차 산업혁명에 대응하는 『융복합 미래신산업』육성				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q1" class="q1" value="3"/></td>
			<td>
				한국적인 관광자원과 문화콘텐츠 등으로 만들어 가는 『여행체험 1번지』				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q1" class="q1" value="4"/></td>
			<td>
				새만금 연계 SOC 구축 등을 통해 열어가는 『새만금시대 세계잼버리』				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q1" class="q1" value="5"/></td>
			<td>
				도내 어디서든 살고 싶은 전북을 만들기 위한 『안전·복지·환경·균형』실현			
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(2);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!--삼락농정 - 농생명산업 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q2Table" class="qTable">
		<tr>
			<th colspan="2">삼락농정 농생명산업</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				2.삼락농정 농생명산업으로 전라북도를 농업수도로 만들어 가기 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q2" class="q2" value="1"/></td>
			<td>
				농어가 소득안정을 위한 지원 확대				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q2" class="q2" value="2"/></td>
			<td>
				제 값받는 농식품 유통체계 구축			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q2" class="q2" value="3"/></td>
			<td>
				스마트 팜 등 ICT 융복합 미래 첨단농업 지원				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q2" class="q2" value="4"/></td>
			<td>
				종자산업 육성 및 국가식품클러스터 투자유치 확대				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q2" class="q2" value="5"/></td>
			<td>
				청년 창업농 육성 및 귀어농·귀어촌 지원				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(3);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!--삼락농정 - 미래신산업  -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q3Table" class="qTable">
		<tr>
			<th colspan="2">융복합 미래신산업</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				3. 전라북도의 산업구조 개편과 대체산업 육성을 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q3" class="q3" value="1"/></td>
			<td>
				자율주행차, 해양 무인시스템 등 지능형 신산업 육성				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q3" class="q3" value="2"/></td>
			<td>
				항공·의료분야 응용범위 확대로 탄소 융복합산업 성장기반 확충			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q3" class="q3" value="3"/></td>
			<td>
				수상태양광·해상풍력 등 신재생에너지 클러스터 구축				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q3" class="q3" value="4"/></td>
			<td>
				혁신도시, 연기금과 연계한 농생명 특화 금융타운 조성				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q3" class="q3" value="4"/></td>
			<td>
				홀로그램·VR 등 융복합 콘텐츠 육성			
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(4);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!-- 새만금시대 세계잼버리. 문항 4 -->	
	<table style="border:1px solid #000000;width:100%;display:none;" id="q4Table" class="qTable">
		<tr>
			<th colspan="2">새만금시대 세계잼버리</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				4. 새만금시대 세계잼버리로 전북대도약을 이루기 위해 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q4" class="q4" value="1"/></td>
			<td>
				새만금 국제공항, 새만금 신항만, 도로, 철도 등 주요 인프라 구축			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q4" class="q4" value="2"/></td>
			<td>
				누구나 참신한 아이디어를 테스트 할 수 있는 규제혁신특구 지정		
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q4" class="q4" value="3"/></td>
			<td>
				2023 세계잼버리와 고군산군도를 연계한 관광인프라 구축				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q4" class="q4" value="4"/></td>
			<td>
				대규모 국제행사 새만금 유치				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q4" class="q4" value="5"/></td>
			<td>
				새만금산업단지 조기조성과 기업유치를 통한 지역경제 활성화				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(5);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!-- 여행체험1번지. 문항5 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q5Table" class="qTable">
		<tr>
			<th colspan="2">여행체험 1번지</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				5. 여행체험 1번지 실현을 위해 중점 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q5" class="q5" value="1"/></td>
			<td>
				대규모 국내외 회의 개최, 전시컨벤션센터 확충 등 MICE산업 육성				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q5" class="q5" value="2"/></td>
			<td>
				경쟁력 있고 특화된 거점 대표 관광지 육성 및 활성화	
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q5" class="q5" value="3"/></td>
			<td>
				문화유산, 전통공연 등 지역문화자원 연계 문화 ICT 콘텐츠 개발				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q5" class="q5" value="4"/></td>
			<td>
				작지만 특색있는 문화시설 확충				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q5" class="q5" value="5"/></td>
			<td>
				도내 역사문화콘텐츠로 다양한 융복합 여행체험 산업 육성				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(6);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!--안전복지환경균형. 문항6,7 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q6Table" class="qTable">
		<tr>
			<th colspan="2">안전·복지·환경·균형</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				6. 안전한 전라북도를 만드는데 가장 필요한 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q6" class="q6" value="1"/></td>
			<td>
				안전을 생활화 하는 안전문화 확산				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q6" class="q6" value="2"/></td>
			<td>
				위험지역 시설 개보수 추진
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q6" class="q6" value="3"/></td>
			<td>
				재난대비 교육 및 훈련 강화				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q6" class="q6" value="4"/></td>
			<td>
				안전점검 및 지도 강화				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(7);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!--안전복지환경균형. 문항6,7,8 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q7Table" class="qTable">
		<tr>
			<th colspan="2">안전·복지·환경·균형</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				7. 안전한 전라북도를 실현하기 위해 소방분야에서 중점 추진해야 할 사업은 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q7" class="q7" value="1"/></td>
			<td>
				소방관서 설치 등 소방안전 인프라 확대				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q7" class="q7" value="2"/></td>
			<td>
				소방시설 점검 등 화재예방정책 강화	
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q7" class="q7" value="3"/></td>
			<td>
				소방차 길 터주기 등 안전의식 개선 및 도민 안전교육 확대			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q7" class="q7" value="4"/></td>
			<td>
				재난현장 대응역량 배양을 위한 소방대원 훈련 강화				
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><button onclick="nextPage(8);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	
	<!-- 환경 문항8 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q8Table" class="qTable">
		<tr>
			<th colspan="2">안전·복지·환경·균형</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				8. 포용적 복지실현을 위해 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q8" class="q8" value="1"/></td>
			<td>
				기초생활급여 확대 등 저소득 빈곤가구 생활보장				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q8" class="q8" value="2"/></td>
			<td>
				취약계층 자활지원을 통한 탈수급 유도
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q8" class="q8" value="3"/></td>
			<td>
				노인일자리 확충 및 건강한 노후생활 보장			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q8" class="q8" value="4"/></td>
			<td>
				장애인 자립생활 향상을 위한 탈시설 정책 지원				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q8" class="q8" value="5"/></td>
			<td>
				민관협력 및 찾아가는 복지 서비스 확대				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(9);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!-- 복지 문항9 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q9Table" class="qTable">
		<tr>
			<th colspan="2">안전·복지·환경·균형</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				9. 일상 속 주민불편 생활환경 개선을 위해 우선 추진해야 할 사업은 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q9" class="q9" value="1"/></td>
			<td>
				악취 관리				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q9" class="q9" value="2"/></td>
			<td>
				생활폐기물 관리
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q9" class="q9" value="3"/></td>
			<td>
				환경오염물질 배출사업장 관리			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q9" class="q9" value="4"/></td>
			<td>
				미세먼지 저감대책 마련			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q9" class="q9" value="5"/></td>
			<td>
				도시열섬 완화 정책 마련			
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(10);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<!-- 새만금 문항10 -->
	<table style="border:1px solid #000000;width:100%;display:none;" id="q10Table" class="qTable">
		<tr>
			<th colspan="2">안전·복지·환경·균형</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">
				10. 지역발전을 위해 우선 추진해야 할 과제는 무엇이라고 생각하십니까?
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q10" class="q10" value="1"/></td>
			<td>
				지역특성에 맞는 지역개발사업 추진			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q10" class="q10" value="2"/></td>
			<td>
				버스정보시스템(BIS) 등 지능형 교통체계 구축
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q10" class="q10" value="3"/></td>
			<td>
				공항, 항만, 도로 등 SOC 조기 확충				
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q10" class="q10" value="4"/></td>
			<td>
				청년·신혼부부 공공임대주택 공급 주거안정			
			</td>
		</tr>
		<tr>
			<td><input type="radio" name="q10" class="q10" value="5"/></td>
			<td>
				지적재조사를 통한 토지정보 구축 및 재산권 보호				
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(11);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">다음</button></td>
		</tr>
	</table>
	
	<table style="border:1px solid #000000;width:100%;display:none;" id="q11Table" class="qTable">
		<tr>
			<td style="width:100%;background-color:#ddd;">끝까지 응답해주셔서 감사합니다</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="nextPage(12);" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:25px;">처음으로 돌아가기</button></td>
		</tr>
	</table>
		
		
	
</div>
</body>
</html>