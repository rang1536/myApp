<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
	//key 값 세션 설정 & 제대로 받았는지 확인
	String key = request.getParameter("i");
	System.out.println(key);

	//key 값 확인후 조사 대상자 아니면 창 종료
	/* if (key == null || key.length()==0){ 
			out.println("<script>alert('조사대상자가 아닙니다.'); window.open('about:blank', '_self').close();</script>");
	}else if(process.Answer_check(key)==2){
			out.println("<script>alert('이미 설문을 완료하셨습니다.'); window.open('about:blank', '_self').close();</script>");
	}else if(process.Answer_check(key)==3){
			out.println("<script>alert('조사대상자가 아닙니다.'); window.open('about:blank', '_self').close();</script>");
	}else if(process.Answer_check(key)==4){
		out.println("<script>alert('수신을 거부하셨습니다.'); window.open('about:blank', '_self').close();</script>");
	} */
	
	//ip 값 받기 & 제대로 받았는지 확인
	String ip = request.getRemoteHost();
	//System.out.println(ip);
	//System.out.println(key);
%>

<HTML>

<HEAD>
<META NAME="Generator" CONTENT="Haansoft HWP 7.0.1.215">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

function check(i)
{
	var text = new Array(2, 8, 15, 20, 24, 27, 30, 33, 36, 40, 45, 46);
	if(i == 2 || i == 8 || i == 15 || i == 18 || i == 20 || i == 24 || i == 27 || i == 30 || i == 33 || i == 36 || i ==40 || i == 45 || i == 46 ) return 1;
	
	//alert(i);
	
	if(i<20){
		if($(':radio[name="Q'+i+'_YN"]:checked').length < 1){
			alert(i+'참여여부에 응답해주세요.');
			$("#Q"+i+"_YN").attr("tabindex", -1).focus();
			event.preventDefault();
			return 0;
		} else if($(':radio[name="Q'+i+'_1"]:checked').length < 1){
			if($(':radio[name="Q'+i+'_1"]:checked').length < 1) {
				alert(i+'기대도에 응답해주세요.');
				$("#Q"+i+"_1").attr("tabindex", -1).focus();
				return 0;
			}
		} else if($(':radio[name="Q'+i+'_YN"]:checked').val()=='Y'){
			if($(':radio[name="Q'+i+'_2"]:checked').length < 1) {
				alert(i+'만족도에 응답해주세요.');
				$("#Q"+i+"_2").attr("tabindex", -1).focus();
				return 0;
			}
		}
	}
	
	if (  i >20 && i == 48) {
		
		if(i > 21  && i < 46) {
			
			if($(':radio[name="Q'+i+'_1"]:checked').length < 1){
				alert(i+'기대도에 응답해주세요.');
				$("#Q"+i+"_1").attr("tabindex", -1).focus();
				return 0;
			} else if($(':radio[name="Q'+i+'_2"]:checked').length < 1) {
				alert(i+'만족도에 응답해주세요.');
				$("#Q"+i+"_2").attr("tabindex", -1).focus();
				return 0;
			}
			
		}  else {
			
			if(i==47){
				if($(':radio[name="Q'+i+'"]:checked').length < 1){
					alert(i+'성별 항목에 응답해주세요.');
					$("#Q"+i).attr("tabindex", -1).focus();
					return 0;
				}
			}
			else if(i==48){
				if($(':radio[name="Q'+i+'"]:checked').length < 1) {
					alert(i+'학년 항목에 응답해주세요.');
					$("#Q"+i).attr("tabindex", -1).focus();

					return 0;
				}
			}
		}
		
	}
	
	
	return 1;
}

function end()
{
	var end = 0;
	for(var i = 1; i < 49; i ++) {
		
		if(check(i)==0) {
			end = 0;
			break;
		}else{
			end = 1;
			
		}
	}
	if(end){
		survey.submit();
	}
}
	
</script>


