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
	var checkSectionNum = new Array();
	
	$(document).ready(function(){
		//영화 14번문항 선택값 조건이벤트
		$('input[name="cQ114"]').change(function(){
			$('.qTbody').css('display','none');
			
			if($(this).val() == 1){
				$('#cQ115Tbody').slideDown();
			}else if($(this).val() == 2){
				$('#cQ116Tbody').slideDown();
			}else if($(this).val() == 3){
				$('#cQ117Tbody').slideDown();
			}
		})	
		
		//방송 14번문항 선택값 조건이벤트
		$('input[name="cQ214"]').change(function(){
			$('.qTbody').css('display','none');
			
			if($(this).val() == 1){
				$('#cQ215Tbody').slideDown();
			}else if($(this).val() == 2){
				$('#cQ216Tbody').slideDown();
			}else if($(this).val() == 3){
				$('#cQ217Tbody').slideDown();
			}
		})
		
		//음악 14번문항 선택값 조건이벤트
		$('input[name="cQ314"]').change(function(){
			$('.qTbody').css('display','none');
			
			if($(this).val() == 1){
				$('#cQ315Tbody').slideDown();
			}else if($(this).val() == 2){
				$('#cQ316Tbody').slideDown();
			}else if($(this).val() == 3){
				$('#cQ317Tbody').slideDown();
			}
		})	
		
		//게임 18번문항 선택값 조건이벤트
		$('input[name="cQ418"]').change(function(){
			$('.qTbody').css('display','none');
			
			if($(this).val() == 1){
				$('#cQ419Tbody').slideDown();
			}else if($(this).val() == 2){
				$('#cQ420Tbody').slideDown();
			}else if($(this).val() == 3){
				$('#cQ421Tbody').slideDown();
			}
		})
		
		//웹툰 14번문항 선택값 조건이벤트
		$('input[name="cQ514"]').change(function(){
			$('.qTbody').css('display','none');
			
			if($(this).val() == 1){
				$('#cQ515Tbody').slideDown();
			}else if($(this).val() == 2){
				$('#cQ516Tbody').slideDown();
			}else if($(this).val() == 3){
				$('#cQ517Tbody').slideDown();
			}
		})	
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
		}else if(nowPageNum == 3){
			if(part3()){
				if(checkSectionNum[0] > 0){
					$('#section3').css('display','none');
					$('#section4').slideDown();
				}else if(checkSectionNum[1] > 0){
					$('#section3').css('display','none');
					$('#section5').slideDown();
				}else if(checkSectionNum[2] > 0){
					$('#section3').css('display','none');
					$('#section6').slideDown();
				}else if(checkSectionNum[3] > 0){
					$('#section3').css('display','none');
					$('#section7').slideDown();
				}else if(checkSectionNum[4] > 0){
					$('#section3').css('display','none');
					$('#section8').slideDown();
				}else{
					$('#section3').css('display','none');
					$('#section9').slideDown();
				}
			}
		}else if(nowPageNum == 4){
			if(checkSectionNum[1] > 0){
				$('#section4').css('display','none');
				$('#section5').slideDown();
			}else if(checkSectionNum[2] > 0){
				$('#section4').css('display','none');
				$('#section6').slideDown();
			}else if(checkSectionNum[3] > 0){
				$('#section4').css('display','none');
				$('#section7').slideDown();
			}else if(checkSectionNum[4] > 0){
				$('#section4').css('display','none');
				$('#section8').slideDown();
			}else{
				$('#section4').css('display','none');
				$('#section9').slideDown();
			}
			
		}else if(nowPageNum == 5){
			if(checkSectionNum[2] > 0){
				$('#section5').css('display','none');
				$('#section6').slideDown();
			}else if(checkSectionNum[3] > 0){
				$('#section5').css('display','none');
				$('#section7').slideDown();
			}else if(checkSectionNum[4] > 0){
				$('#section5').css('display','none');
				$('#section8').slideDown();
			}else{
				$('#section5').css('display','none');
				$('#section9').slideDown();
			}
			
		}else if(nowPageNum == 6){
			if(checkSectionNum[3] > 0){
				$('#section6').css('display','none');
				$('#section7').slideDown();
			}else if(checkSectionNum[4] > 0){
				$('#section6').css('display','none');
				$('#section8').slideDown();
			}else{
				$('#section6').css('display','none');
				$('#section9').slideDown();
			}
			
		}else if(nowPageNum == 7){
			if(checkSectionNum[4] > 0){
				$('#section7').css('display','none');
				$('#section8').slideDown();
			}else{
				$('#section7').css('display','none');
				$('#section9').slideDown();
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
	
	function part3(){
		var chk1 = 0, chk2 = 0, chk3 = 0, chk4 = 0, chk5 = 0;
		
		if($('input:radio[name="kQ11"]').is(':checked')){
			if($('input:radio[name="kQ11"]:checked').val() == '1'){
				if($('input:text[name="kQ11Etc"]').val() == null || $('input:text[name="kQ11Etc"]').val() == ''){
					alert('영화를 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk1++;
				}
			}
		}
		
		if($('input:radio[name="kQ12"]').is(':checked')){
			if($('input:radio[name="kQ12"]:checked').val() == '1'){
				if($('input:text[name="kQ12Etc"]').val() == null || $('input:text[name="kQ12Etc"]').val() == ''){
					alert('영화를 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk1++;
				}
			}
		}
		
		if($('input:radio[name="kQ21"]').is(':checked')){
			if($('input:radio[name="kQ21"]:checked').val() == '1'){
				if($('input:text[name="kQ21Etc"]').val() == null || $('input:text[name="kQ21Etc"]').val() == ''){
					alert('방송을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk2++;
				}
			}
		}
		
		if($('input:radio[name="kQ22"]').is(':checked')){
			if($('input:radio[name="kQ22"]:checked').val() == '1'){
				if($('input:text[name="kQ22Etc"]').val() == null || $('input:text[name="kQ22Etc"]').val() == ''){
					alert('방송을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk2++;
				}
			}
		}
		
		if($('input:radio[name="kQ31"]').is(':checked')){
			if($('input:radio[name="kQ31"]:checked').val() == '1'){
				if($('input:text[name="kQ31Etc"]').val() == null || $('input:text[name="kQ31Etc"]').val() == ''){
					alert('음악을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk3++;
				}
			}
		}
		
		if($('input:radio[name="kQ32"]').is(':checked')){
			if($('input:radio[name="kQ32"]:checked').val() == '1'){
				if($('input:text[name="kQ32Etc"]').val() == null || $('input:text[name="kQ32Etc"]').val() == ''){
					alert('음악을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk3++;
				}
			}
		}
		
		if($('input:radio[name="kQ41"]').is(':checked')){
			if($('input:radio[name="kQ41"]:checked').val() == '1'){
				if($('input:text[name="kQ41Etc"]').val() == null || $('input:text[name="kQ41Etc"]').val() == ''){
					alert('게임을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk4++;
				}
			}
		}
		
		if($('input:radio[name="kQ42"]').is(':checked')){
			if($('input:radio[name="kQ42"]:checked').val() == '1'){
				if($('input:text[name="kQ42Etc"]').val() == null || $('input:text[name="kQ42Etc"]').val() == ''){
					alert('게임을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk4++;
				}
			}
		}
		
		if($('input:radio[name="kQ51"]').is(':checked')){
			if($('input:radio[name="kQ51"]:checked').val() == '1'){
				if($('input:text[name="kQ51Etc"]').val() == null || $('input:text[name="kQ51Etc"]').val() == ''){
					alert('게임을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk4++;
				}
			}
		}
		
		if($('input:radio[name="kQ52"]').is(':checked')){
			if($('input:radio[name="kQ52"]:checked').val() == '1'){
				if($('input:text[name="kQ52Etc"]').val() == null || $('input:text[name="kQ52Etc"]').val() == ''){
					alert('게임을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk4++;
				}
			}
		}
		
		if($('input:radio[name="kQ61"]').is(':checked')){
			if($('input:radio[name="kQ61"]:checked').val() == '1'){
				if($('input:text[name="kQ61Etc"]').val() == null || $('input:text[name="kQ61Etc"]').val() == ''){
					alert('웹툰을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk5++;
				}
			}
		}
		
		if($('input:radio[name="kQ62"]').is(':checked')){
			if($('input:radio[name="kQ62"]:checked').val() == '1'){
				if($('input:text[name="kQ62Etc"]').val() == null || $('input:text[name="kQ62Etc"]').val() == ''){
					alert('웹툰을 입수·시청한 경험이 있으시면 건수를 입력해주세요');
					return false;
				}else{
					chk5++;
				}
			}
		}
		
		checkSectionNum[0] = chk1;
		checkSectionNum[1] = chk2;
		checkSectionNum[2] = chk3;
		checkSectionNum[3] = chk4;
		checkSectionNum[4] = chk5;
		
		return true;
	}
</script>
</head>
<body>
<div class="container">
	<h2 style="text-align:center;background-color:#F2CB61;;">แบบสอบถามสำรวจสถานะของการสำรวจลิขสิทธิ์ในต่างประเทศ</h2>
	
	<table style="padding:4px;border:1px solid #000000;width:100%;" id="intro">
		<tr>
			<td style="width:100%;">
				<p style="font-weight:bold;">
					<font id="nowDate" style="background-color:#F2CB61;"></font>
					&nbsp;เรียนทุกท่าน<br/><br/>
					&nbsp;เราคือหน่วยงานวิจัย 'Corp. Korea Information Stats' เรากำลังตรวจสอบการใช้   "การใช้ผลงานของเกาหลี"<br/><br/>
					&nbsp;ในแบบสำรวจนี้ไม่มีคำตอบที่ถูกหรือผิดสำหรับคำถามของเราเพียงแต่ใช้เพื่อการวิเคราะห์ทางสถิติเท่านั้น <br/>
					&nbsp;โดยไม่ใช้เพื่อจุดประสงค์อื่น ดังนั้นโปรดตอบตามความคิดของคุณ <br/>
					&nbsp;แบบสำรวจนี้จะใช้เวลาประมาณ 20 นาทีโปรดตอบคำถามทั้งหมด <br/><br/>
					&nbsp;ขอขอบคุณอย่างจริงใจที่สละเวลาเข้าร่วมตอบแบบสอบถาม <br/> 
				</p> <br/>
				
			</td>
		</tr>
		<tr>
			<td style="border-top:1px dotted #ddd;">
				- ผู้จัดงาน : สมาคมส่งเสริมลิขสิทธิ์ต่างประเทศ <br/>
				- ดำเนินการโดย : Corp. Korea Information Stats<br/><br/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="start();" style="width:100%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:17px;">NEXT</button></td>
		</tr>
	</table>
	
	<!-- 파트1. Demography -->	
	<div style="width:100%;display:none;" id="section1">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ส่วนที่ 1.</font> ประชากรศาสตร์
		</p>
		<br/>
		
		<form id="demographyForm">
			<table style="width:100%;border:1px solid #ddd;">
				<tr>
					<th style="width:50%;background-color:#ddd;">Question</th>
					<th style="width:50%;background-color:#ddd;" colspan="2">Answer</th>
				</tr>
				<tr>
					<td class="qTd">D_Q1. [เพศ] เพศของคุณคืออะไร?  </td>
					<td class="aTd"><input type="radio" name="dQ1" value="1" /> ชาย</td>
					<td class="aTd"><input type="radio" name="dQ1" value="2" /> หญิง</td>
				</tr>
				<tr>
					<td class="qTd">D_Q2. [อายุ] คุณอายุเท่าไหร่ </td>
					<td class="aTd" colspan="2"> <input type="text" name="dQ2"/> ปี</td>
				</tr>
				<tr>
					<td class="qTd">D_Q3. [ที่อยู่] ที่อยู่ปัจจุบันของคุณอยู่ที่ไหน ?</td>
					<td class="aTd" style="width:25%;"><input type="radio" name="dQ3" value="1" /> Korea</td>
					<td class="aTd"><input type="radio" name="dQ3" value="2" /> Thailand</td>
				</tr>
				<tr>
					<td class="qTd" rowspan="3">D_Q4. [อาชีพ] อาชีพของคุณคืออะไร?[เลือกได้คำตอบเดียว]</td>
					<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="1" /> นักเรียนมัธยมหรือต่ำกว่า </td>
					<td class="aTd"><input type="radio" name="dQ4" value="2" /> นักศึกษาวิทยาลัย </td>
				</tr>
				<tr>
					<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="3" /> แรงงาน</td>
					<td class="aTd"><input type="radio" name="dQ4" value="4" /> แม่บ้าน</td>
				</tr>
				<tr>
					<td class="aTd"><input type="radio" name="dQ4" value="5" /> ว่างงาน</td>
					<td class="aTd" style="width:25%;"><input type="radio" name="dQ4" value="6" /> อื่น ๆ (<input type="text" name="dQ4Etc" />)</td>
				</tr>
				<tr>
					<td class="qTd">D_Q5. จำนวนคนในครอบครัวที่อยู่ด้วยกันครอบครัวของคุณมีกี่คน ?</td>
					<td class="aTd" colspan="2"> <input type="text" name="dQ5"/> รวมทุกคน</td>
				</tr>
				<tr>
					<td class="qTd">D_Q6. [รายได้ส่วนบุคคล] รายได้เฉลี่ยต่อเดือนสำหรับแต่ละเดือนของคุณคือเท่าไหร่ </td>
					<td class="aTd" colspan="2"> <input type="text" name="dQ6"/> </td>
				</tr>
				<tr>
					<td class="qTd">D_Q7. [รายได้ของครอบครัว] รายได้รวมต่อเดือนเฉลี่ยของครอบครัวทั้งหมดคือเท่าใด </td>
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
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ส่วนที่2 .</font> การรับรู้การคุ้มครองลิขสิทธิ์
		</p>
		<br/>
		
		<form id="part2Form">
			<table style="width:100%;border:1px solid #ddd;">
				<tr>
					<th style="width:50%;background-color:#ddd;">Question</th>
					<th style="width:50%;background-color:#ddd;" colspan="2">Answer</th>
				</tr>
				<tr>
					<td class="qTd" rowspan="8">R_Q1. คุณแยกงานที่ถูกกฎหมายและงานที่ลอกเลียนแบบทางออนไลน์ได้ด้วยเหตุผลใด?</td>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="1" /> ประเภทของโฆษณาที่แสดงในแบนเนอร์ของเว็ปไซต์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="2" /> การเข้าถึงการใช้ผลงาน เช่นไม่ว่าจะเป็นการชำระเงิน และจำนวนเงินที่ต้องชำระ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="3" /> ช่องทางการเชื่อมต่อเว็บไซต์ (เช่นไม่สามารถเชื่อมต่อโดยตรง, การเข้าถึงโดยพิมพ์ที่อยู่โดยตรง)</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="4" /> คุณภาพของผลงาน เช่น คุณภาพของภาพ,คุณภาพเสียง,คำบรรยาย</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="5" /> มีคำยืนยันว่ามีการระบุลิขสิทธิ์ ในช่องทางการใช้ในงานผลงานนั้น</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="6" /> หากคุณใช้ผลงานโฆษณาฟรีได้ คุณจะสงสัยว่ามันเป็นงานที่ลอกเลียนแบบที่ผิดกฎหมาย </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="7" /> ไม่แยกแยะ </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ1" value="8" /> อื่น ๆ (<input type="text" name="rQ1Etc"/>) </td>
				</tr>
				
				<tr>
					<td class="qTd" rowspan="5">R_Q2. คุณคิดอย่างไรกับการละเมิดลิขสิทธิ์เนื่องจากการจำหน่ายและ การใช้งานลอกเลียนแบบละเมิดลิขสิทธิ์</td>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="1" /> ไม่ร้ายแรงเลย</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="2" /> ไม่ร้ายแรง </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="3" /> เป็นเรื่องปกติ </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="4" /> ร้ายแรง </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ2" value="5" /> ร้ายแรงมาก </td>
				</tr>
				
				<tr>
					<td class="qTd" rowspan="11">R_Q3. คุณคิดว่าวิธีใดมีประสิทธิภาพมากที่สุดในการกำจัดสำเนาลอกเลียนแบบที่ผิดกฎหมาย?</td>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="1" /> กำจัดสำเนาที่ผิดกฎหมายและปิดช่องทางที่งานสำเนาลอกเลียนแบบที่ผิดกฎหมายสามารถเผยแผ่ได้ และการควบคุมอย่างเคร่งครัด</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="2" /> ลงโทษผู้ผลิตและผู้อัปโหลดสำเนาลอกเลียนแบบที่ผิดกฎหมาย (รวมถึงบุคคลที่ส่งแชร์)</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="3" /> 불법 복제물 업로더(공유한 자) 처벌</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="4" /> ผู้ประกอบการต้องลงโทษเว็บไซต์แชร์สำเนาที่ผิดกฎหมาย</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="5" /> การลงโทษผู้ดาวน์โหลดสำเนาที่ลอกเลียนแบบผิดกฎหมาย (ผู้ใช้)</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="6" /> การศึกษาและการส่งเสริมการคุ้มครองลิขสิทธิ์ </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="7" /> การเสริมสร้างกฎหมายคุ้มครองลิขสิทธิ์ </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="8" /> มาตรการคุ้มครองทางเทคนิค </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="9" /> ลดราคาของเนื้อหาของแท้ </td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="10" /> การขยายผลงานของแท้ที่มีอยู่ (การรักษาความปลอดภัยเนื้อหาการขยายช่องทางการใช้งาน ฯลฯ )</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding:1%;height:20px;"><input type="radio" name="rQ3" value="11" /> อื่น ๆ (<input type="text" name="rQ3Etc"/>) </td>
				</tr>
				
				<tr>
					<td class="qTd" colspan="2">R_Q4. การรับรู้และระดับการปฏิบัติตามลิขสิทธิ์ของคุณอยู่ในระดับใด</td>
				</tr>
			</table>
			<table style="width:100%;border:1px solid #ddd;">
				<tr>
					<th rowspan="2" style="width:9%;background-color:#ddd;">ประเภท</th>
					<th style="width:9%;background-color:#ddd;">ต่ำที่สุด</th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;">ปกติ</th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;"></th>
					<th style="width:9%;background-color:#ddd;">สูงที่สุด</th>
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
					<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;">1.ระดับการรับรู้</td>
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
					<td style="text-align:center;border-right:1px solid #ddd;border-bottom:1px solid #ddd;">2.ระดับการปฏิบัติตาม</td>
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
					<td class="qTd" style="width:50%;">R_Q5. คุณมีประสบการณ์เข้าการฝึกอบรมข้อมูลหรือสื่อส่งเสริมการขายที่เกี่ยวข้องกับการคุ้มครองลิขสิทธิ์หรือไม่?</td>
					<td class="aTd" style="text-align:center;height:20px;width:25%;"><input type="radio" name="rQ5" value="1" /> มี</td>
					<td class="aTd" style="text-align:center;height:20px;width:25%;"><input type="radio" name="rQ5" value="2" /> ไม่มี</td>
				</tr>		
			</table>
			
			<br/><br/>
			<div style="text-align:center;">
				<button type="button" onclick="next('2');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
			</div>
		</form>
	</div>
	
	<div style="width:100%;display:none;" id="section3">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ส่วนที่3.</font> สถานะการใช้งานของประเภทผลงานจองเกาหลีตามช่องทางการจัดจำหน่าย
		</p>
		<div style="width:100%;padding:1%;">
			<p style="width:90%;border:1px solid #000000;padding:1%;">
				* คำอธิบาย<br/>
				จัดเก็บ - การดาวน์โหลด โดยการซื้อแพ็คเกจหรือคัดลอกไฟล์หรือการดาวน์โหลดเนื้อหาไปไฟล์ของตนเอง<br/>
				การชม - การดูไฟล์โดยไม่ได้ดาวน์โหลด เช่น ผ่านการสตรีมมิ่ง<br/>
				ชำระเงิน - คุณซื้อเนื้อหาของแท้สำหรับราคาซื้อปลีก<br/>
				ฟรี - การเข้าถึงเนื้อหาอย่างฟรีไม่ต้องเสียเงินหรือราคาที่ต่ำกว่าราคาที่ระบุไว้
			</p>
		</div>
		
		<form id="part3Form">
			<table style="width:100%;border:1px solid #ddd;">
				<!-- <tr>
					<th style="background-color:#ddd;" colspan="3">문항</th>
					<th style="background-color:#ddd;" colspan="3">답변</th>
				</tr> -->
				<tr>
					<td class="qTd" colspan="6">K_Q1. โปรดระบุว่าคุณมีประสบการณ์ซื้อ,จัดเก็บหรือรับชมผลงานของภาพยนตร์เกาหลี,รายการทีวีต่างๆ,เพลง,เกมและเว็บการ์ตูนผ่านอินเทอร์เน็ตโทรศัพท์มือถือหรือร้านค้าในช่วง 3 เดือน</td>
				</tr>
				<tr>
					<th rowspan="2" colspan="2" style="width:20%;background-color:#ddd;">ประเภท</th>
					<th colspan="2" style="background-color:#ddd;">การรับ</th>
					<th colspan="2" style="background-color:#ddd;">การชม(เพลย์)</th>
				</tr>
				<tr>
					<th style="width:12%;background-color:#ddd;">ประสบการณ์</th>
					<th style="width:12%;background-color:#ddd;">จำนวน</th>
					<th style="width:12%;background-color:#ddd;">ประสบการณ์</th>
					<th style="width:12%;background-color:#ddd;">จำนวน</th>
				</tr>
				<tr>
					<td class="aTd" colspan="2">ภาพยนต์</td>
					<td class="aTd" style="width:20%;text-align:center;">
						<input type="radio" name="kQ11" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ11" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ11Etc" style="width:70%;"/> จำนวน </td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ12" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ12" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ12Etc" style="width:70%;"/> จำนวน </td>
				</tr>
				<tr>
					<td class="aTd" colspan="2">รายการต่างๆ</td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ21" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ21" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ21Etc" style="width:70%;"/> จำนวน </td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ22" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ22" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ22Etc" style="width:70%;"/> จำนวน </td>
				</tr>
				<tr>
					<td class="aTd" colspan="2">เพลง</td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ31" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ31" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ31Etc" style="width:70%;"/> จำนวน </td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ32" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ32" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ32Etc" style="width:70%;"/> จำนวน </td>
				</tr>
				<tr>
					<td class="aTd" style="width:10%;" rowspan="2">เกม</td>
					<td class="aTd" style="width:20%;">ออนไลน์</td>
					<td class="aTd" style="width:20%;">
						<!-- <input type="radio" name="kQ41" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ41" value="2"/> ไม่มี -->
					</td>
					<td class="aTd" style="width:10%;"><!-- <input type="text" name="kQ41Etc" style="width:70%;"/> จำนวน  --></td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ42" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ42" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ42Etc" style="width:70%;"/> จำนวน </td>
				</tr>
				<tr>
					<td class="aTd" style="width:20%;">ออฟไลน์</td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ51" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ51" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ51Etc" style="width:70%;"/> จำนวน </td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ52" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ52" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ52Etc" style="width:70%;"/> จำนวน </td>
				</tr>
				<tr>
					<td class="aTd" colspan="2">เว็บการ์ตูน</td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ61" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ61" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ61Etc" style="width:70%;"/> จำนวน </td>
					<td class="aTd" style="width:20%;">
						<input type="radio" name="kQ62" value="1"/> มี&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="kQ62" value="2"/> ไม่มี
					</td>
					<td class="aTd" style="width:10%;"><input type="text" name="kQ62Etc" style="width:70%;"/> จำนวน </td>
				</tr>
			</table>
			
			<br/><br/>
			<div style="text-align:center;">
				<button type="button" onclick="next('3');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
			</div>
		</form>
	</div>
	
	<div style="width:100%;display:none;" id="section4">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ ส่วนที่ 4.</font> ภาพยนตร์ (รวมภาพเคลื่อนไหว)
		</p>
		
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq1-1 -->
			<tr>
				<td class="qTd">C_Q1. ในส่วนของภาพยนตร์ที่คุณมีทั้งหมด คุณจัดเก็บ,ครอบครองและชมภาพยนตร์เกาหลีทั้งหมดอัตราส่วนเท่าใด ?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ11"/> %</td>
			</tr>
			
			<!-- cq1-2 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q2. ภาพยนตร์เกาหลีประเภทไหนที่คุณมักจะชม?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="1"/> ผจญภัย</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="2"/> เอนิเมชั่น </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="3"/> ตื่นเต้นเร้าใจ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="4"/> สงคราม</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="5"/> SF ไซไฟ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="6"/> ตลก</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="7"/> ทำนอง / โรแมนติก</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="8"/> สยองขวัญ (สยองขวัญ)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="9"/> แอ็คชั่น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="10"/> ประวัติศาสตร์</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="11"/> อาชญากรรม</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="12"/> ดนตรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="13"/> แฟนตาซี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="14"/> ลึกลับ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ12" value="15"/> อื่น ๆ</td>
			</tr>
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq1-3 -->
			<tr>
				<td class="qTd" colspan="5">C_Q3. โปรดระบุจำนวนภาพยนตร์ฟรีภาพยนตร์และภาพยนตร์ที่จัดเก็บในช่วงสามเดือนที่ผ่านมาทั้งฟรีและชำระเงิน</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ฟรี</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ชำระเงิน </th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ชม</th>
				<th class="aTd" style="background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ชม</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">ออนไลน์<br/>หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">การกระจายเนื้อหาโดยผู้ประกอบการ / ผู้ประกอบการที่เฉพาะเจาะจง</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A11" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13A14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">เผยแพร่ผ่านเว็บไซต์แบ่งปันวิดีโอ (YouTube และอื่น ๆ )</td>
				<td class="aTd"><input type="text" name="cQ13A21" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">จัดจำหน่ายผ่านเว็บไซต์ลิงค์ / เว็บไซต์ที่มีคนมากมาย</td>
				<td class="aTd"><input type="text" name="cQ13A31" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">เผยแพร่โดย P2P site / ซอฟต์แวร์ P2P</td>
				<td class="aTd"><input type="text" name="cQ13A41" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">จัดจำหน่ายตามบริการจัดเก็บข้อมูล (รวมถึงไซต์แชร์ไฟล์)</td>
				<td class="aTd"><input type="text" name="cQ13A51" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">การกระจายระหว่างคนรู้จักผ่านทางอีเมลหรือโปรแกรมส่งข้อความด่วน</td>
				<td class="aTd"><input type="text" name="cQ13A61" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd"><input type="text" name="cQ13A71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ13A74" style="width:70%;"/> จำนวน</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">แพ็คเกจ<br/>หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ขายแพคเกจที่ร้านค้าจริง</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13B13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">การขายบรรจุภัณฑ์ทางไปรษณีย์โดยนิตยสารและทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B23" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">ขายแพ็คเกจผ่านอินเทอร์เน็ต</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B33" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">จัดจำหน่ายแพคเกจตามการประมูล ฯลฯ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B43" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">ขายฮาร์ดไดร์ฟภายนอกที่มีเนื้อหาหรือบริการที่คัดลอกเนื้อหาเช่นฮาร์ดไดรฟ์หรือหน่วยความจำ USB</td>
				<td class="aTd"><input type="text" name="cQ13B51" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B53" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">ขายแพคเกจ ณ สถานที่จัดงาน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B63" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">แพ็คเกจเช่า</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B73" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">การกระจายบรรจุภัณฑ์ในหมู่คนรู้จัก</td>
				<td class="aTd"><input type="text" name="cQ13B81" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13B83" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="5" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV·<br/>ภาพยนตร์</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ดูการแพร่ภาพทางโทรทัศน์ภาคพื้นดิน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13C12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ13C14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">ดูทีวีดาวเทียม</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C22" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">เคเบิลทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C32" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">ดูในโรงภาพยนตร์</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">การใช้เครื่องคาราโอเกะ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C52" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ13C54" style="width:70%;"/> จำนวน</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq1-4 -->
			<tr>
				<td class="qTd">C_Q4. คุณจ่ายเท่าไหร่เพื่อรับและชมภาพยนตร์เกาหลีในช่วง3เดือนที่ผ่านมา? </td>
				<td class="aTd" colspan="2"><input type="text" name="cQ14"/> </td>
			</tr>
			
			<!-- cq1-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. เพื่อรับภาพยนตร์เกาหลีฟรีในข้อ <font style="color:blue">C_Q3 </font>คุณถึงใช้ช่องทางบ่อยที่สุด?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="1"/> เข้าถึงและใช้งานง่าย</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="2"/> คุ้นเคยกับสถานที่ที่ฉันใช้อย่างต่อเนื่อง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="3"/> ปลอดภัยจากไวรัส</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="4"/> อเต็มไปด้วยผลงานต่าง ๆ มากกว่าช่องทางอื่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="5"/> ไม่คิดว่าสามารถบล็อกหรือปิดกั้นช่องทางได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="6"/> ฉันไม่รู้จักช่องทางอื่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="7"/> ไม่สะดวก มีแต่โฆษณา</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ15" value="8"/> อื่น ๆ(<input type="text" name="cQ15Etc"/>)</td>
			</tr>
			
			<!-- cq1-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. คุณรู้จักภาพยนตร์เกาหลีฟรีได้อย่างไร?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="1"/> เว็บไซต์ของเจ้าของผลงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="2"/> เว็บไซต์ข่าว</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="3"/> เว็บไซต์ที่จัดเก็บผลงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="4"/> ทีวี / วิทยุ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="5"/> คำพูด (รีวิว) </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="6"/> คาเฟ่,บล็อก , สังคมออนไลน์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="7"/> ผ่านคนรู้จักเช่นเพื่อนและเพื่อนร่วมงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ16" value="8"/> อื่น ๆ(<input type="text" name="cQ16Etc"/>)</td>
			</tr>
			
			<!-- cq1-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. จัดเก็บ(คัดลอกหรือดาวน์โหลด)หรือดูภาพยนตร์เกาหลีฟรี อุปกรณ์เชื่อมต่อใดที่คุณใช้ กรุณาเลือกอุปกรณ์ที่เกี่ยวข้องทั้งหมด</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="1"/> คอมพิวเตอร์(ตนเองหรือครอบครัวเป็นเจ้าของ) </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="2"/> คอมพิวเตอร์ (ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="6"/> เครื่องเล่น MP4</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="8"/> อื่น ๆ<br/>(<input type="text" name="cQ17Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ17" value="9"/> ซื้อจากอินเทอร์เน็ต (การสตรีมหรือการซื้อแพ็คเกจเท่านั้น)</td>
			</tr>
			
			<!-- cq1-8 -->
			<tr>
				<td class="qTd" rowspan="10">C_Q8. ทำไมคุณถึงรับหรือจัดเก็บผลงานภาพยนตร์เกาหลีฟรี กรุณาเลือกทั้งหมด</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="1"/> ราคาถูกหรือฟรี</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="2"/> ฉันไม่คิดว่ามันคุ้มค่าที่จะที่จ่ายเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="3"/> วิธีเดียวที่จะดูผลงานที่ต้องการ คือการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="4"/> สะดวกกว่าผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="5"/> ฉันคิดว่าการดูผลงานฟรีไม่ได้เป็นเรื่องร้ายแรง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="6"/> เพราะหลายคนใช้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="7"/> เพราะสามารถสตรีมมิ่งหรือดาวน์โหลดผลงานต่อรายการ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="8"/> สามารถใช้งานได้เร็วกว่าผลงานที่ชำระเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="9"/> เพราะฉันใช้ได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ18" value="10"/> อื่น ๆ(<input type="text" name="cQ18Etc"/>)</td>
			</tr>
			
			<!-- cq1-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. คุณรู้หรือไม่ว่าคุณกำลังซื้อภาพยนตร์เกาหลีของแท้หรือผิดกฎหมาย?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="2"/> รู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ19" value="3"/> รู้</td>
			</tr>
			
			<!-- cq1-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">ในคำถามข้างต้น  <font style="color:blue">C_Q9 หากคุณตอบว่า②รู้บ้าง③รู้โปรดตอบคำถามต่อไปนี้ </font><br/>C_Q9_1. หากคุณตอบว่าคุณเป็นภาพยนตร์เกาหลีแท้หรือผิดกฎหมายเมื่อคุณซื้อหรือรับชมบนอินเทอร์เน็ตหรือแพ็คเกจ โปรดตอบคำถามต่อไปนี้ ไม่ว่าจะเป็นของแท้หรือของละเมิดลิขสิทธิ์มันมีผลต่อความพร้อมใช้งานและการรับชมของท่านหรือไม่?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="1"/> การจัดเก็บหรือการรับชมมาไม่มีอิทธิพลใด ๆ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะได้รับชมผลิตภัณฑ์ของแท้หากคุณได้รับของละเมิดลิขสิทธิ์ก็รับชม</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="3"/> มีเฉพาะผลิตภัณฑ์ของแท้เท่านั้น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ191" value="4"/> เนื่องจากสินค้าของแท้มีราคาแพงจึงรับชมผลิตภัณฑ์ที่ละเมิดลิขสิทธิ์เท่านั้น</td>
			</tr>
			
			<!-- cq1-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. หากเจ้าของสิทธิ์ชาวเกาหลีสามารถอนุญาติให้จัดเก็บและรับชมภาพยนตร์เกาหลีบนอินเทอร์เน็ตได้อย่างถูกกฎหมายได้นั้นต้องใช้เงื่อนไขอะไร โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="1"/> เสียงพากย์เป็นภาษาของประเทศเป้าหมายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="2"/> เสียงพากย์เป็นภาษาอังกฤษหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="3"/> เสียงจะยังคงอยู่ในภาษาของผู้ผลิตผลงานเหมือนเดิม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="4"/> มีคำบรรยายตามภาษาของประเทศเป้าหมาย</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="5"/> มีคำบรรยายภาษาอังกฤษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="6"/> สามารถรับชมผลงานในเวลาเดียวกันกับการออกอากาศของประเทศผู้ผลิตและการฉายที่โรงภาพยนตร์</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="7"/> การรับรู้คุณภาพระดับ HD</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="8"/> ดาวน์โหลดได้</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="9"/> กำหนดราคาตามเวลา (ความจุ) ของผลงาน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="10"/> ผลงานภาษาเกาหลีมีการเผยแพร่ในเว็บไซต์เดียวกัน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="11"/> คุณสามารถค้นหาผลงานที่คุณต้องการรับชมได้อย่างง่ายดาย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="12"/> ไม่มีเงื่อนไขพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="13"/> ฉันไม่ต้องการของแท้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ110" value="14"/> อื่น ๆ(<input type="text" name="cQ110Etc"/>)</td>
			</tr>
			
			<!-- cq1-11 -->
			<tr>
				<td class="qTd">C_Q11. หากคุณปฏิบัติตามเงื่อนไขที่เลือกไว้ในคำถาม  <font style="color:#blue">C_Q10]</font> ข้างต้นและคุณอนุญาตให้เจ้าของเกาหลีได้รับและดูภาพยนตร์เกาหลีบนอินเทอร์เน็ตอย่างถูก กฎหมายคุณต้องการจ่ายต่อเนื้อหาเท่าใด</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ111" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจ คือ"/>)</td>
			</tr>
			
			<!-- cq1-12 -->
			<tr>
				<td class="qTd">C_Q12. คุณเคยแบ่งปันภาพยนตร์เกาหลีฟรีให้กับคนอื่นที่ไม่ใช่ตัวคุณเองหรือให้คุณแชร์ช่องทางของคุณต่อ (โปรดตอบ 'มี' ถ้าคุณมีหนึ่งในนั้น)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ112" value="1"/> มี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ112" value="2"/> ไม่มี</td>
			</tr>
			
			<!-- cq1-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					หากคุณตอบ①ในคำถามข้างต้น ว่า มี แล้วโปรดตอบคำถามต่อไปนี้ <br/>
					C_Q12_1. คุณแชร์ภาพยนตร์เกาหลีฟรีได้อย่างไร กรุณาเลือกทั้งหมด
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="1"/> USB, CD, DVD ออฟไลน์</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="2"/> อัปโหลดไปยังคาเฟ่บล็อก ฯลฯ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="3"/> สังคมออนไลน์(Facebook, Twitter, Instagram ฯลฯ)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="4"/> Torrent</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="5"/> P2P หรือ  web hard sharing </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="6"/> การแชร์ส่วนตัวเช่น (อีเมล KakaoTalk ฯลฯ )</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="7"/> Cloud</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1121" value="8"/> อื่น ๆ(<input type="text" name="cQ1121Etc"/>)</td>
			</tr>
			
			<!-- cq1-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					หากคุณตอบ①ในคำถามข้างต้น ว่า มี แล้วโปรดตอบคำถามต่อไปนี้ <br/>
					C_Q12_2. โปรดเลือกสาเหตุทั้งหมดที่คุณแชร์ภาพยนตร์เกาหลีฟรี
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="1"/> สมาชิกในครอบครัวและเพื่อน ๆ ไม่ทราบวิธีการเข้าถึงผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="2"/> เพราะหลายคนทำ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="3"/> หารายได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="4"/> แชร์แบบไม่เจาะจงผู้รับ </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="5"/> ใช้ผลงานฟรีมากขึ้น</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="6"/> ได้รับคำขอ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="7"/> ไม่มีเหตุผลพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ1122" value="8"/> อื่น ๆ(<input type="text" name="cQ1122Etc"/>)</td>
			</tr>
			
			<!-- cq1-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. คุณจะทำอย่างไรถ้าช่องทางสู่ภาพยนตร์เกาหลีฟรีถูกบล็อกหรือปิด?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="1"/> เลิกใช้ผลงานเอง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="2"/> ใช้ผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="3"/> ค้นหาช่องทางอื่น ๆ ที่ให้บริการฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="4"/> ค้นหาวิธีการข้ามช่องทางที่มีอยู่</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ113" value="5"/> อื่น ๆ (<input type="text" name="cQ113Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq1-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. คุณเพิ่มหรือลดการรับชมภาพยนตร์เกาหลีฟรีในปีนี้ (2019) เมื่อเทียบกับปีที่แล้ว (2018)?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="1"/> (<input type="text" name="cQ1141"/> %) เพิ่ม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="2"/> (<input type="text" name="cQ1142"/> %) ลดลง</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ114" value="3"/> ไม่มีการเปลี่ยนแปลง </td>
			</tr>
			
			<!-- cq1-15 -->
			<tbody id="cQ115Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. โปรดเลือกสาเหตุหลักทั้งหมดที่ทำให้คุณเพิ่มการรับชมภาพยนตร์เกาหลีฟรีเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="1"/> ราคาผลงานที่ต้องชำระสูงมาก</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="2"/> ราคาผลงานฟรีต่ำกว่าปกติ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="3"/> ปริมาณผลงานฟรีที่มีให้สูงกว่าปกติ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="4"/> มีหลายวิธีในการใช้ผลงานฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="5"/> เมื่อปริมาณการใช้ผลงานโดยรวมเพิ่มขึ้น</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="6"/> ผลงานฟรีใช้งานง่าย</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ115" value="7"/> อื่น ๆ(<input type="text" name="cQ115Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq1-16 -->
			<tbody id="cQ116Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. อะไรคือสาเหตุหลักที่ทำให้คุณลดการรับชมภาพยนตร์เกาหลีฟรีเมื่อเทียบกับปีที่แล้ว?</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="1"/> ผลงานหรือช่องทางฟรีสามารถใช้ได้เนื่องจากการบังคับใช้</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="2"/> ราคาของผลงานที่ต้องชำระมีความสมเหตุสมผล</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="3"/> ต้องการซื้อผลงานแบบชำระเงินโดยดูแคมเปญการประชาสัมพันธ์และบทความข่าว ฯลฯ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="4"/> มีปัญหาการละเมิดลิขสิทธิ์,การโดนแฮ็ก,การติดไวรัส ฯลฯ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="5"/> ลดการรับชมผลงานเอง</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="6"/> เพิ่มจำนวนของผลงานที่ชำระเงินโดยการตัดสินใจที่รอบคอบ</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ116" value="7"/> อื่น ๆ(<input type="text" name="cQ116Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq1-17 -->
			<tbody id="cQ117Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. สถานการณ์อะไรที่คุณต้องการหยุดรับชมภาพยนตร์เกาหลีฟรี?</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="1"/> ลดราคาของผลงานที่และบริการที่ต้องชำระเงิน</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="2"/> ลดผลงานที่โดยรวมฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="3"/> ลงโทษและลงโทษผู้ใช้ผลงานที่ฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="4"/> ปรับปรุงการรับรู้ผ่านการศึกษาและการประชาสัมพันธ์เกี่ยวกับการคุ้มครองลิขสิทธิ์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="5"/> ความแตกต่างที่ชัดเจนระหว่างผลงานที่ต้องชำระเงินและผลงานที่ฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="6"/> เสียหายส่วนบุคคลอันเนื่องมาจากการติดไวรัส,การโดนแฮ็ค,ใช้บัตรเครดิตและอื่น ๆ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="7"/> การบังคับใช้และการลงโทษผู้ให้บริการผลงานที่ฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="8"/> รักษาความปลอดภัยจำนวนผลงานที่ต้องชำระ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="9"/> เพิ่มความสะดวกในการใช้ผลงานที่ต้องชำระเงิน (การเข้าถึงวิธีการชำระเงินการทำให้การเข้าสู่ระบบง่ายขึ้น ฯลฯ )</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ117" value="10"/> อื่น ๆ(<input type="text" name="cQ117Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq1-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. คุณกำลังทำอะไรเมื่อเห็นคนรอบตัวคุณใช้หรือซื้อภาพยนตร์เกาหลีฟรี?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="1"/> แบ่งปันข้อมูลที่เกี่ยวข้องกับผลงานที่ฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="2"/> ป้องกันการใช้ผลงานที่ฟรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="3"/> ส่งเสริมการใช้ผลงานที่มีค่าใช้จ่าย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="4"/> อย่าดำเนินการใด ๆ เป็นพิเศษ</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ118" value="5"/> อื่น ๆ(<input type="text" name="cQ118Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('4');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">NEXT</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section5">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶  ส่วนที่  4.</font> การออกอากาศ (ละครโทรทัศน์, วาไรตี้, สารคดี ฯลฯ )
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq2-1 -->
			<tr>
				<td class="qTd">C_Q1. ] รายการทีวีทั้งหมดที่คนมี คุณจัดเก็บและ รับชม รายการของเกาหลีกี่เปอร์เซ็นต์?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ21"/> %</td>
			</tr>
			
			<!-- cq2-2 -->
			<tr>
				<td class="qTd" rowspan="2">C_Q2. รายการออกอากาศของเกาหลีประเภทใดที่รับชมเป็นหลัก?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="1"/> ละคร</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="2"/> ความบันเทิง</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ22" value="3"/> เอนิเมชั่น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="4"/> วัฒนธรรม / สารคดี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="5"/> เพลง</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ22" value="6"/> อื่น ๆ<br/>(<input type="text" name="cQ22Etc" style="width:70%;"/>)</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq2-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. รายการที่ออกอากาศในช่วง 3 เดือนที่ผ่านมาของเกาหลี(ละคร,โทรทัศน์,วาไรตี้,สารคดี ฯลฯ ) ที่ท่านได้จัดเก็บฟรีและจำนวนครั้งที่รับชมฟรี รวมทั้งได้จำนวนครั้งที่รับชมจัดเก็บโดยการชำระเงิน</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ฟรี</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ชำระเงิน</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ชม</th>
				<th class="aTd" style="background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ชม</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">ออนไลน์<br/>หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">การกระจายเนื้อหาโดยผู้ประกอบการ / ผู้ประกอบการที่เฉพาะเจาะจง</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A11" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23A14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">เผยแพร่ผ่านเว็บไซต์แชร์วิดีโอ (YouTube และอื่น ๆ )</td>
				<td class="aTd"><input type="text" name="cQ23A21" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">จัดจำหน่ายผ่านเว็บไซต์ลิงค์ / เว็บไซต์ที่มีคนมากมาย</td>
				<td class="aTd"><input type="text" name="cQ23A31" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">เผยแพร่โดย P2P site / ซอฟต์แวร์ P2P</td>
				<td class="aTd"><input type="text" name="cQ23A41" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">จัดจำหน่ายตามบริการจัดเก็บข้อมูล (รวมถึงไซต์แชร์ไฟล์)</td>
				<td class="aTd"><input type="text" name="cQ23A51" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">การกระจายระหว่างคนรู้จักผ่านทางอีเมลหรือโปรแกรมส่งข้อความด่วน</td>
				<td class="aTd"><input type="text" name="cQ23A61" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd"><input type="text" name="cQ23A71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ23A74" style="width:70%;"/> จำนวน</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">แพ็คเกจห<br/>มุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ขายแพ็คเกจที่ร้านค้าจริง</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23B13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">การขายบรรจุภัณฑ์ทางไปรษณีย์โดยนิตยสารและทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B23" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">ขายแพ็คเกจผ่านอินเทอร์เน็ต</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B33" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">จัดจำหน่ายแพ็คเกจตามการประมูล ฯลฯ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B43" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">ขายฮาร์ดไดร์ฟภายนอกที่มีเนื้อหาหรือบริการที่คัดลอกเนื้อหาเช่นฮาร์ดไดรฟ์หรือหน่วยความจำ USB</td>
				<td class="aTd"><input type="text" name="cQ23B51" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B53" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">ขายแพ็คเกจ ณ สถานที่จัดงาน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B63" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">แพ็คเกจเช่า</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B73" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">การกระจายบรรจุภัณฑ์ในหมู่คนรู้จัก</td>
				<td class="aTd"><input type="text" name="cQ23B81" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23B83" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="5" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV<br/>ภาพยนตร์</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ดูการแพร่ภาพทางโทรทัศน์ภาคพื้นดิน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23C12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ23C14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">ดูทีวีดาวเทียม</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C22" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">เคเบิลทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C32" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">ดูในโรงภาพยนตร์</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">การใช้เครื่องคาราโอเกะ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C52" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ23C54" style="width:70%;"/> จำนวน</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq2-4 -->
			<tr>
				<td class="qTd">C_Q4. คุณจ่ายเท่าไหร่เพื่อรับชมรายการออกอากาศของเกาหลีในช่วงสามเดือนที่ผ่านมา? </td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ24"/> )</td>
			</tr>
			
			<!-- cq2-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. ทำไมคุณถึงใช้ช่องทางในข้อ  <font style="color:blue">C_Q3</font>บ่อยที่สุดเพื่อจัดเก็บรายการออกอากาศเกาหลีฟรี?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="1"/> เข้าถึงและใช้งานง่าย</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="2"/> ฉันคุ้นเคยกับสถานที่ที่ฉันใช้อย่างต่อเนื่อง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="3"/> ปลอดภัยจากการติดไวรัส</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="4"/> มีผลงานมากกว่าช่องทางอื่น ๆ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="5"/> ไม่คิดว่าสามารถบล็อกหรือปิดกั้นช่องทางได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="6"/> ฉันไม่รู้จักช่องทางอื่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="7"/> ไม่สะดวกและมีแต่โฆษณา</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ25" value="8"/> อื่นๆ(<input type="text" name="cQ25Etc"/>)</td>
			</tr>
			
			<!-- cq2-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. คุณทราบได้อย่างไรเกี่ยวกับรายการออกอากาศของเกาหลีฟรี?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="1"/> เว็บไซต์ของเจ้าของผลงาน </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="2"/> เว็บไซต์ข่าว</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="3"/> เว็บไซต์ที่รับผลงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="4"/> ทีวี / วิทยุ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="5"/> คำพูดจากปาก (รีวิว) </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="6"/> คาเฟ่บล็อก, สังคมบนออนไลน์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="7"/> ผ่านคนรู้จักเช่นเพื่อนและเพื่อนร่วมงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ26" value="8"/> อื่น ๆ(<input type="text" name="cQ26Etc"/>)</td>
			</tr>
			
			<!-- cq2-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. เมื่อคุณจัดเก็บ (คัดลอกหรือดาวน์โหลด) หรือดูการแพร่ภาพเกาหลีฟรีคุณใช้อุปกรณ์ใด? กรุณาเลือกอุปกรณ์ที่เกี่ยวข้องทั้งหมด</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="1"/> คอมพิวเตอร์ (ตนเองหรือครอบครัวเป็นเจ้าของ)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="2"/> คอมพิวเตอร์(ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="6"/> เครื่องเล่น MP4</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="8"/> อื่น ๆ<br/>(<input type="text" name="cQ27Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ27" value="9"/> ซื้อจากอินเทอร์เน็ต (การสตรีมมิ่งหรือการซื้อแพ็คเกจเท่านั้น)</td>
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
				<td class="qTd" rowspan="3">C_Q9. คุณทราบหรือไม่ว่าคุณกำลังซื้อสำเนาการออกอากาศเกาหลีที่แท้จริงหรือผิดกฎหมาย?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="2"/> รับรู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ29" value="3"/> รับรู้</td>
			</tr>
			
			<!-- cq2-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">
					ในคำถามข้างต้น  <font style="color:blue">C_Q9 หากคุณ ②รับรู้บ้าง ③รับรู้</font>โปรดตอบคำถามต่อไปนี้<br/>
					C_Q9_1. หากคุณตอบว่าคุณซื้อสำเนาการออกอากาศของเกาหลีผ่านทางอินเทอร์เน็ตหรือแพ็คเกจโปรดตอบคำถามต่อไปนี้ ไม่ว่าจะเป็นของแท้หรือละเมิดลิขสิทธิ์มันมีผลต่อความพร้อมใช้งานและการดูหรือไม่?
				</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="1"/> ไม่มีอิทธิพลต่อการดู, การจัดเก็บ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะจัดเก็บผลิตภัณฑ์ของแท้แต่ หากมีแต่ของลอกเลียนแบบคุณจัดเก็บสำเนาละเมิดลิขสิทธิ์และรับชม</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="3"/> มีเฉพาะผลิตภัณฑ์ของแท้เท่านั้น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ291" value="4"/> เนื่องจากสินค้าของแท้มีราคาแพงจึงมี แต่สำเนาที่ละเมิดลิขสิทธิ์เท่านั้น</td>
			</tr>
			
			<!-- cq2-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. หากผู้ถือสิทธิ์ชาวเกาหลีสามารถอนุญาติให้จัดเก็บและรับชมรายการออกกาศของเกาหลีบนอินเทอร์เน็ตได้อย่างถูกกฎหมายได้นั้นต้องใช้เงื่อนไขอะไร โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="1"/> เสียงพากย์เป็นภาษาของประเทศเป้าหมายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="2"/> เสียงพากย์เป็นภาษาอังกฤษหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="3"/> เสียงจะยังคงอยู่ในภาษาของผู้ผลิตผลงานเหมือนเดิม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="4"/> มีคำบรรยายตามภาษาของประเทศเป้าหมาย</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="5"/> มีคำบรรยายภาษาอังกฤษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="6"/> สามารถรับชมผลงานในเวลาเดียวกันกับการออกอากาศของประเทศผู้ผลิตและการฉายที่โรงภาพยนตร์</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="7"/> การรับรู้คุณภาพระดับ HD</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="8"/> ดาวน์โหลดได้</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="9"/> กำหนดราคาตามเวลา (ความจุ) ของผลงาน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="10"/> ผลงานภาษาเกาหลีมีการเผยแพร่ในเว็บไซต์เดียวกัน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="11"/> คุณสามารถค้นหาผลงานที่คุณต้องการรับชมได้อย่างง่ายดาย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="12"/> ไม่มีเงื่อนไขพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="13"/> ฉันไม่ต้องการของแท้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ210" value="14"/> อื่น ๆ (<input type="text" name="cQ210Etc"/>)</td>
			</tr>
			
			<!-- cq2-11 -->
			<tr>
				<td class="qTd">C_Q11. หากคุณปฏิบัติตามเงื่อนไขที่เลือกไว้ในคำถาม  <font style="color:#blue">C_Q10]</font> ข้างต้นและเจ้าของเกาหลีอนุญาตให้ได้จัดเก็บและรับชมภาพยนตร์เกาหลีบนอินเทอร์เน็ตอย่างถูก กฎหมายคุณต้องการจ่ายต่อเนื้อหาเท่าใด</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ211" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจ คือ"/>)</td>
			</tr>
			
			<!-- cq2-12 -->
			<tr>
				<td class="qTd">C_Q12. คุณเคยแชร์รายการออกอากาศเกาหลีฟรีของคุณหรือแชร์ช่องทางของคุณกับผู้อื่นที่ไม่ใช่ตัวคุณเองหรือไม่ (ถ้าคุณมีประสบการณ์กับสิ่งเหล่านี้โปรดตอบ 'มี')</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ212" value="1"/> มี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ212" value="2"/> ไม่มี</td>
			</tr>
			
			<!-- cq2-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ①ในคำถามข้างต้น ว่า ①มี CQ2-12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_1. คุณแชร์รายการออกอากาศเกาหลีฟรีอย่างไร กรุณาเลือกทั้งหมด?
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="1"/> USB, CD, DVD ออฟไลน์</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="2"/> อัปโหลดไปยัง,บล็อก ฯลฯ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="3"/> สังคมออนไอน์ (Facebook, Twitter, Instagram, ฯลฯ ) </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="4"/> Torrent</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="5"/> P2P หรือ web hard sharing </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="6"/> การแชร์ส่วนตัว (อีเมล KakaoTalk ฯลฯ )</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="7"/> Cloud</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2121" value="8"/> อื่น ๆ(<input type="text" name="cQ2121Etc"/>)</td>
			</tr>
			
			<!-- cq2-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ①ในคำถามข้างต้น ว่า ①มี CQ2-12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_2. โปรดเลือกสาเหตุทั้งหมดที่คุณแชร์รายการออกอากาศเกาหลีฟรี
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="1"/> สมาชิกในครอบครัวและเพื่อน ๆ ไม่ทราบวิธีการเข้าถึงผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="2"/> เพราะหลายคนทำ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="3"/> หารายได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="4"/> แชร์แบบไม่เจาะจงผู้รับ </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="5"/> ใช้ผลงานฟรีมากขึ้น</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="6"/> ฉันได้รับคำขอ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="7"/> ไม่มีเหตุผลพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ2122" value="8"/> อื่น ๆ(<input type="text" name="cQ2122Etc"/>)</td>
			</tr>
			
			<!-- cq2-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. คุณจะทำอย่างไรถ้าช่องทางสู่รายการออกอากาศฟรีของเกาหลีถูกปิดกั้นหรือปิด?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="1"/> เลิกรับชมผลงานเอง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="2"/> ชมผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="3"/> ค้นหาช่องทางอื่น ๆ ที่ให้บริการฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="4"/> ค้นหาวิธีการข้ามช่องทางที่มีอยู่</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ213" value="5"/> อื่น ๆ(<input type="text" name="cQ213Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq2-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. คุณเพิ่มหรือลดการรับชมรายการออกอากาศเกาหลีฟรีปีนี้ (2019) เมื่อเทียบกับปีที่แล้ว (2018)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="1"/> (<input type="text" name="cQ2141"/> %) เพิ่ม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="2"/> (<input type="text" name="cQ2142"/> %) ลดลง</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ214" value="3"/> ไม่มีการเปลี่ยนแปลง </td>
			</tr>
			
			<!-- cq2-15 -->
			<tbody id="cQ215Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. โปรดเลือกเหตุผลหลักทั้งหมดสำหรับการใช้งานรายการออกอากาศเกาหลีฟรีของคุณเพิ่มขึ้นเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="1"/> ราคาผลงานที่ต้องชำระสูงมาก</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="2"/> ราคาผลงานฟรีต่ำกว่าปกติ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="3"/> ปริมาณผลงานฟรีที่มีให้สูงกว่าปกติ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="4"/> มีหลายวิธีในการใช้ผลงานฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="5"/> เมื่อปริมาณการใช้ผลงานโดยรวมเพิ่มขึ้น</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="6"/> ผลงานฟรีใช้งานง่าย</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ215" value="7"/> อื่น ๆ(<input type="text" name="cQ215Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq2-16 -->
			<tbody id="cQ216Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. อะไรคือสาเหตุหลักที่ทำให้คุณลดการจัดเก็บและรับชมรายการออกอากาศฟรีของเกาหลีเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="1"/> ผลงานหรือช่องทางฟรีสามารถใช้ได้เนื่องจากการบังคับใช้</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="2"/> ราคาของผลงานที่ต้องชำระมีความสมเหตุสมผล</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="3"/> ฉันต้องการซื้อผลงานแบบชำระเงินโดยดูแคมเปญการประชาสัมพันธ์บทความข่าว ฯลฯ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="4"/> หากมีปัญหาการละเมิดลิขสิทธิ์,การโดนแฮ็ก,การติดไวรัส ฯลฯ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="5"/> ลดการใช้ผลงานเอง</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="6"/> เพิ่มจำนวนของผลงานที่ชำระเงินโดยการตัดสินใจที่รอบคอบ</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ216" value="7"/> อื่น ๆ(<input type="text" name="cQ216Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq2-17 -->
			<tbody id="cQ217Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. คุณต้องการหยุดรับชมรายการออกอากาศเกาหลีฟรีในสถานการณ์ใด?</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="1"/> ลดราคาของผลงานและบริการที่ต้องชำระเงิน</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="2"/> ลดผลงานโดยรวมฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="3"/> ลงโทษและลงโทษผู้ใช้ผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="4"/> ปรับปรุงการรับรู้ผ่านการศึกษาและการประชาสัมพันธ์เกี่ยวกับการคุ้มครองลิขสิทธิ์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="5"/> ความแตกต่างที่ชัดเจนระหว่างผลงานที่ต้องชำระเงินและผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="6"/> ความเสียหายส่วนบุคคลอันเนื่องมาจากการติดไวรัส,การโดนแฮ็ค,ใช้บัตรเครดิตและอื่น ๆ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="7"/> การบังคับใช้และการลงโทษผู้ให้บริการผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="8"/> รักษาความปลอดภัยจำนวนผลงานที่ต้องชำระเงิน</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="9"/> เพิ่มความสะดวกในการรับผลงานที่ต้องชำระเงิน (การเข้าถึงวิธีการชำระเงินการทำให้การเข้าสู่ระบบง่ายขึ้น ฯลฯ )</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ217" value="10"/> อื่น ๆ(<input type="text" name="cQ217Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq2-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. คุณจะทำอย่างไรเมื่อเห็นผู้คนรอบตัวคุณ ชมหรือซื้อรายการออกอากาศเกาหลีฟรี?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="1"/> แชร์ข้อมูลที่เกี่ยวข้องกับผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="2"/> ป้องกันการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="3"/> ส่งเสริมการใช้ผลงานที่มีค่าใช้จ่าย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="4"/> อย่าดำเนินการใด ๆ เป็นพิเศษ</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ218" value="5"/> อื่น ๆ (<input type="text" name="cQ218Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('5');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">NEXT</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section6">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> เพลง (รวมถึงทำนองของโทรศัพท์มือถือ)
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq3-1 -->
			<tr>
				<td class="qTd">C_Q1. เพลงที่คุณทั้งหมดมีมีเพลงเกาหลีในนั้นคิดเป็นอัตราส่วนเท่าใด?</td>
				<td class="aTd" colspan="3"><input type="text" name="cQ31"/> %</td>
			</tr>
			
			<!-- cq3-2 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q2. ประเภทไหนที่คุณมักจะใช้กับเพลงเกาหลี?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="1"/> เพลงช้า </td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="2"/> เต้น</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ32" value="3"/> แร็พ / ฮิปฮอป</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="4"/> R&B/Soul</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="5"/> เพลงอินดี้</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="6"/> เพลงหนักๆ / ร็อค </td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ32" value="7"/> อื่น ๆ(<input type="text" name="cQ32Etc"/>)</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq3-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. โปรดรายการเพลงเกาหลี (รวมถึงทำนองเพลงของโทรศัพท์) ฟรีในช่วง 3 เดือนที่ผ่านมาและจำนวนผู้ชมจำนวนการเข้าชมที่ต้องชำระและจำนวนที่ฟัง</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ฟรี </th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ชำระเงิน</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ฟัง</th>
				<th class="aTd" style="background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ฟัง</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">ออนไลน์<br/>หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">การกระจายเนื้อหาโดยผู้ประกอบการ / ผู้ประกอบการที่เฉพาะเจาะจง</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A11" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33A14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">เผยแพร่ผ่านเว็บไซต์แบ่งปันวิดีโอ (YouTube และอื่น ๆ )</td>
				<td class="aTd"><input type="text" name="cQ33A21" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">จัดจำหน่ายผ่านเว็บไซต์ลิงค์ / เว็บไซต์ที่มีคนมากมาย</td>
				<td class="aTd"><input type="text" name="cQ33A31" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">เผยแพร่โดย P2P site / ซอฟต์แวร์ P2P</td>
				<td class="aTd"><input type="text" name="cQ33A41" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">จัดจำหน่ายตามบริการจัดเก็บข้อมูล (รวมถึงไซต์แชร์ไฟล์)</td>
				<td class="aTd"><input type="text" name="cQ33A51" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">การกระจายระหว่างคนรู้จักผ่านทางอีเมลหรือโปรแกรมส่งข้อความด่วน</td>
				<td class="aTd"><input type="text" name="cQ33A61" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd"><input type="text" name="cQ33A71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ33A74" style="width:70%;"/> จำนวน</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">แพ็คเกจ<br/>หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ขายแพคเกจที่ร้านค้าจริง</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33B13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">การขายบรรจุภัณฑ์ทางไปรษณีย์โดยนิตยสารและทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B23" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">ขายแพ็คเกจผ่านอินเทอร์เน็ต</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B33" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">จัดจำหน่ายแพคเกจตามการประมูล ฯลฯ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B43" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">ขายฮาร์ดไดรฟ์ภายนอกที่มีเนื้อหาหรือบริการที่คัดลอกเนื้อหาเช่นฮาร์ดไดรฟ์หรือหน่วยความจำ USB</td>
				<td class="aTd"><input type="text" name="cQ33B51" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B53" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">ขายแพคเกจ ณ สถานที่จัดงาน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B63" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">แพ็คเกจเช่า</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B73" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">การกระจายบรรจุภัณฑ์ในหมู่คนรู้จัก</td>
				<td class="aTd"><input type="text" name="cQ33B81" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33B83" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">TV·<br/>ภาพยนต์</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">c-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ดูการแพร่ภาพทางโทรทัศน์ภาคพื้นดิน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33C12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ33C14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-2</td>
				<td class="qTd">ดูทีวีดาวเทียม</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C22" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-3</td>
				<td class="qTd">เคเบิลทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C32" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-4</td>
				<td class="qTd">ดูในโรงภาพยนตร์</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-5</td>
				<td class="qTd">การใช้เครื่องคาราโอเกะ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C52" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-6</td>
				<td class="qTd">ฟังคอนเสิร์ตสด</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C62" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">c-7</td>
				<td class="qTd">ฟังวิทยุกระจายเสียง</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C72" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ33C74" style="width:70%;"/> จำนวน</td>
			</tr>
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">문항</th>
				<th style="background-color:#ddd;" colspan="3">답변</th>
			</tr>
			
			<!-- cq3-4 -->
			<tr>
				<td class="qTd">C_Q4. คุณจ่ายเงินเพื่อซื้อ / ฟังเพลงเกาหลีในช่วงสามเดือนที่ผ่านมาเท่าไหร่? </td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ34"/> )</td>
			</tr>
			
			<!-- cq2-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. ทำไมคุณใช้ช่องทาง CQ3-3 บ่อยที่สุดเพื่อรับเพลงเกาหลีฟรี?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="1"/> เข้าถึงและใช้งานง่าย</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="2"/> ฉันคุ้นเคยกับสถานที่ที่ฉันใช้อย่างต่อเนื่อง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="3"/> ปลอดภัยจากการติดไวรัส </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="4"/> มีผลงานเยอะกว่าช่องทางอื่น </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="5"/> คิดว่าไม่สามารถบล็อกหรือปิดกั้นช่องทางได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="6"/> ฉันไม่รู้จักช่องทางอื่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="7"/> มันไม่สะดวก มีแต่โฆษณา</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ35" value="8"/> อื่น ๆ(<input type="text" name="cQ35Etc"/>)</td>
			</tr>
			
			<!-- cq3-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. คุณรู้จักดนตรีเกาหลีฟรีได้ผ่านทางช่องทางใด?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="1"/> เว็บไซต์ของเจ้าของผลงาน </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="2"/> เว็บไซต์ข่าว</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="3"/> เว็บไซต์ที่รับผลงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="4"/> ทีวี / วิทยุ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="5"/> คำพูด (รีวิว) </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="6"/> คาเฟ่บล็อก สังคมออนไลน์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="7"/> ผ่านคนรู้จักเช่นเพื่อนและเพื่อนร่วมงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ36" value="8"/> อื่น ๆ(<input type="text" name="cQ36Etc"/>)</td>
			</tr>
			
			<!-- cq3-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. ฟรีเมื่อคุณได้รับ (คัดลอกหรือดาวน์โหลด) หรือฟังเพลงเกาหลีคุณใช้อุปกรณ์อะไร? กรุณาเลือกอุปกรณ์ที่เกี่ยวข้องทั้งหมด</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="1"/> คอมพิวเตอร์ (ตัวเองหรือครอบครัวเป็นเจ้าของ)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="2"/> คอมพิวเตอร์(ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="6"/> เครื่องเล่น MP4</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="8"/> อื่น ๆ<br/>(<input type="text" name="cQ37Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ37" value="9"/> ซื้อจากอินเทอร์เน็ต (การสตรีมหรือการซื้อแพ็คเกจเท่านั้น)</td>
			</tr>
			
			<!-- cq3-8 -->
			<tr>
				<td class="qTd" rowspan="10">C_Q8. ทำไมคุณถึงฟังเพลงเกาหลีฟรี กรุณาเลือกทั้งหมด</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="1"/> ราคาถูกหรือฟรี</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="2"/> ฉันไม่คิดว่ามันคุ้มค่าที่จะจ่ายสำหรับผลงานที่จ่ายเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="3"/> วิธีเดียวที่จะใช้ผลงานที่คุณต้องการคือการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="4"/> สะดวกกว่าผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="5"/> ฉันคิดว่าการใช้ผลงานฟรีไม่ได้เป็นเรื่องร้ายแรง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="6"/> เพราะหลายคนใช้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="7"/> เพราะคุณสามารถสตรีมมิ่งหรือดาวน์โหลดผลงานต่อรายการ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="8"/> สามารถใช้งานได้เร็วกว่าผลงานที่ชำระเงิน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="9"/> เพราะฉันเคยใช้ได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ38" value="10"/> อื่น ๆ(<input type="text" name="cQ38Etc"/>)</td>
			</tr>
			
			<!-- cq3-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. คุณทราบหรือไม่ว่าคุณกำลังซื้อสำเนาเพลงเกาหลีฟรีที่แท้จริงหรือผิดกฎหมาย?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="2"/> รับรู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ39" value="3"/> รับรู้</td>
			</tr>
			
			<!-- cq3-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">
					<font style="color:blue">ในคำถามข้างต้น CQ3-9] หากคุณ②รับรู้บ้าง③รับรู้โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q9_1. หากคุณตอบว่าคุณซื้อสำเนาเพลงของเกาหลีผ่านทางอินเทอร์เน็ตหรือแพ็คเกจโปรดตอบคำถามต่อไปนี้ ไม่ว่าจะเป็นของแท้หรือละเมิดลิขสิทธิ์มันมีผลต่อความพร้อมใช้งานและการดูหรือไม่?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="1"/> ไม่มีอิทธิพลต่อการฟัง, การจัดเก็บ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะจัดเก็บผลิตภัณฑ์ของแท้แต่หากมีแต่ของลอกเลียนแบบคุณจัดเก็บสำเนาละเมิดลิขสิทธิ์ ก็รับฟัง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="3"/> มีเฉพาะผลิตภัณฑ์ของแท้เท่านั้น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ391" value="4"/> เนื่องจากสินค้าของแท้มีราคาแพงจึงมี แต่สำเนาที่ละเมิดลิขสิทธิ์เท่านั้น</td>
			</tr>
			
			<!-- cq3-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. หากผู้ถือสิทธิ์เกาหลีสามารถรับและฟังเพลงเกาหลีบนอินเทอร์เน็ตได้อย่างถูกกฎหมายได้นั้นต้องใช้เงื่อนไขอะไร โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="1"/> เสียงพากย์เป็นภาษาของประเทศเป้าหมายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="2"/> เสียงพากย์เป็นภาษาอังกฤษหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="3"/> เสียงจะยังคงอยู่ในภาษาของผู้ผลิตผลงานเหมือนเดิม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="4"/> มีคำบรรยายตามภาษาของประเทศเป้าหมาย</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="5"/> มีคำบรรยายภาษาอังกฤษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="6"/> สามารถรับชมผลงานในเวลาเดียวกันกับการออกอากาศของประเทศผู้ผลิตและการฉายที่โรงภาพยนตร์</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="7"/> การรับรู้คุณภาพระดับ HD</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="8"/> ดาวน์โหลดได้</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="9"/> กำหนดราคาตามเวลา (ความจุ) ของผลงาน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="10"/> ผลงานภาษาเกาหลีมีการเผยแพร่ในเว็บไซต์เดียวกัน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="11"/> คุณสามารถค้นหาผลงานที่คุณต้องการรับชมได้อย่างง่ายดาย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="12"/> ไม่มีเงื่อนไขพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="13"/> ฉันไม่ต้องการของแท้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ310" value="14"/> อื่น ๆ(<input type="text" name="cQ310Etc"/>)</td>
			</tr>
			
			<!-- cq3-11 -->
			<tr>
				<td class="qTd">C_Q11. หากคุณปฏิบัติตามเงื่อนไขที่เลือกไว้ในคำถาม CQ1-10 ข้างต้นและคุณอนุญาตให้เจ้าของเกาหลีได้รับและดูเพลงเกาหลีบนอินเทอร์เน็ตอย่างถูก กฎหมายคุณต้องการจ่ายต่อเนื้อหาเท่าใด</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ311" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจ คือ..."/>)</td>
			</tr>
			
			<!-- cq3-12 -->
			<tr>
				<td class="qTd">C_Q12. คุณเคยแชร์เพลงเกาหลีฟรีของคุณหรือแชร์ช่องทางของคุณกับผู้อื่นที่ไม่ใช่ตัวคุณเองหรือไม่ (ถ้าคุณมีประสบการณ์กับสิ่งเหล่านี้โปรดตอบ 'มี')</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ312" value="1"/> มี </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ312" value="2"/> ไม่มี</td>
			</tr>
			
			<!-- cq3-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบข้อ ①มี ในคำถามข้างต้น C_Q12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_1. คุณแบ่งปันการออกอากาศเกาหลีฟรีอย่างไร กรุณาเลือกทั้งหมด
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="1"/> USB, CD, DVD ออฟไลน์</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="2"/> อัปโหลดไปยัง,บล็อก ฯลฯ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="3"/> SNS(Facebook, Twitter, Instagram ฯลฯ)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="4"/> Torrent</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="5"/> P2P หรือ web hard sharing </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="6"/> การแชร์ส่วนตัว (อีเมล KakaoTalk ฯลฯ )</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="7"/> Cloud</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3121" value="8"/> อื่น ๆ(<input type="text" name="cQ3121Etc"/>)</td>
			</tr>
			
			<!-- cq3-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบข้อ ①มี ในคำถามข้างต้น C_Q12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_2. โปรดเลือกสาเหตุทั้งหมดที่คุณแชร์เพลงเกาหลีฟรี
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="1"/> สมาชิกในครอบครัวและเพื่อน ๆ ไม่ทราบวิธีการเข้าถึงผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="2"/> เพราะหลายคนทำ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="3"/> หารายได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="4"/> แชร์แบบไม่เจาะจงผู้รับ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="5"/> ใช้ผลงานฟรีมากขึ้น</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="6"/> ฉันได้รับคำขอ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="7"/> ไม่มีเหตุผลพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ3122" value="8"/> อื่น ๆ(<input type="text" name="cQ3122Etc"/>)</td>
			</tr>
			
			<!-- cq3-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. คุณจะทำอย่างไรถ้าช่องทางสู่เพลงเกาหลีฟรีของเกาหลีถูกปิดกั้นหรือปิด?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="1"/> เลิกใช้ผลงานเอง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="2"/> ใช้ผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="3"/> ค้นหาช่องทางอื่น ๆ ที่ให้บริการฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="4"/> ค้นหาวิธีการข้ามช่องทางที่มีอยู่</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ313" value="5"/> อื่น ๆ(<input type="text" name="cQ313Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq3-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. คุณเพิ่มหรือลดการใช้งานเพลงเกาหลีฟรีปีนี้ (2019) เมื่อเทียบกับปีที่แล้ว (2018)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="1"/> (<input type="text" name="cQ3141"/> %) เพิ่ม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="2"/> (<input type="text" name="cQ3142"/> %) ลดลง </td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ314" value="3"/> ไม่มีการเปลี่ยนแปลง </td>
			</tr>
			
			<!-- cq3-15 -->
			<tbody id="cQ315Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. โปรดเลือกเหตุผลหลักทั้งหมดสำหรับการใช้งานเพลงเกาหลีฟรีของคุณเพิ่มขึ้นเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="1"/> ราคาผลงานที่ต้องชำระสูงมาก</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="2"/> ราคาผลงานฟรีต่ำกว่าปกติ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="3"/> ปริมาณผลงานฟรีที่มีให้สูงกว่าปกติ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="4"/> มีหลายวิธีในการใช้ผลงานฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="5"/> เมื่อปริมาณการใช้ผลงานโดยรวมเพิ่มขึ้น</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="6"/> ผลงานฟรีใช้งานง่าย</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ315" value="7"/> อื่น ๆ(<input type="text" name="cQ315Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq3-16 -->
			<tbody id="cQ316Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. อะไรคือสาเหตุหลักที่ทำให้คุณลดการจัดเก็บเพลงของเกาหลีฟรีเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="1"/> ผลงานหรือช่องทางฟรีสามารถใช้ได้เนื่องจากการบังคับใช้</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="2"/> ราคาของผลงานที่ต้องชำระมีความสมเหตุสมผล</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="3"/> ฉันต้องการซื้อผลงานแบบชำระเงินโดยดูแคมเปญการประชาสัมพันธ์บทความข่าว ฯลฯ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="4"/> หากมีปัญหาการละเมิดลิขสิทธิ์,การโดนแฮ็ก,การติดไวรัส ฯลฯ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="5"/> ลดการใช้ผลงานเอง</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="6"/> เพิ่มจำนวนของผลงานที่ชำระเงินโดยการตัดสินใจที่รอบคอบ</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ316" value="7"/> อื่น ๆ(<input type="text" name="cQ316Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq3-17 -->
			<tbody id="cQ317Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. คุณต้องการหยุดรับเพลงเกาหลีฟรีในสถานการณ์ใด</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="1"/> ลดราคาของผลงานและบริการที่ต้องชำระเงิน</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="2"/> ลดผลงานโดยรวมฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="3"/> ลงโทษและลงโทษผู้ใช้ผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="4"/> ปรับปรุงการรับรู้ผ่านการศึกษาและการประชาสัมพันธ์เกี่ยวกับการคุ้มครองลิขสิทธิ์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="5"/> ความแตกต่างที่ชัดเจนระหว่างผลงานที่ต้องชำระเงินและผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="6"/> การบาดเจ็บส่วนบุคคลอันเนื่องมาจากการติดไวรัส,การโดนแฮ็ค,ใช้บัตรเครดิตและอื่น ๆ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="7"/> การบังคับใช้และการลงโทษผู้ให้บริการผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="8"/> รักษาความปลอดภัยจำนวนผลงานที่ต้องชำระเงิน</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="9"/> เพิ่มความสะดวกในการรับผลงานที่ต้องชำระเงิน (การเข้าถึงวิธีการชำระเงินการทำให้การเข้าสู่ระบบง่ายขึ้น ฯลฯ )</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ317" value="10"/> อื่น ๆ(<input type="text" name="cQ317Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq3-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. คุณจะทำอย่างไรเมื่อเห็นผู้คนรอบตัวคุณใช้หรือซื้อเพลงเกาหลีฟรี?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="1"/> แบ่งปันข้อมูลที่เกี่ยวข้องกับผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="2"/> ป้องกันการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="3"/> ส่งเสริมการใช้ผลงานที่มีค่าใช้จ่าย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="4"/> อย่าดำเนินการใด ๆ เป็นพิเศษ</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ318" value="5"/> อื่น ๆ(<input type="text" name="cQ318Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('6');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">NEXT</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section7">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> เกมส์
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq4-1 -->
			<tr>
				<td class="qTd">C_Q1. คุณได้จัดเก็บเกมส์ของเกาหลีเท่าไหร่จากเกมทั้งหมดที่คุณได้รับและเล่นคิดเป็นอีตราส่วนเท่าใด ?</td>
				<td class="aTd" colspan="3">(<input type="text" name="cQ41"/> %)</td>
			</tr>
			
			<!-- cq4-2 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q2. เกมส์ของเกาหลีประเภทไหนที่คุณมักใช้?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="1"/> เกมส์ RPG </td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="2"/> เกมส์จำลองกลยุทธ์</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:16%;"><input type="radio" name="cQ42" value="3"/> กีฬา / แข่งรถ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="4"/> เกมส์อาร์เคด / คลาสสิก</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="5"/> ผจญภัย / การยิง</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="6"/> เกมส์ตอบคำถาม / ปริศนา </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="7"/> เกมส์กระดาน </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ42" value="8"/> เกมส์การศึกษา</td>
			</tr>
		</table>
		<table  style="width:100%;border:1px solid #ddd;">
			<!-- cq4-3 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q3. คุณหาข้อมูลเกมส์ของเกาหลีได้จากที่ใด</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;width:50%;"><input type="radio" name="cQ43" value="1"/> เว็บไซต์ของเจ้าของผลงาน </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="2"/> เว็บไซต์ข่าว</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="3"/> เว็บไซต์ที่รับผลงาน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="4"/> ทีวี / วิทยุ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="5"/> คำพูด (รีวิว)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="6"/> คาเฟ่,บล็อก, สังคมออนไลน์</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="7"/> ผ่านคนรู้จักเช่นเพื่อนและเพื่อนร่วมงาน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ43" value="8"/> อื่น ๆ(<input type="text" name="cQ43Etc"/>)</td>				
			</tr>
			
			<tr>
				<td colspan="3" class="aTd" style="background-color:#FFE08C;color:#050099;font-size:16px;">เกมส์ออนไลน์</td>
			</tr>
			
			<!-- cq4-4 -->
			<tr>
				<td class="qTd">C_Q4. คุณเล่นเกมส์เกาหลี (เกมส์ออนไลน์) บ่อยแค่ไหนในช่วง 3 เดือนที่ผ่านมา? </td>
				<td class="aTd" colspan="2">(เฉลี่ยต่อเดือน <input type="text" name="cQ44"/> )</td>
			</tr>
			
			<!-- cq4-5 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q5. โปรดตอบจำนวนเกมส์เกาหลี (เกมส์ออนไลน์) ที่เล่นในช่วง 3 เดือนที่ผ่านมาที่ท่านเสียเสียค่าธรรมเนียม / ฟรี โปรดตอบคำถามและถ้าคุณจ่ายโปรดระบุราคา</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ45" value="1"/> ฟรี (<input type="text" name="cQ451"/>)จำนวน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ45" value="2"/> จ่าย (<input type="text" name="cQ452" style="width:15%;"/>)จำนวน (<input type="text" name="cQ452Etc" placeholder="จำนวน"/>)</td>
			</tr>
			
			<!-- cq4-6 -->
			<tr>
				<td class="qTd" rowspan="6">C_Q6. คุณใช้อุปกรณ์อะไรในการเล่นเกมส์เกาหลี กรุณาเลือกอุปกรณ์ที่ใช้งานได้ทั้งหมด</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="checkbox" name="cQ46" value="1"/> คอมพิวเตอร์(ตนเองหรือครอบครัวเป็นเจ้าของ)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="checkbox" name="cQ46" value="2"/> คอมพิวเตอร์ (ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="6"/> เครื่องเล่น MP4</td>
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
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="11"/> การซื้อทางอินเทอร์เน็ต (การซื้อแพ็คเกจเท่านั้น)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ46" value="12"/> อื่น ๆ<br/>(<input type="text" name="cQ46Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-7 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q7. คุณรู้หรือไม่ว่าการเล่นเกมส์เกาหลี (เกมส์ออนไลน์) เป็นของแท้หรือของละเมิดลิขสิทธิ์?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="2"/> รับรู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ47" value="3"/> รับรู้</td>
			</tr>
			
			<!-- cq4-7-1 -->
			<tr>
				<td class="qTd" rowspan="3">
					<font style="color:blue">ในคำถามข้างต้น CQ4-7] ถ้าคุณตอบว่า ②รับรู้บ้าง ③รับรู้โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q7_1. หากคุณตอบว่าคุณเป็นผู้เล่นเลียนแบบของแท้หรือผิดกฎหมายเมื่อเล่นเกมส์เกาหลี (เกมส์ออนไลน์) โปรดตอบคำถามต่อไปนี้ ของแท้หรือการละเมิดลิขสิทธิ์ส่งผลกระทบต่อการเล่นหรือไม่?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="1"/> ไม่มีผลต่อการเล่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะเล่นของแท้ แต่ถ้าคุณมีเพียงสำเนาที่ละเมิดลิขสิทธิ์ให้เล่นสำเนาที่ละเมิดลิขสิทธิ์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ471" value="3"/> เล่นของแท้เท่านั้น</td>
			</tr>
			
			<!-- cq4-8 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q8. หากเจ้าของผลงานชาวเกาหลีได้อนุญาตให้เล่นเกมส์เกาหลี (เกมส์ออนไลน์) อย่างถูกกฎหมายบนอินเทอร์เน็ตคุณหวังว่าจะเผยแพร่เงื่อนไขอะไรบ้าง โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="1"/> เสียงพากย์เป็นภาษาเป้าหมายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="2"/> จะเป็นเสียงพากย์เป็นภาษาอังกฤษหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="3"/> จะเป็นเสียงที่ยังคงเป็นภาษาของผู้ผลิตเดิมหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="4"/> มันเขียนในภาษาของประเทศที่สำรวจ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="5"/> จะเขียนเป็นภาษาอังกฤษหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="6"/> คุณจะได้รับและดูเกือบจะในเวลาเดียวกันในที่สาธารณะ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="7"/> การรับรู้คุณภาพระดับ HD</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="8"/> ไม่มีเงื่อนไขพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="9"/> ฉันไม่ต้องการเป็นแท้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ48" value="10"/> อื่น ๆ(<input type="text" name="cQ48Etc"/>)</td>
			</tr>
			
			<!-- cq4-9 -->
			<tr>
				<td class="qTd">C_Q9. หากคุณปฏิบัติตามเงื่อนไขที่เลือกในคำถาม C_Q8 ด้านบนและเจ้าของเกาหลีอนุญาตรับและดูเกมส์เกาหลีบนอินเทอร์เน็ตอย่างถูกกฎหมายพวกเขาจะต้องจ่ายเท่าไหร่?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ49" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจ"/>)</td>
			</tr>
			
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<td colspan="7" class="aTd" style="background-color:#FFE08C;color:#050099;font-size:16px;">เกมส์ที่ไม่ใช่ออนไลน์ (ยกเว้นเกมส์ออนไลน์)</td>
			</tr>
			
			<!-- cq4-10 -->
			<tr>
				<td class="qTd" colspan="7">C_Q10. ในช่วง 3 เดือนที่ผ่านมาโปรดระบุ จำนวนในการเล่นเกมที่ต้องชำระและจำนวนที่ได้รับการเล่นฟรี (ไม่รวมเกมส์ออนไลน์)</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ฟรี</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ชำระ</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">เล่น</th>
				<th class="aTd" style="background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">เล่น</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">ออนไลน์หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">การกระจายเนื้อหาโดยผู้ประกอบการ / ผู้ประกอบการที่เฉพาะเจาะจง</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A11" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410A14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">เผยแพร่ผ่านเว็บไซต์แบ่งปันวิดีโอ (YouTube และอื่น ๆ )</td>
				<td class="aTd"><input type="text" name="cQ410A21" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">จัดจำหน่ายผ่านเว็บไซต์ลิงค์ / เว็บไซต์ที่มีคนมากมาย</td>
				<td class="aTd"><input type="text" name="cQ410A31" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">เผยแพร่โดย P2P site / ซอฟต์แวร์ P2P</td>
				<td class="aTd"><input type="text" name="cQ410A41" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">จัดจำหน่ายตามบริการจัดเก็บข้อมูล (รวมถึงไซต์แชร์ไฟล์)</td>
				<td class="aTd"><input type="text" name="cQ410A51" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">การกระจายระหว่างคนรู้จักผ่านทางอีเมลหรือโปรแกรมส่งข้อความด่วน</td>
				<td class="aTd"><input type="text" name="cQ410A61" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd"><input type="text" name="cQ410A71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410A74" style="width:70%;"/> จำนวน</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="8" style="width:10%;text-align:center;border-top:1px solid #ddd;">แพ็กเกจหมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ410B14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">การขายบรรจุภัณฑ์ทางไปรษณีย์โดยนิตยสารและทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">ขายแพ็คเกจผ่านอินเทอร์เน็ต</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">จัดจำหน่ายแพคเกจตามการประมูล ฯลฯ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-5</td>
				<td class="qTd">ขายฮาร์ดไดรฟ์ภายนอกที่มีเนื้อหาหรือบริการที่คัดลอกเนื้อหาเช่นฮาร์ดไดรฟ์หรือหน่วยความจำ USB</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">ขายแพคเกจ ณ สถานที่จัดงาน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ410B62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">แพ็คเกจเช่า</td>
				<td class="aTd"><input type="text" name="cQ410B71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B74" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">การกระจายบรรจุภัณฑ์ในหมู่คนรู้จัก</td>
				<td class="aTd"><input type="text" name="cQ410B81" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B82" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B83" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ410B84" style="width:70%;"/> จำนวน</td>
			</tr>
			
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq4-11 -->
			<tr>
				<td class="qTd">C_Q4. คุณจ่ายเงินเพื่อซื้อและเล่นเกมส์เกาหลี (ไม่ใช่ออนไลน์) เท่าไหร่ในช่วงสามเดือนที่ผ่านมา? </td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ411"/> )</td>
			</tr>
			
			<!-- cq4-12 -->
			<tr>
				<td class="qTd" rowspan="6">C_Q12. ] เมื่อได้รับ (คัดลอกหรือดาวน์โหลด) เกมส์เกาหลี (ยกเว้นเกมส์ออนไลน์) จากอินเทอร์เน็ตอุปกรณ์ใดที่ใช้สำหรับสิ่งนี้?</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="1"/> คอมพิวเตอร์ (เจ้าของหรือครอบครัวเป็นเจ้าของ) </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="2"/> คอมพิวเตอร์ (ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="6"/> เครื่องเล่น MP4</td>
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
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="11"/> การซื้อทางอินเทอร์เน็ต (การซื้อแพ็คเกจเท่านั้น) </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ412" value="12"/> อื่น ๆ<br/>(<input type="text" name="cQ412Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-13 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q13. หากคุณซื้อเกมส์เกาหลี (ยกเว้นเกมส์ออนไลน์) จากอินเทอร์เน็ตคุณรู้หรือไม่ว่าเป็นของแท้หรือของละเมิดลิขสิทธิ์?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="2"/> รับรู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ413" value="3"/> รับรู้</td>
			</tr>
			
			<!-- cq4-13-1 -->
			<tr>
				<td class="qTd" rowspan="4">
					<font style="color:blue">ในคำถามข้างต้น C_Q13 หากคุณตอบ ②รับรู้บ้าง ③รับรู้ กรุณาตอบคำถามต่อไปนี้</font><br/>
					C_Q13-1] หากคุณตอบว่าคุณทราบดีว่ากำลังซื้อเกมส์กาหลี(ยกเว้นเกมส์ออนไลน์) ของแท้หรือละเมิดลิขสิทธิ์ ผ่านอินเทอร์เน็ตแพ็คเกจโปรดตอบคำถามต่อไปนี้ ของแท้หรือการละเมิดลิขสิทธิ์ส่งผลกระทบต่อความพร้อมใช้งานหรือไม่
				</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="1"/> ไม่มีผลต่อการรับสินค้า</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะได้รับผลิตภัณฑ์ของแท้ แต่ถ้าคุณมีเพียงสำเนาละเมิดลิขสิทธิ์คุณจะได้รับสำเนาของละเมิดลิขสิทธิ์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="3"/> มีเฉพาะผลิตภัณฑ์ของแท้เท่านั้น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ4131" value="4"/> เนื่องจากสินค้าของแท้มีราคาแพงจึงมี แต่สำเนาที่ละเมิดลิขสิทธิ์เท่านั้น</td>
			</tr>
			
			<!-- cq4-14 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q14. หากเจ้าของผลงานเกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์) อนุญาติให้สามารถจัดเก็บจากอินเทอร์เน็ตคุณหวังว่าจะเผยแพร่เงื่อนไขอะไร โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น </td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="1"/> เป็นเสียงพากย์เป็นภาษาของประเทศเป้าหมาย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="2"/> เป็นเสียงพากย์เป็นภาษาอังกฤษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="3"/> เป็นเสียงที่ยังคงอยู่ในเกาหลี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="4"/> มันเป็นภาษาของการสำรวจ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="5"/> ไม่ว่าจะเขียนเป็นภาษาอังกฤษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="6"/> คุณสามารถรับและดูเกือบจะในเวลาเดียวกับการเปิดตัวในเกาหลี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="7"/> ไม่ว่าจะเป็นภาพที่มีคุณภาพสูง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="8"/> กำหนดราคาตามเวลา (ความจุ) ของเนื้อหาหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="9"/> เนื้อหาภาษาเกาหลีมีการเผยแพร่ในเว็บไซต์เดียวกัน</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="10"/> คุณสามารถค้นหาเนื้อหาที่คุณต้องการรับชมได้อย่างง่ายดายหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="11"/> ไม่มีเงื่อนไขพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="12"/> ฉันไม่ต้องการเป็นของแท้</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ414" value="13"/> อื่น ๆ(<input type="text" name="cQ414Etc"/>)</td>
			</tr>
			
			<!-- cq4-15 -->
			<tr>
				<td class="qTd">C_Q15. หากคุณปฏิบัติตามเงื่อนไขที่คุณเลือกในคำถามข้างต้นและคุณอนุญาตให้เจ้าของเกาหลีได้รับเกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์)  ราคาที่คุณยินดีจ่ายคือเท่าไร ?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ415" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจ"/>)</td>
			</tr>
			
			<!-- cq4-16 -->
			<tr>
				<td class="qTd">C_Q16. คุณเคยแชร์เกมส์เกาหลีฟรีของคุณ (ยกเว้นเกมออนไลน์) หรือแชร์เส้นทางของคุณกับผู้อื่นที่ไม่ใช่ตัวคุณเองหรือไม่ (ถ้าคุณเคยมีประสบการณ์ด้วยกรุณาตอบ มี" )</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ416" value="1"/> มี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ416" value="2"/> ไม่มี</td>
			</tr>
			
			<!-- cq4-16-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ ①ในคำถามข้างต้น</font><br/>
					C_Q16_1. โปรดตอบคำถามต่อไปนี้ คุณแชร์เกมเกาหลีฟรีได้อย่างไร (ยกเว้นเกมส์ออนไลน์) กรุณาเลือกทั้งหมด.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="1"/> USB, CD, DVD ออฟไลน์</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="2"/> อัปโหลดไปยังคาเฟ่,บล็อก ฯลฯ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="3"/> สังคมออนไลน์ (เช่น Facebook, Twitter, Instagram ฯลฯ )</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="4"/> Torrent</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="5"/> P2P หรือ web hard sharing</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="6"/> การแชร์ส่วนตัว ใน (อีเมล KakaoTalkฯลฯ)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="7"/> Cloud</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4161" value="8"/> อื่น ๆ (<input type="text" name="cQ4161Etc" style="width:70%;"/>)</td>
			</tr>
			
			<!-- cq4-16-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ ①ในคำถามข้างต้น</font><br/>
					C_Q16_2. ทำไมคุณแชร์เกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์)กรุณาเลือกทั้งหมด
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="1"/> สมาชิกในครอบครัวและเพื่อน ๆ ไม่ทราบวิธีการเข้าถึงผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="2"/> เพราะหลายคนทำ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="3"/> หารายได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="4"/> แชร์แบบไม่ระบุความพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="5"/> ใช้ผลงานฟรีมากขึ้น</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="6"/> ฉันได้รับคำขอ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="7"/> ไม่มีเหตุผลพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ4162" value="8"/> อื่น ๆ(<input type="text" name="cQ4162Etc"/>)</td>
			</tr>
			
			<!-- cq4-17 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. คุณควรทำอย่างไรหากช่องทางสู่เกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์) ถูกปิดกั้นหรือปิด?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="1"/> เลิกใช้ผลงานเอง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="2"/> ใช้ผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="3"/> ค้นหาช่องทางอื่น ๆ ที่ให้บริการฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="4"/> ค้นหาวิธีการข้ามช่องทางที่มีอยู่</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ417" value="5"/> อื่น ๆ(<input type="text" name="cQ417Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq4-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. คุณเพิ่มหรือลดการใช้งานเกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์) ในปีนี้ (2019) เมื่อเปรียบเทียบกับปีที่แล้ว (2018)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="1"/> (<input type="text" name="cQ4181"/> %) เพิ่ม </td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="2"/> (<input type="text" name="cQ4182"/> %) ลดลง</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ418" value="3"/> ไม่มีการเปลี่ยนแปลง </td>
			</tr>
			
			<!-- cq4-19 -->
			<tbody id="cQ419Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q19. โปรดเลือกเหตุผลหลักทั้งหมดสำหรับการใช้เกมส์เกาหลีฟรี(ยกเว้นเกมส์ออนไลน์) ของคุณที่เพิ่มขึ้น เมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="1"/> ราคาผลงานที่ต้องชำระสูงมาก</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="2"/> ราคาผลงานฟรีต่ำกว่าปกติ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="3"/> ปริมาณผลงานฟรีที่มีให้สูงกว่าปกติ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="4"/> มีหลายวิธีในการใช้ผลงานฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="5"/> เมื่อปริมาณการใช้ผลงานโดยรวมเพิ่มขึ้น</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="6"/> ผลงานฟรีใช้งานง่าย</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ419" value="7"/> อื่น ๆ(<input type="text" name="cQ419Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq4-20 -->
			<tbody id="cQ420Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q20. อะไรคือสาเหตุหลักที่ทำให้คุณลดการใช้เกมส์เกาหลีฟรี (ยกเว้นเกมออนไลน์) เมื่อเปรียบเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="1"/> ผลงานหรือช่องทางฟรีสามารถใช้ได้เนื่องจากการบังคับใช้</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="2"/> ราคาของผลงานที่ต้องชำระมีความสมเหตุสมผล/td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="3"/> ฉันต้องการซื้อผลงานแบบชำระเงินโดยดูแคมเปญการประชาสัมพันธ์บทความข่าว ฯลฯ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="4"/> หากมีปัญหาการละเมิดลิขสิทธิ์,การโดนแฮ็ก,การติดไวรัส ฯลฯ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="5"/> ลดการใช้ผลงานาเอง</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="6"/> เพิ่มจำนวนของผลงานที่ชำระเงินโดยการตัดสินใจที่รอบคอบ</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ420" value="7"/> อื่น ๆ(<input type="text" name="cQ420Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq4-21 -->
			<tbody id="cQ421Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q21. สถานการณ์ใดที่คุณต้องการหยุดใช้เกมส์เกาหลีอย่างถูกกฎหมาย (ยกเว้นเกมส์ออนไลน์)?</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="1"/> ลดราคาของผลงานาและบริการที่ต้องชำระเงิน</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="2"/> ลดผลงานโดยรวมฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="3"/> ลงโทษและลงโทษผู้ใช้ผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="4"/> ปรับปรุงการรับรู้ผ่านการศึกษาและการประชาสัมพันธ์เกี่ยวกับการคุ้มครองลิขสิทธิ์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="5"/> ความแตกต่างที่ชัดเจนระหว่างผลงานที่ต้องชำระเงินและผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="6"/> ความเสียหายส่วนบุคคลอันเนื่องมาจากการติดไวรัส,การโดนแฮ็ค,ใช้บัตรเครดิตและอื่น ๆ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="7"/> การบังคับใช้และการลงโทษผู้ให้บริการผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="8"/> รักษาความปลอดภัยจำนวนผลงานที่ต้องชำระ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="9"/> เพิ่มความสะดวกในการใช้ผลงานที่ต้องชำระเงิน (การเข้าถึงวิธีการชำระเงินการทำให้การเข้าสู่ระบบง่ายขึ้น ฯลฯ )</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ421" value="10"/> อื่น ๆ (<input type="text" name="cQ421Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq4-22 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q22. คุณจะทำอย่างไรเมื่อเห็นคนรอบตัวคุณใช้หรือซื้อเกมส์เกาหลีฟรี(ยกเว้นเกมส์ออนไลน์)?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="1"/> แชร์ข้อมูลที่เกี่ยวข้องกับผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="2"/> ป้องกันการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="3"/> ส่งเสริมการใช้ผลงานที่มีค่าใช้จ่าย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="4"/> อย่าดำเนินการใด ๆ เป็นพิเศษ</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ422" value="5"/> อื่น ๆ(<input type="text" name="cQ422Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('7');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">NEXT</button>
		</div>
	</div>
	
	<div style="width:100%;display:none;" id="section8">
		<br/>
		<p style="width:100%;height:30px;font-size:18px;color:#000000;font-weight:bold;">
			<font style="border-top:4px solid #003399;">&nbsp;&nbsp;▶ Part IV.</font> เว็ปตูน
		</p>
		<br/>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th colspan="2" style="background-color:#ddd;">문항</th>
				<th colspan="2" style="background-color:#ddd;">답변</th>
			</tr>
			
			<!-- cq5-1 -->
			<tr>
				<td class="qTd" colspan="2">C_Q1. เว็ปตูนทั้งหมด ที่คุณได้จัดเก็บและอ่านทั้งหมดมีเว็บตูนของเกาหลีในอัตราส่วนใด? </td>
				<td class="aTd" colspan="2"><input type="text" name="cQ51"/> %</td>
			</tr>
			
			<!-- cq5-2 -->
			<tr>
				<td class="qTd" colspan="4" style="border-top:3px solid #ddd;">C_Q2. เว็บตูนของเกาหลีประเภทไหนที่คุณใช้?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="1"/> เป็นตอนๆ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="2"/> เรื่องสั้น</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="3"/> เรื่องราว</td>
				<td class="aTd" style="text-align:left;padding-left:2%;width:25%;"><input type="radio" name="cQ52" value="4"/> ทุกวัน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="5"/> ตลก</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="6"/> แฟนตาซี </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="7"/> ผจญภัย </td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="8"/> ละคร</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="9"/> สร้างจากเรื่องจริง / อารมณ์</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="10"/> ระทึกขวัญ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="11"/> ละครย้อนยุค</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ52" value="12"/> กีฬา</td>
			</tr>
			
		</table>
		<table style="width:100%;border:1px solid #ddd;">
			<!-- cq5-3 -->
			<tr>
				<td class="qTd" colspan="7">C_Q3. โปรดระบุให้เราทราบจำนวนเว็บฟรีและชำระเงินในช่วง 3 เดือนที่ผ่านมา.</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="3"></td>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ฟรี</th>
				<th class="aTd" style="border:1px solid #ddd;background-color:#ddd;" colspan="2">ชำระเงิน </th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">1</th>
				<th class="aTd" style="background-color:#ddd;">2</th>
				<th class="aTd" style="background-color:#ddd;">3</th>
				<th class="aTd" style="background-color:#ddd;">4</th>
			</tr>
			<tr>
				<th class="aTd" style="border-left:1px solid #ddd;background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ฟัง</th>
				<th class="aTd" style="background-color:#ddd;">จัดเก็บ</th>
				<th class="aTd" style="background-color:#ddd;">ฟัง</th>
			</tr>
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">ออนไลน์หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">a-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">การกระจายเนื้อหาโดยผู้ประกอบการ / ผู้ประกอบการที่เฉพาะเจาะจง</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A11" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A12" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53A14" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-2</td>
				<td class="qTd">เผยแพร่ผ่านเว็บไซต์แบ่งปันวิดีโอ (YouTube และอื่น ๆ )</td>
				<td class="aTd"><input type="text" name="cQ53A21" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A22" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A23" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A24" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-3</td>
				<td class="qTd">จัดจำหน่ายผ่านเว็บไซต์ลิงค์ / เว็บไซต์ที่มีคนมากมาย</td>
				<td class="aTd"><input type="text" name="cQ53A31" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A32" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A33" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A34" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-4</td>
				<td class="qTd">เผยแพร่โดย P2P site / ซอฟต์แวร์ P2P</td>
				<td class="aTd"><input type="text" name="cQ53A41" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A42" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A43" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A44" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-5</td>
				<td class="qTd">จัดจำหน่ายตามบริการจัดเก็บข้อมูล (รวมถึงไซต์แชร์ไฟล์)</td>
				<td class="aTd"><input type="text" name="cQ53A51" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A52" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A53" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A54" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-6</td>
				<td class="qTd">การกระจายระหว่างคนรู้จักผ่านทางอีเมลหรือโปรแกรมส่งข้อความด่วน</td>
				<td class="aTd"><input type="text" name="cQ53A61" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A62" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A63" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A64" style="width:70%;"/> จำนวน</td>
			</tr>
			<tr>
				<td class="aTd">a-7</td>
				<td class="qTd">จัดจำหน่ายโดยแอพ</td>
				<td class="aTd"><input type="text" name="cQ53A71" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A72" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A73" style="width:70%;"/> จำนวน</td>
				<td class="aTd"><input type="text" name="cQ53A74" style="width:70%;"/> จำนวน</td>
			</tr>
			
			<tr>
				<td class="qTd" rowspan="7" style="width:10%;text-align:center;border-top:1px solid #ddd;">แพ็คเกจ หมุนเวียน</td>
				<td class="aTd" style="width:5%;border-top:1px solid #ddd;">b-1</td>
				<td class="qTd" style="width:45%;border-top:1px solid #ddd;">ขายแพ็คเกจที่ร้านค้าจริง</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
				<td class="aTd" style="width:10%;"><input type="text" name="cQ53B13" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="width:10%;background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-2</td>
				<td class="qTd">การขายบรรจุภัณฑ์ทางไปรษณีย์โดยนิตยสารและทีวี</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B23" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-3</td>
				<td class="qTd">ขายแพ็คเกจผ่านอินเทอร์เน็ต</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B33" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-4</td>
				<td class="qTd">จัดจำหน่ายแพคเกจตามการประมูล ฯลฯ</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B43" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<!-- <tr>
				<td class="aTd">b-5</td>
				<td class="qTd">하드 드라이브나  USB메모리 등의 콘텐츠 복사 서비스 또는 콘텐츠가 들어있는 외장하드 드라이브 판매</td>
				<td class="aTd"><input type="text" name="cQ33B51" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B53" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr> -->
			<tr>
				<td class="aTd">b-6</td>
				<td class="qTd">ขายแพ็คเกจ ณ สถานที่จัดงาน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B63" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-7</td>
				<td class="qTd">แพ็คเกจเช่า</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B73" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>
			<tr>
				<td class="aTd">b-8</td>
				<td class="qTd">การกระจายบรรจุภัณฑ์ในหมู่คนรู้จัก</td>
				<td class="aTd"><input type="text" name="cQ53B81" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
				<td class="aTd"><input type="text" name="cQ53B83" style="width:70%;"/> จำนวน</td>
				<td class="aTd" style="background-color:#ddd;"></td>
			</tr>						
		</table>
		
		<table style="width:100%;border:1px solid #ddd;">
			<tr>
				<th style="width:50%;background-color:#ddd;">Question</th>
				<th style="background-color:#ddd;" colspan="3">Answer</th>
			</tr>
			
			<!-- cq5-4 -->
			<tr>
				<td class="qTd">C_Q4. คุณจ่ายเงินเพื่อซื้อ / ดูเว็บตูนภาษาเกาหลีในช่วง 3 เดือนที่ผ่านมาเท่าไหร่?</td>
				<td class="aTd" colspan="2">( <input type="text" name="cQ54"/> )</td>
			</tr>
			
			<!-- cq5-5 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q5. ทำไมคุณถึงใช้ช่องทาง C_Q3 บ่อยที่สุดเพื่อรับเว็บตูนเกาหลีฟรี?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="1"/> เข้าถึงและใช้งานง่าย</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="2"/> ฉันคุ้นเคยกับสถานที่ที่ฉันใช้อย่างต่อเนื่อง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="3"/> ปลอดภัยจากการติดไวรัส</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="4"/> ผลงานเยอะกว่าช่องทางอื่น ๆ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="5"/> ฉันไม่คิดว่าฉันสามารถบล็อกหรือปิดกั้นช่องทางได้</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="6"/> ฉันไม่รู้จักช่องทางอื่น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="7"/> ไม่สะดวก มีแต่โฆษณา</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ55" value="8"/> อื่น ๆ(<input type="text" name="cQ55Etc"/>)</td>
			</tr>
			
			<!-- cq5-6 -->
			<tr>
				<td class="qTd" rowspan="8">C_Q6. คุณรู้จักเว็บตูนเกาหลีฟรีในเกาหลีได้อย่างไร?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="1"/> เว็บไซต์ของเจ้าของผลงาน  </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="2"/> เว็บไซต์ข่าว</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="3"/> เว็บไซต์ที่รับผลงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="4"/> ทีวี / วิทยุ</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="5"/> คำพูด (รีวิว) </td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="6"/> คาเฟ่บล็อก, สังคมออนไลน์</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="7"/> ผ่านคนรู้จักเช่นเพื่อนและเพื่อนร่วมงาน</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ56" value="8"/> อื่น ๆ(<input type="text" name="cQ56Etc"/>)</td>
			</tr>
			
			<!-- cq5-7 -->
			<tr>
				<td class="qTd" rowspan="5">C_Q7. อุปกรณ์ที่คุณใช้คืออะไรเมื่อคุณได้รับ (คัดลอกหรือดาวน์โหลด) หรือดูเว็บตูนเกาหลีฟรีกรุณาเลือกอุปกรณ์ที่เกี่ยวข้องทั้งหมด</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="1"/> คอมพิวเตอร์ (ตนเองหรือครอบครัวเป็นเจ้าของ)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="2"/> คอมพิวเตอร์ (ร้านอินเทอร์เน็ต)</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="3"/> โทรศัพท์มือถือ</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="4"/> สมาร์ทโฟน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="5"/> แท็บเล็ต</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="6"/> เครื่องเล่น MP4</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="7"/> PSP / PS VITA</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="8"/> อื่น ๆ<br/>(<input type="text" name="cQ57Etc" style="width:85%;"/>)</td>
			</tr>
			<tr>
				<td class="aTd" colspan="2" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ57" value="9"/> ซื้อจากอินเทอร์เน็ต (การสตรีมหรือการซื้อแพ็คเกจเท่านั้น)</td>
			</tr>
			
			<!-- cq5-8 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q8. ทำไมคุณใช้เว็บตูนเกาหลีฟรี กรุณาเลือกทั้งหมด</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="1"/> ราคาถูกหรือฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="2"/> ฉันไม่คิดว่ามันคุ้มค่าที่จะจ่ายสำหรับผลงานที่จ่ายเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="3"/> วิธีเดียวที่จะใช้ผลงานที่คุณต้องการคือการใช้ผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="4"/> สะดวกกว่าผลงานที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="5"/> ฉันคิดว่าการใช้ผลงานฟรีไม่ได้เป็นเรื่องร้ายแรง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="6"/> เพราะหลายคนใช้</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="7"/> เพราะคุณสามารถสตรีมมิ่งหรือดาวน์โหลดผลงานต่อรายการ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="8"/> สามารถใช้งานได้เร็วกว่าผลงานที่ชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="9"/> เพราะฉันเคยใช้ได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ58" value="10"/> อื่น ๆ(<input type="text" name="cQ58Etc"/>)</td>
			</tr>
			
			<!-- cq5-9 -->
			<tr>
				<td class="qTd" rowspan="3">C_Q9. คุณทราบหรือไม่ว่าคุณกำลังซื้อเว็บตูนเกาหลีของแท้หรือของปลอม?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="1"/> ไม่รู้สึก</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="2"/> รับรู้บ้าง</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ59" value="3"/> รับรู้</td>
			</tr>
			
			<!-- cq5-9-1 -->
			<tr>
				<td class="qTd" rowspan="4">
					<font style="color:blue">ในคำถามข้างต้น C_Q9] หากคุณตอบว่า	②รับรู้บ้าง ③รับรู้ โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q9_1. ทุกคนที่ตอบว่าถูกคัดลอกอย่างแท้จริงหรือผิดกฎหมายหากพวกเขาได้รับหรือดูเว็บตูนเกาหลีในอินเทอร์เน็ตหรือในแพคเกจโปรดตอบคำถามต่อไปนี้ ไม่ว่าจะเป็นของแท้หรือละเมิดลิขสิทธิ์มันมีผลต่อความพร้อมใช้งานและการดูหรือไม่?
				</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="1"/> ไม่มีผลต่อการรับชม</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="2"/> หากคุณมีผลิตภัณฑ์ของแท้คุณจะได้รับผลิตภัณฑ์ของแท้ หากคุณได้รับสำเนาละเมิดลิขสิทธิ์และดู</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="3"/> มีเฉพาะผลิตภัณฑ์ของแท้เท่านั้น</td>
			</tr>
			<tr>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ591" value="4"/> เนื่องจากสินค้าของแท้มีราคาแพงจึงมี แต่สำเนาที่ละเมิดลิขสิทธิ์เท่านั้น</td>
			</tr>
			
			<!-- cq5-10 -->
			<tr>
				<td class="qTd" colspan="3" style="border-top:3px solid #ddd;">C_Q10. หากเจ้าของผลงานชาวเกาหลีอนุญาตให้เว็บตูนเกาหลีได้รับทางกฎหมายและดูทางอินเทอร์เน็ตคุณหวังว่าจะเผยแพร่เงื่อนไขอะไรบ้าง โปรดเลือกทั้งหมดที่ตรงกับเงื่อนไขเหล่านั้น.</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="1"/> จะเป็นเสียงพากย์เป็นภาษาของประเทศเป้าหมายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="2"/> จะเป็นเสียงพากย์เป็นภาษาอังกฤษหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="3"/> เสียงจะยังคงอยู่ในภาษาของผู้ผลิตผลงานตามเดิมหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="4"/> ระบุว่าประเทศเป้าหมายมีคำบรรยายหรือไม่</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="5"/> มีคำบรรยายภาษาอังกฤษหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="6"/> สามารถรับชมและรับชมเนื้อหาในเวลาเดียวกันกับการออกอากาศของประเทศผู้ผลิตและการเปิดโรงภาพยนตร์</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="7"/> การรับรู้คุณภาพระดับ HD</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="8"/> ดาวน์โหลดไม่ว่าจะเป็น</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="9"/> กำหนดราคาตามเวลา (ความจุ) ของเนื้อหาหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="10"/> เนื้อหาภาษาเกาหลีมีการเผยแพร่ในเว็บไซต์เดียวกัน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="11"/> คุณสามารถค้นหาเนื้อหาที่คุณต้องการรับชมได้อย่างง่ายดายหรือไม่</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="12"/> ไม่มีเงื่อนไขพิเศษ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="13"/> ฉันไม่ต้องการของแท้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ510" value="14"/> อื่น ๆ(<input type="text" name="cQ510Etc"/>)</td>
			</tr>
			
			<!-- cq5-11 -->
			<tr>
				<td class="qTd">C_Q11. หากคุณปฏิบัติตามเงื่อนไขที่เลือกในคำถาม C_Q10 ด้านบนและคุณอนุญาตให้เจ้าของภาษาเกาหลีได้รับและดูเว็บตูนของเกาหลีทางอินเทอร์เน็ตบนอินเทอร์เน็ตคุณจะต้องจ่ายเท่าไหร่สำหรับแต่ละผลงาน?</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;">(<input type="text" name="cQ511" placeholder="หน่วยการเงินของประเทศที่ทำการสำรวจคือ   "/>)</td>
			</tr>
			
			<!-- cq5-12 -->
			<tr>
				<td class="qTd">C_Q12. คุณเคยแชร์ เว็บตูนของเกาหลีฟรีของคุณกับคนอื่นนอกจากตัวคุณเองหรือให้คุณแชร์ช่องทางของคุณต่อ (โปรดตอบ 'มี' ถ้าคุณมีหนึ่งในนั้น)</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ512" value="1"/> มี</td>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ512" value="2"/> ไม่มี</td>
			</tr>
			
			<!-- cq5-12-1 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ ①ในคำถามข้างต้น C_Q12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_1. คุณแชร์เว็บตูนของเกาหลีฟรีได้อย่างไร กรุณาเลือกทั้งหมด.
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="1"/> USB, CD, DVD ออฟไลน์</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="2"/> อัปโหลดไปยังคาเฟ่,บล็อก ฯลฯ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="3"/> สังคมออนไลน์ (Facebook, Twitter, Instagram ฯลฯ)</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="4"/> Torrent</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="5"/> P2P หรือ web hard sharing</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="6"/> การแชร์ส่วนตัว (อีเมล KakaoTalk ฯลฯ )</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="7"/> Cloud</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5121" value="8"/> อื่น ๆ(<input type="text" name="cQ5121Etc"/>)</td>
			</tr>
			
			<!-- cq5-12-2 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">
					<font style="color:blue">หากคุณตอบ ①ในคำถามข้างต้น C_Q12 โปรดตอบคำถามต่อไปนี้</font><br/>
					C_Q12_2. โปรดเลือกสาเหตุทั้งหมดที่คุณแชร์ เว็บตูนของเกาหลีฟรี.
				</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="1"/> สมาชิกในครอบครัวและเพื่อน ๆ ไม่ทราบวิธีการเข้าถึงผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="2"/> เพราะหลายคนทำ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="3"/> หารายได้</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="4"/> แชร์แบบเจาะจงบุคคล</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="5"/> ใช้ผลงานฟรีมากขึ้น</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="6"/> ฉันได้รับคำขอ</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="7"/> ไม่มีเหตุผลพิเศษ</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ5122" value="8"/> อื่น ๆ(<input type="text" name="cQ5122Etc"/>)</td>
			</tr>
			
			<!-- cq5-13 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q13. คุณจะทำอย่างไรหากเส้นทางสู่เว็บตูนของเกาหลีฟรีถูกบล็อกหรือปิด?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="1"/> เลิกรับชมไปเอง</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="2"/> ใช้เนื้อหาที่ต้องชำระเงิน</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="3"/> ค้นหาช่องทางอื่น ๆ ที่ให้บริการฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="4"/> ค้นหาวิธีการข้ามช่องทางที่มีอยู่</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ513" value="5"/> อื่น ๆ(<input type="text" name="cQ513Etc" style="width:50%;"/>)</td>
			</tr>
			
			<!-- cq5-14 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q14. คุณเพิ่มหรือลดการใช้ เว็บตูนของเกาหลีฟรีในปีนี้ (2019) เมื่อเทียบกับปีที่แล้ว (2018)?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="1"/> (<input type="text" name="cQ5141"/> %) เพิ่ม</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="2"/> (<input type="text" name="cQ5142"/> %) ลดลง</td>
			</tr>
			<tr>
				<td colspan="3"class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ514" value="3"/> ไม่มีการเปลี่ยนแปลง </td>
			</tr>
			
			<!-- cq5-15 -->
			<tbody id="cQ515Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q15. โปรดเลือกเหตุผลหลักทั้งหมดสำหรับการเพิ่มเว็บตูนของเกาหลีฟรีเมื่อเทียบกับปีที่แล้ว</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="1"/> ราคาผลงานที่ต้องชำระสูงมาก</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="2"/> ราคาผลงานฟรีต่ำกว่าปกติ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="3"/> ปริมาณผลงานฟรีที่มีให้สูงกว่าปกติ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="4"/> มีหลายวิธีในการใช้ผลงานฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="5"/> เมื่อปริมาณการใช้ผลงานโดยรวมเพิ่มขึ้น</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="6"/> ผลงานฟรีใช้งานง่าย</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ515" value="7"/> อื่น ๆ(<input type="text" name="cQ515Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq5-16 -->
			<tbody id="cQ516Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q16. อะไรคือสาเหตุหลักที่ทำให้เว็บตูนของเกาหลีฟรีของคุณลดลงเมื่อเทียบกับปีก่อน/td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="1"/> ผลงานหรือช่องทางฟรีสามารถใช้ได้เนื่องจากการบังคับใช้</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="2"/> ราคาของผลงานที่ต้องชำระมีความสมเหตุสมผล</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="3"/> ฉันต้องการซื้อผลงานแบบชำระเงินโดยดูแคมเปญการประชาสัมพันธ์,บทความข่าว ฯลฯ</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="4"/> หากมีปัญหาการละเมิดลิขสิทธิ์การโดนแฮ็ก,การติดไวรัส ฯลฯ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="5"/> ลดการใช้ผลงานเอง</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="6"/> เพิ่มจำนวนของผลงานที่ชำระเงินโดยการตัดสินใจที่รอบคอบ</td>
				</tr>
				<tr>
					<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="checkbox" name="cQ516" value="7"/> อื่น ๆ(<input type="text" name="cQ516Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq5-17 -->
			<tbody id="cQ517Tbody" class="qTbody" style="display:none;">
				<tr>
					<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q17. คุณต้องการหยุดใช้ เว็บตูนของเกาหลีฟรีไม่ว่าในกรณีใด?</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="1"/> ลดราคาของผลงานและบริการที่ต้องชำระเงิน</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="2"/> ลดผลงานโดยรวมฟรี</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="3"/> ลงโทษและลงโทษผู้ใช้ผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="4"/> ปรับปรุงการรับรู้ผ่านการศึกษาและการประชาสัมพันธ์เกี่ยวกับการคุ้มครองลิขสิทธิ์</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="5"/> ความแตกต่างที่ชัดเจนระหว่างผลงานที่ต้องชำระเงินและผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="6"/> การบาดเจ็บส่วนบุคคลอันเนื่องมาจากการติดเชื้อไวรัสการแฮ็คบัตรเครดิตและอื่น ๆ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="7"/> ⑧	การบังคับใช้และการลงโทษผู้ให้บริการผลงานฟรี</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="8"/> รักษาความปลอดภัยจำนวนผลงานที่ต้องชำระ</td>
				</tr>
				<tr>
					<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="9"/> เพิ่มความสะดวกในการใช้ผลงานที่ต้องชำระเงิน (การเข้าถึงวิธีการชำระเงินการทำให้การเข้าสู่ระบบง่ายขึ้น ฯลฯ )</td>
					<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ517" value="10"/> อื่น ๆ(<input type="text" name="cQ517Etc"/>)</td>				
				</tr>
			</tbody>
			
			<!-- cq5-18 -->
			<tr>
				<td colspan="3" class="qTd" style="border-top:3px solid #ddd;">C_Q18. คุณจะทำอย่างไรเมื่อเห็นผู้คนรอบตัวคุณซื้อหรือซื้อ เว็บตูนของเกาหลีฟรี?</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="1"/> แชร์ข้อมูลที่เกี่ยวข้องกับผลงานฟรี</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="2"/> ป้องกันการใช้ผลงานฟรี</td>
			</tr>
			<tr>
				<td class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="3"/> ส่งเสริมการใช้ผลงานที่มีค่าใช้จ่าย</td>
				<td colspan="2" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="4"/> อย่าดำเนินการใด ๆ เป็นพิเศษ</td>
			</tr>
			<tr>
				<td colspan="3" class="aTd" style="text-align:left;padding-left:2%;"><input type="radio" name="cQ518" value="5"/> อื่น ๆ(<input type="text" name="cQ518Etc"/>)</td>				
			</tr>
			
		</table>
		<br/><br/>
		<div style="text-align:center;">
			<button type="button" onclick="next('8');" style="border-radius:4px;width:50%;background-color:#F2CB61;height:40px;font-weight:bold;font-size:18px;">다음</button>
		</div>
	</div>
	
	

	<div style="width:100%;display:none;" id="section9">
		<h4 style="text-align:center;background-color:#F2CB61;;">■ Thank you</h4>
		<br/><br/><br/>
		
		<!-- <button type="button" onclick="javascript:window.open('','_self').close();">창닫기</button> -->
	</div>
</div>
</body>
</html>