<STYLE>
<!--
P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"바탕글"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle1, LI.HStyle1, DIV.HStyle1
	{style-name:"본문"; margin-left:15.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle2, LI.HStyle2, DIV.HStyle2
	{style-name:"개요 1"; margin-left:10.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle3, LI.HStyle3, DIV.HStyle3
	{style-name:"개요 2"; margin-left:20.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle4, LI.HStyle4, DIV.HStyle4
	{style-name:"개요 3"; margin-left:30.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle5, LI.HStyle5, DIV.HStyle5
	{style-name:"개요 4"; margin-left:40.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle6, LI.HStyle6, DIV.HStyle6
	{style-name:"개요 5"; margin-left:50.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle7, LI.HStyle7, DIV.HStyle7
	{style-name:"개요 6"; margin-left:60.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle8, LI.HStyle8, DIV.HStyle8
	{style-name:"개요 7"; margin-left:70.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle9, LI.HStyle9, DIV.HStyle9
	{style-name:"쪽 번호"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:함초롬돋움; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle10, LI.HStyle10, DIV.HStyle10
	{style-name:"머리말"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:함초롬돋움; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle11, LI.HStyle11, DIV.HStyle11
	{style-name:"각주"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle12, LI.HStyle12, DIV.HStyle12
	{style-name:"미주"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:함초롬바탕; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle13, LI.HStyle13, DIV.HStyle13
	{style-name:"메모"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:130%; font-size:9.0pt; font-family:함초롬돋움; letter-spacing:0.5pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
-->

.centeringContainer { text-align: center; }
.table1 {border:1; cellspacing:0; cellpadding:0; align:center; }
.table1 td, .table1 tr
{
	text-align : center;
	border:1;
}
</STYLE>
<div align="center">
<div  style="border:5px solid #FF5E00; padding:0; margin:0;  width:726px;">
<TITLE>2차년도 특성화 사업 만족도 설문조사</TITLE>
</HEAD>

<BODY>
		<form name="survey" method="post" action="survey_complite.jsp">
<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:15.0pt;font-weight:"bold";text-decoration:"underline";line-height:160%;'>2차년도 특성화 사업 만족도 설문지</SPAN></P>

<P CLASS=HStyle0>
<TABLE class="table1" align="center" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<input type="hidden" value=<%=key%> name="key">
<input type="hidden" value=<%=ip%> name="ip">
<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 교육프로그램 영역</caption>
<TR>
	<TD rowspan="2" width="47" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:180%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:180%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="2" width="71" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>참여여부</SPAN></P>
	</TD>
	<TD colspan="5" width="128" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="129" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>Y</SPAN></P>
	</TD>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>N</SPAN></P>
	</TD>
	<TD width="25" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>


	<TD rowspan="2" width="47" height="110" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>글로컬</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>역&nbsp; 량</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>영 역</SPAN></P>
	</TD>
	<TD width="323" height="78" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>기초역량 강화를 위한 비학점 교육프로그램</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(자체학습모임과 연계)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>&nbsp;1) 영어회화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2) 영문법 및 독해</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>&nbsp;3) 기초전공한자&nbsp;&nbsp; 4) 데이터베이스 </SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>&nbsp;5) 정보처리기사</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_YN" id="Q1_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_YN" id="Q1_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_1"  id="Q1_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_1"  id="Q1_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_1"  id="Q1_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_1"  id="Q1_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_1"  id="Q1_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_2"  id="Q1_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_2"  id="Q1_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_2"  id="Q1_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_2"  id="Q1_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q1_2"  id="Q1_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="13" width="650" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="2" cols="30" name="Q2_A" id="Q2_A" maxlength="400" style="width:100%;" placeholder="비학점 교육프로그램 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:180%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:180%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="2" width="71" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>참여여부</SPAN></P>
	</TD>
	<TD colspan="5" width="128" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="129" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>Y</SPAN></P>
	</TD>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>N</SPAN></P>
	</TD>
	<TD width="25" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="6" width="47" height="221" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>진로/취 업</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>탐 색</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>영 역</SPAN></P>
	</TD>
	<TD width="323" height="33" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>진로 적성검사 프로그램 실시 및 CA상담 진행</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(1,2학년 대상 실시)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_YN" id="Q3_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_YN" id="Q3_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_1"  id="Q3_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_1"  id="Q3_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_1"  id="Q3_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_1"  id="Q3_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_1"  id="Q3_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_2"  id="Q3_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_2"  id="Q3_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_2"  id="Q3_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_2"  id="Q3_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q3_2"  id="Q3_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>진로탐색을 위한 외부전문가 초청특강</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(진로탐색 시간을 활용, 총 5회 실시)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_YN" id="Q4_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_YN" id="Q4_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_1"  id="Q4_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_1"  id="Q4_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_1"  id="Q4_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_1"  id="Q4_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_1"  id="Q4_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_2"  id="Q4_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_2"  id="Q4_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_2"  id="Q4_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_2"  id="Q4_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q4_2"  id="Q4_2"  value="5" ></td>
	</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>진로 및 취업정보 공유캠프 </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(11개 기관 전문가들을 통한 진로, 취업정보 공유)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_YN" id="Q5_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_YN" id="Q5_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_1"  id="Q5_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_1"  id="Q5_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_1"  id="Q5_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_1"  id="Q5_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_1"  id="Q5_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_2"  id="Q5_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_2"  id="Q5_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_2"  id="Q5_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_2"  id="Q5_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q5_2"  id="Q5_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>하계/동계방학 산업체 인턴십 프로그램</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(4주과정, 인턴십 참여 지원금지급)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_YN" id="Q6_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_YN" id="Q6_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_1"  id="Q6_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_1"  id="Q6_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_1"  id="Q6_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_1"  id="Q6_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_1"  id="Q6_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_2"  id="Q6_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_2"  id="Q6_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_2"  id="Q6_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_2"  id="Q6_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q6_2"  id="Q6_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="63" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>산업체 인턴십 확대를 위한 산학연 협력 협약 체결(2015년도에 5개 기관 MOU 체결완료)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.2pt;line-height:130%;'>&nbsp;:(주)리스트,(주)케이아이,(주)지플러스,익산시립 </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>&nbsp;&nbsp;&nbsp; 마동도서관, 전북교육문화회관</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_YN" id="Q7_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_YN" id="Q7_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_1"  id="Q7_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_1"  id="Q7_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_1"  id="Q7_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_1"  id="Q7_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_1"  id="Q7_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_2"  id="Q7_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_2"  id="Q7_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_2"  id="Q7_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_2"  id="Q7_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q7_2"  id="Q7_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="13" width="650" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="2" cols="30" name="Q8_A" id="Q8_A" maxlength="400" style="width:100%;" placeholder="진로/취업 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:180%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:180%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="2" width="71" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>참여여부</SPAN></P>
	</TD>
	<TD colspan="5" width="128" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="129" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>Y</SPAN></P>
	</TD>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>N</SPAN></P>
	</TD>
	<TD width="25" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="7" width="47" height="294" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>전 공</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:-1.5pt;line-height:130%;'>특성화</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>영 역</SPAN></P>
	</TD>
	<TD width="323" height="90" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 교과목 신설 및 운영</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 1,2학기 진행)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>- 1학년 : 정보공유의 이해</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>- 2학년 : 학술정보와 오픈액세스, 정보공유와 XML</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'>- <SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>3학년 : MARC와 RDA, 정보공유와 LDO, LOD 구축실습</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'>- <SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>4학년 : LOD 정보서비스, 캡스톤 디자인 </SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_YN" id="Q9_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_YN" id="Q9_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_1"  id="Q9_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_1"  id="Q9_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_1"  id="Q9_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_1"  id="Q9_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_1"  id="Q9_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_2"  id="Q9_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_2"  id="Q9_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_2"  id="Q9_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_2"  id="Q9_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q9_2"  id="Q9_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.5pt;line-height:130%;'>특성화 관련 팀프로젝트 과제 수행</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(학기별로 6개 팀프로젝트 운영)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_YN" id="Q10_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_YN" id="Q10_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_1"  id="Q10_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_1"  id="Q10_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_1"  id="Q10_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_1"  id="Q10_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_1"  id="Q10_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_2"  id="Q10_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_2"  id="Q10_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_2"  id="Q10_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_2"  id="Q10_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q10_2"  id="Q10_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>정보공유 및 LOD캠프 개최 </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(특성화 분야 이해를 위한 이론 학습 및 실습)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_YN" id="Q11_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_YN" id="Q11_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_1"  id="Q11_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_1"  id="Q11_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_1"  id="Q11_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_1"  id="Q11_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_1"  id="Q11_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_2"  id="Q11_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_2"  id="Q11_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_2"  id="Q11_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_2"  id="Q11_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q11_2"  id="Q11_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="63" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>국내 기관 견학 프로그램 운영</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(한국정보관리학회 및 중앙대도서관 탐방, 청주고인쇄 박물관, 국립세종도서관, 세종청사, 국립중앙도서관, 서울디저털도서관, 순천 기적의 도서관)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_YN" id="Q12_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_YN" id="Q12_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_1"  id="Q12_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_1"  id="Q12_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_1"  id="Q12_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_1"  id="Q12_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_1"  id="Q12_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_2"  id="Q12_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_2"  id="Q12_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_2"  id="Q12_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_2"  id="Q12_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q12_2"  id="Q12_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>국외 기관 견학 프로그램</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(싱가포르 및 일본 기관 연수 체험)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_YN" id="Q13_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_YN" id="Q13_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_1"  id="Q13_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_1"  id="Q13_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_1"  id="Q13_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_1"  id="Q13_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_1"  id="Q13_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_2"  id="Q13_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_2"  id="Q13_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_2"  id="Q13_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_2"  id="Q13_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q13_2"  id="Q13_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 역량 개발을 위한 연합동아리 운영</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_YN" id="Q14_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_YN" id="Q14_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_1"  id="Q14_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_1"  id="Q14_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_1"  id="Q14_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_1"  id="Q14_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_1"  id="Q14_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_2"  id="Q14_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_2"  id="Q14_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_2"  id="Q14_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_2"  id="Q14_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q14_2"  id="Q14_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="13" width="650" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="2" cols="30" name="Q15_A" id="Q15_A" maxlength="400" style="width:100%;" placeholder="전공특성화 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:180%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:180%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="32" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="2" width="71" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>참여여부</SPAN></P>
	</TD>
	<TD colspan="5" width="128" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="129" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>Y</SPAN></P>
	</TD>
	<TD width="35" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:double #5d5d5d 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>N</SPAN></P>
	</TD>
	<TD width="25" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:double #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:double #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="26" height="16" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:double #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="4" width="47" height="170" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>학 생</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>활 동</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>영 역</SPAN></P>
	</TD>
	<TD width="323" height="33" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.5pt;line-height:130%;'>선후배간의 소통 및 전공학습 멘토링</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.5pt;color:#ff0000;line-height:130%;'>(전공학습 개념 추가)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(멘토1인, 멘티5인으로 구성, 멘토 장학금 지급)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_YN" id="Q16_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_YN" id="Q16_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_1"  id="Q16_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_1"  id="Q16_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_1"  id="Q16_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_1"  id="Q16_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_1"  id="Q16_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_2"  id="Q16_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_2"  id="Q16_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_2"  id="Q16_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_2"  id="Q16_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q16_2"  id="Q16_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="58" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>자체학습모임 활동</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(6개팀으로 자발적인 학습모임 진행, 글로컬 역량강화 프로그램과 연계하여 진행)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_YN" id="Q17_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_YN" id="Q17_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_1"  id="Q17_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_1"  id="Q17_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_1"  id="Q17_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_1"  id="Q17_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_1"  id="Q17_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_2"  id="Q17_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_2"  id="Q17_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_2"  id="Q17_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_2"  id="Q17_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q17_2"  id="Q17_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>사회실천 봉사활동</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.4pt;line-height:130%;'>국립장애인도서관,완산시립도서관, 농업과학도서관,</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>&nbsp;열린점자 작은도서관)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_YN" id="Q19_YN" value="Y" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_YN" id="Q19_YN" value="N" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_1"  id="Q19_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_1"  id="Q19_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_1"  id="Q19_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_1"  id="Q19_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_1"  id="Q19_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_2"  id="Q19_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_2"  id="Q19_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_2"  id="Q19_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_2"  id="Q19_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q19_2"  id="Q19_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="13" width="650" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="2" cols="30" name="Q20_A" id="Q20_A" maxlength="400" style="width:100%;" placeholder="학생활동 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle0><SPAN STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%;'><BR></SPAN></P>

<P CLASS=HStyle0>
<TABLE align="center" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 교육환경 개선 영역</caption>
<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="320" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내용</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="4" width="47" height="161" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>전공실습환경</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>개선</SPAN></P>
	</TD>
	<TD width="320" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>-학과 전용 전공실습실(417호) 구축 및 체계적 운영 </SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>-디지털 실습기자재 확충(모니터4대, 캠코더 1대 등)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'> </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_1"  id="Q21_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_1"  id="Q21_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_1"  id="Q21_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_1"  id="Q21_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_1"  id="Q21_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_2"  id="Q21_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_2"  id="Q21_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_2"  id="Q21_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_2"  id="Q21_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q21_2"  id="Q21_2"  value="5" ></td>
</TR>
<TR>
	<TD width="320" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>-전공실습실내 학생 커뮤니케이션 공간 확충</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.7pt;color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(회의테이블, 의자, 캐비닛 구축)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_1"  id="Q22_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_1"  id="Q22_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_1"  id="Q22_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_1"  id="Q22_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_1"  id="Q22_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_2"  id="Q22_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_2"  id="Q22_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_2"  id="Q22_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_2"  id="Q22_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q22_2"  id="Q22_2"  value="5" ></td>
</TR>
<TR>
	<TD width="320" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>Linked Open Data 플랫폼 및 서버 확충</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(LOD플랫폼 및 서버 구축으로 LOD실습 환경개선)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_1"  id="Q23_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_1"  id="Q23_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_1"  id="Q23_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_1"  id="Q23_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_1"  id="Q23_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_2"  id="Q23_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_2"  id="Q23_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_2"  id="Q23_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_2"  id="Q23_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q23_2"  id="Q23_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="652" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="3" cols="30" name="Q24_A" id="Q24_A" maxlength="400" style="width:100%;" placeholder="전공실습환경 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="320" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내용</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" width="47" height="121" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>행정</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>지원</SPAN></P>
	</TD>
	<TD width="320" height="43" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 사업 행정지원 전담인력 운영</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(전담직원 1명, 전담조교 1명)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_1"  id="Q25_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_1"  id="Q25_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_1"  id="Q25_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_1"  id="Q25_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_1"  id="Q25_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_2"  id="Q25_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_2"  id="Q25_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_2"  id="Q25_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_2"  id="Q25_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q25_2"  id="Q25_2"  value="5" ></td>
</TR>
<TR>
	<TD width="320" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.4pt;line-height:130%;'>근로장학생 운영을 통한 행정지원 및 실습</SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.4pt;color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(학기별 2명, 하계/동계 2명)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_1"  id="Q26_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_1"  id="Q26_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_1"  id="Q26_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_1"  id="Q26_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_1"  id="Q26_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_2"  id="Q26_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_2"  id="Q26_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_2"  id="Q26_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_2"  id="Q26_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q26_2"  id="Q26_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="652" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="3" cols="30" name="Q27_A" id="Q27_A" maxlength="400" style="width:100%;" placeholder="행정지원 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="320" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>내용</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="17" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="25" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:160%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" width="47" height="152" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>재정</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>지원</SPAN></P>
	</TD>
	<TD width="320" height="58" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화동아리/자체학습동아리/전공학습멘토링/팀프로젝트/사회실천봉사활동 등에 대한 운영비 지원</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_1"  id="Q28_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_1"  id="Q28_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_1"  id="Q28_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_1"  id="Q28_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_1"  id="Q28_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_2"  id="Q28_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_2"  id="Q28_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_2"  id="Q28_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_2"  id="Q28_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q28_2"  id="Q28_2"  value="5" ></td>
</TR>
<TR>
	<TD width="320" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>국내외 견학 및 체험프로그램 운영비 지원</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(국외의 경우 싱가포르 1인당 140만원, 일본은 104만원 지원 등)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_1"  id="Q29_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_1"  id="Q29_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_1"  id="Q29_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_1"  id="Q29_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_1"  id="Q29_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_2"  id="Q29_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_2"  id="Q29_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_2"  id="Q29_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_2"  id="Q29_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q29_2"  id="Q29_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="652" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="3" cols="30" name="Q30_A" id="Q30_A" maxlength="400" style="width:100%;" placeholder="행정지원 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle0><BR></P>

<P CLASS=HStyle0>
<TABLE align="center" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 홍보 및 만족도 영역</caption>
<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" width="47" height="162" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>홍보</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>영역</SPAN></P>
	</TD>
	<TD width="323" height="53" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 사업에 대한 사업설명회</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(1학기 : 1학년 학부모 초청 사업설명회 </SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_1"  id="Q31_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_1"  id="Q31_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_1"  id="Q31_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_1"  id="Q31_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_1"  id="Q31_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_2"  id="Q31_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_2"  id="Q31_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_2"  id="Q31_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_2"  id="Q31_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q31_2"  id="Q31_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 교육프로그램 및 교육활동에 대한 학생 대상 공지 및 안내 </SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(게시판, 카톡, 홍보리플릿 배포 등)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_1"  id="Q32_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_1"  id="Q32_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_1"  id="Q32_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_1"  id="Q32_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_1"  id="Q32_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_2"  id="Q32_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_2"  id="Q32_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_2"  id="Q32_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_2"  id="Q32_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q32_2"  id="Q32_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="656" height="63" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="5" cols="30" name="Q33_A" id="Q33_A" maxlength="400" style="width:100%;" placeholder="홍보 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="323" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="166" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="33" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="3" width="47" height="141" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>만족도</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:8.1pt;font-family:"굴림체";letter-spacing:0.7pt;line-height:130%;'>영역</SPAN></P>
	</TD>
	<TD width="323" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>세부 프로그램 종료할 때 마다 참여학생의 만족도조사 실시</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(예 : 전문가초청특강 종료후 학생 만족도 조사)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_1"  id="Q34_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_1"  id="Q34_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_1"  id="Q34_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_1"  id="Q34_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_1"  id="Q34_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_2"  id="Q34_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_2"  id="Q34_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_2"  id="Q34_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_2"  id="Q34_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q34_2"  id="Q34_2"  value="5" ></td>
</TR>
<TR>
	<TD width="323" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>특성화 종료 시 학과 전체 학생의 만족도 조사 실시</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_1"  id="Q35_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_1"  id="Q35_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_1"  id="Q35_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_1"  id="Q35_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_1"  id="Q35_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_2"  id="Q35_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_2"  id="Q35_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_2"  id="Q35_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_2"  id="Q35_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q35_2"  id="Q35_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="652" height="47" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="3" cols="30" name="Q36_A" id="Q36_A" maxlength="400" style="width:100%;" placeholder="만족도 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요. "></textarea>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle0><SPAN STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%;'><BR></SPAN></P>


<!-- 평가 및 장학금 영역 -->
<P CLASS=HStyle0>
<TABLE align="center" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 평가 및 장학금 영역</caption>

<TR>
	<TD rowspan="2" width="47" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #5d5d5d 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>영역</SPAN></P>
	</TD>
	<TD rowspan="2" width="361" height="42" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>내&nbsp; 용</SPAN></P>
	</TD>
	<TD colspan="5" width="147" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>기대도</SPAN></P>
	</TD>
	<TD colspan="5" width="147" height="20" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #5d5d5d 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>만족도</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>1점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>2점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>3점</SPAN></P>
	</TD>
	<TD width="29" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>4점</SPAN></P>
	</TD>
	<TD width="30" height="23" valign="middle" bgcolor="#e5e5e5" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";font-weight:"bold";line-height:130%;'>5점</SPAN></P>
	</TD>
</TR>
<TR>
	<TD rowspan="4" width="47" height="153" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>평가영역</SPAN></P>
	</TD>
	<TD width="361" height="25" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>참여 프로그램 종료 시 결과보고서 작성 및 제출</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_1"  id="Q37_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_1"  id="Q37_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_1"  id="Q37_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_1"  id="Q37_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_1"  id="Q37_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_2"  id="Q37_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_2"  id="Q37_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_2"  id="Q37_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_2"  id="Q37_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q37_2"  id="Q37_2"  value="5" ></td>
</TR>
<TR>
	<TD width="361" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>학기말에 프로그램별 지도교수가 진행하는 자체평가회 진행</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_1"  id="Q38_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_1"  id="Q38_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_1"  id="Q38_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_1"  id="Q38_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_1"  id="Q38_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_2"  id="Q38_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_2"  id="Q38_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_2"  id="Q38_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_2"  id="Q38_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q38_2"  id="Q38_2"  value="5" ></td>
</TR>
<TR>
	<TD width="361" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>매년 말에 4가지 핵심역량 평가를 통한 LISTar 포인트 부여 </SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>: </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";letter-spacing:0.2pt;line-height:130%;'>글로벌역량, 산업실무역량, 전공역량, 융합소통역량</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_1"  id="Q39_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_1"  id="Q39_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_1"  id="Q39_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_1"  id="Q39_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_1"  id="Q39_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_2"  id="Q39_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_2"  id="Q39_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_2"  id="Q39_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_2"  id="Q39_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q39_2"  id="Q39_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="656" height="65" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="5" cols="30" name="Q40_A" id="Q40_A" maxlength="400" style="width:100%;" placeholder="평가 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
<TR>
	<TD rowspan="5" width="47" height="220" valign="middle" style='border-left:solid #5d5d5d 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>장학영역</SPAN></P>
	</TD>
	<TD width="361" height="32" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>LISTar 포인트 합산하여 우수 장학금 지급</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(LISTar 포인트 상위 22명에게 지급)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_1"  id="Q41_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_1"  id="Q41_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_1"  id="Q41_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_1"  id="Q41_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_1"  id="Q41_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_2"  id="Q41_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_2"  id="Q41_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_2"  id="Q41_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_2"  id="Q41_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q41_2"  id="Q41_2"  value="5" ></td>
</TR>
<TR>
	<TD width="361" height="58" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>팀 프로젝트 성과달성 장학금 지급</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(매 학기 팀 프로젝트 참여 학생에 한하여, 수행결과를 평가하여 우수 장학금 지급)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_1"  id="Q42_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_1"  id="Q42_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_1"  id="Q42_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_1"  id="Q42_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_1"  id="Q42_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_2"  id="Q42_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_2"  id="Q42_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_2"  id="Q42_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_2"  id="Q42_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q42_2"  id="Q42_2"  value="5" ></td>
</TR>
<TR>
	<TD width="361" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>전공학습 멘토링 장학금 지급</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(매 학기 멘토링 운영 멘토4명에 대하여 격려 장학금 지급)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_1"  id="Q43_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_1"  id="Q43_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_1"  id="Q43_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_1"  id="Q43_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_1"  id="Q43_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_2"  id="Q43_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_2"  id="Q43_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_2"  id="Q43_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_2"  id="Q43_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q43_2"  id="Q43_2"  value="5" ></td>
</TR>
<TR>
	<TD width="361" height="31" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>근로장학생 장학금 지급 </SPAN><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";color:#ff0000;line-height:130%;'>(2차년도 신설)</SPAN></P>
	<P CLASS=HStyle0 STYLE='line-height:130%;'><SPAN STYLE='font-size:9.0pt;font-family:"굴림체";line-height:130%;'>(매 학기 사무실 및 실습실 관리, 행정보조 업무 1명)</SPAN></P>
	</TD>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_1"  id="Q44_1"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_1"  id="Q44_1"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_1"  id="Q44_1"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_1"  id="Q44_1"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_1"  id="Q44_1"  value="5" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_2"  id="Q44_2"  value="1" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_2"  id="Q44_2"  value="2" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_2"  id="Q44_2"  value="3" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_2"  id="Q44_2"  value="4" ></td>
					<TD width="26" height="16" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'><input type="radio" name="Q44_2"  id="Q44_2"  value="5" ></td>
</TR>
<TR>
	<TD colspan="11" width="656" height="63" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<textarea rows="5" cols="30" name="Q45_A" id="Q45_A" maxlength="400" style="width:100%;" placeholder="장학 분야에 불만족했다면 그 이유와 생각하는 개선방안을 기술해 주세요."></textarea>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle0><SPAN STYLE='font-size:11.0pt;line-height:160%;'><BR></SPAN></P>

<P CLASS=HStyle0 STYLE='margin-left:5.4pt;text-indent:-5.4pt;'><SPAN STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%;'><BR></SPAN></P>

<P CLASS=HStyle0>
<TABLE align="center" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
	<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 기타 영역</caption>
				
				<tr><TD colspan="11" width="707" height="63" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
				<textarea rows="5" cols="30" name="Q46_A" id="Q46_A" maxlength="400" style="width:100%;" placeholder="특성화와 관련한 교육프로그램 등에 대한 개선사항, 요구사항이 있으시면 서술해 주십시오."></textarea>
				</td></tr>
</TABLE></P>

<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:12.0pt;font-family:"HY헤드라인M";letter-spacing:0.4pt;line-height:130%;'><BR></SPAN></P>
<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:12.0pt;font-family:"HY헤드라인M";letter-spacing:0.4pt;line-height:130%;'><BR></SPAN></P>


<!-- 통계분석을 위한 인적 사항 -->

<P CLASS=HStyle0>
<TABLE class="table1" align="center" width="707" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<caption CLASS=HStyle0 STYLE='font-size:11.0pt;font-weight:"bold";line-height:160%; text-align:left'>■ 통계분석을 위한 인적 사항</caption>
<TR style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;'>
	
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:"굴림체";line-height:130%;'>성별</SPAN></P>
	</TD>
				<td colspan="2"><input type="radio" name="Q47"  id="Q47"  value="1">남성</td>
				<td colspan="2"><input type="radio" name="Q47"  id="Q47"  value="2">여성</td>

</TR>
<TR style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;'>
	
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #5d5d5d 0.4pt;;border-bottom:solid #000000 0.4pt;padding:1.4pt 0.0pt 1.4pt 0.0pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:"굴림체";line-height:130%;'>학년</SPAN></P>
	</TD>
					<td style="width:20%;"><input type="radio" name="Q48"  id="Q48"  value="1">1학년</td>
					<td style="width:20%;"><input type="radio" name="Q48"  id="Q48"  value="2">2학년</td>
					<td style="width:20%;"><input type="radio" name="Q48"  id="Q48"  value="3">3학년</td>
					<td style="width:20%;"><input type="radio" name="Q48"  id="Q48"  value="4">4학년</td>
</TR>
</TABLE></P>



<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:12.0pt;font-family:"HY헤드라인M";letter-spacing:0.4pt;line-height:130%;'><BR></SPAN></P>

<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:12.0pt;font-family:"HY헤드라인M";letter-spacing:0.4pt;line-height:130%;'><BR></SPAN></P>

<div align="center"><input type="button" value="설문 완료" onclick=end();></button></div>

<P CLASS=HStyle0><BR></P>

	</form>
	
	</div>
	</div>
</BODY>

</HTML>