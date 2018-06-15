package kr.sh86.myApp.survey.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.sh86.myApp.survey.dao.SurveyDao;
import kr.sh86.myApp.survey.domain.Ars;
import kr.sh86.myApp.survey.domain.ArsRes;
import kr.sh86.myApp.survey.domain.BioResponse;
import kr.sh86.myApp.survey.domain.BioUser;
import kr.sh86.myApp.survey.domain.Dialing;
import kr.sh86.myApp.survey.domain.ExceptionTel;
import kr.sh86.myApp.survey.domain.Home35;
import kr.sh86.myApp.survey.domain.Mms;
import kr.sh86.myApp.survey.domain.ResData;
import kr.sh86.myApp.survey.domain.Response;
import kr.sh86.myApp.survey.domain.Result;
import kr.sh86.myApp.survey.domain.Sample;
import kr.sh86.myApp.survey.domain.Sampling;
import kr.sh86.myApp.survey.domain.SbResult;
import kr.sh86.myApp.survey.domain.Sinbo;
import kr.sh86.myApp.survey.domain.User;
import kr.sh86.myApp.survey.domain.Users;
import kr.sh86.myApp.survey.domain.Xroshot;
import kr.sh86.myApp.util.UtilDate;
import kr.sh86.myApp.util.ExcelRead;
import kr.sh86.myApp.util.ReadOption;

@Service
public class SurveyService {
	
	@Autowired
	private SurveyDao surveyDao;
	
	//신보 - 회원번호 검색
	public Map<String, Object> readSbNumServ(String sbHp){
		Map<String, Object> map = new HashMap<String, Object>();
		int sbNum = surveyDao.selectSbNum(sbHp);
		map.put("sbNum", sbNum);
		map.put("result", "succ");
		
		return map;
	}
	//응답부분입력
	public Map<String, Object> createResServ(Users user){
		//리턴값 세팅(성공여부, 응답번호)
		Map<String, Object> map = new HashMap<String, Object>();
		Response response = new Response();
		//임시 유저 아이디 세팅
		response.setUserNo(user.getUserNo());
		response.setGrade(user.getUserGrade());
		response.setSex(user.getUserSex());
		
		int result=0;
		//응답여부 확인
		int resCount = surveyDao.selectCountRes(user.getUserNo());
		
		if(resCount == 0) { // 응답내용 없을때
			//인서트
			result = surveyDao.insertRes(response);
			if(result > 0) {
				map.put("check", "success"); 
				map.put("resNo", String.valueOf(response.getResNo()));
				System.out.println("신규입력 성공");
			}else if(result == 0) {
				map.put("check", "fail"); 
				System.out.println("신규입력 실패");
			}
		}else if(resCount == 1){
			map.put("check", "already");
			int resNo = surveyDao.selectResNo(user.getUserNo());
			response.setResNo(resNo);
			System.out.println("이미등록됨");
		}
		System.out.println("response 확인 : "+response);
		map.put("response", response);
		return map;
	}
	
	// 응답자 정보조회
	public Users readUserServ(int userNo) {
		return surveyDao.selectUser(userNo);
	}
	
	// 문항마다 응답내용 갱신
	public Map<String, String> modifyResServ(int userNo, int resNo, int nowPageNum, String ansC, String ansK, String ansM, String ansEtc){
		Response response = new Response();
		response.setResNo(resNo);
		if(nowPageNum == 1) {
			response.setQ1c(ansC);
			response.setQ1k(ansK);
			response.setQ1m(ansM);
			if(!ansEtc.equals("none")) response.setQ1Etc(ansEtc);
		}else if(nowPageNum == 2) {
			response.setQ2c(ansC);
			response.setQ2k(ansK);
			response.setQ2m(ansM);
		}else if(nowPageNum == 3) {
			response.setQ3c(ansC);
			response.setQ3k(ansK);
			response.setQ3m(ansM);
		}else if(nowPageNum == 4) {
			response.setQ4c(ansC);
			response.setQ4k(ansK);
			response.setQ4m(ansM);
		}else if(nowPageNum == 5) {
			response.setQ5c(ansC);
			response.setQ5k(ansK);
			response.setQ5m(ansM);
		}else if(nowPageNum == 6) {
			response.setQ6c(ansC);
			response.setQ6k(ansK);
			response.setQ6m(ansM);
			if(!ansEtc.equals("none")) response.setQ6Etc(ansEtc);
		}else if(nowPageNum == 7) {
			response.setQ7c(ansC);
			response.setQ7k(ansK);
			response.setQ7m(ansM);
		}else if(nowPageNum == 8) {
			response.setQ8c(ansC);
			response.setQ8k(ansK);
			response.setQ8m(ansM);
		}else if(nowPageNum == 9) {
			response.setQ9c(ansC);
			response.setQ9k(ansK);
			response.setQ9m(ansM);
		}else if(nowPageNum == 10) {
			response.setQ10c(ansC);
			response.setQ10k(ansK);
			response.setQ10m(ansM);
		}else if(nowPageNum == 11) {
			response.setQ11c(ansC);
			response.setQ11k(ansK);
			response.setQ11m(ansM);
			if(!ansEtc.equals("none")) response.setQ11Etc(ansEtc);
		}else if(nowPageNum == 12) {
			response.setQ12c(ansC);
			response.setQ12k(ansK);
			response.setQ12m(ansM);
		}else if(nowPageNum == 13) {
			response.setQ13c(ansC);
			response.setQ13k(ansK);
			response.setQ13m(ansM);
		}else if(nowPageNum == 14) {
			response.setQ14c(ansC);
			response.setQ14k(ansK);
			response.setQ14m(ansM);
			if(!ansEtc.equals("none")) response.setQ14Etc(ansEtc);
		}else if(nowPageNum == 15) {
			response.setQ15k(ansK);
			response.setQ15m(ansM);
		}else if(nowPageNum == 16) {
			response.setQ16k(ansK);
			response.setQ16m(ansM);
			if(!ansEtc.equals("none")) response.setQ16Etc(ansEtc);
		}else if(nowPageNum == 17) {
			response.setQ17k(ansK);
			response.setQ17m(ansM);
		}else if(nowPageNum == 18) {
			response.setQ18k(ansK);
			response.setQ18m(ansM);
			if(!ansEtc.equals("none")) response.setQ18Etc(ansEtc);
		}else if(nowPageNum == 19) {
			response.setQ19k(ansK);
			response.setQ19m(ansM);
		}else if(nowPageNum == 20) {
			response.setQ20k(ansK);
			response.setQ20m(ansM);
			if(!ansEtc.equals("none")) response.setQ20Etc(ansEtc);
		}else if(nowPageNum == 21) {
			response.setQ21k(ansK);
			response.setQ21m(ansM);
			if(!ansEtc.equals("none")) response.setQ21Etc(ansEtc);
		}else if(nowPageNum == 22) {
			response.setQ22k(ansK);
			response.setQ22m(ansM);
		}else if(nowPageNum == 23) {
			response.setQ23k(ansK);
			response.setQ23m(ansM);
			if(!ansEtc.equals("none")) response.setQ23Etc(ansEtc);
		}else if(nowPageNum == 24) {
			response.setQ24k(ansK);
			response.setQ24m(ansM);
		}else if(nowPageNum == 25) {
			response.setQ25k(ansK);
			response.setQ25m(ansM);
		}else if(nowPageNum == 26) {
			response.setQ26k(ansK);
			response.setQ26m(ansM);
			if(!ansEtc.equals("none")) response.setQ26Etc(ansEtc);
		}else if(nowPageNum == 27) {
			response.setQ27k(ansK);
			response.setQ27m(ansM);
		}else if(nowPageNum == 28) {
			response.setQ28k(ansK);
			response.setQ28m(ansM);
		}else if(nowPageNum == 29) {
			response.setQ29k(ansK);
			response.setQ29m(ansM);
		}else if(nowPageNum == 30) {
			response.setQ30k(ansK);
			response.setQ30m(ansM);
			if(!ansEtc.equals("none")) response.setQ30Etc(ansEtc);
		}else if(nowPageNum == 31) {
			if(!ansEtc.equals("none")) response.setQ31Etc(ansEtc);
		}
		
		int result = surveyDao.updateRes(response);
		
		Map<String, String> map = new HashMap<String, String>();
		if(result > 0 ) {
			Users user = new Users();
			user.setUserNo(userNo);
			user.setResComplete(nowPageNum);
			
			int upResult = surveyDao.updateUserLastComplete(user);
			if(upResult == 1) map.put("check", "success");
		}
		else map.put("check", "fail");
		
		return map;
	}
	
	//문자 변수 세팅해주는 메서드
	public Mms setMms(int scheduleType, String subject, String callback, String destInfo, int destCount, String msg) {
		Mms mms = new Mms();
		mms.setCallback(callback);
		mms.setDestCount(destCount);
		mms.setDestInfo(destInfo);
		mms.setSubject(subject);
		mms.setScheduleType(scheduleType);
		mms.setMmsMsg(msg);
		
		return mms;
	}
	
	//신보 문자보내기
	public Map<String, Object> sendSmsSinboServ(String order, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		
		final int scheduleType = 0;
		final String subject = "신용보증재단 만족도조사";
		final String callback = "0632880488"; //발송번호는 등록된 번호만 가능. 추후 대표님 폰등은 필요하면 따로 등록.
		msg += "\r\n조사응답바로가기 : http://bestpoll.kr/19/0726.jsp?SB_NUM=";
		String msg2 = "\r\n\r\n";
		msg2 += "수신거부 bestpoll.kr/19/rej.jsp?SB_NUM=";
		String mmsMsg = null;
		
		/*System.out.println("msg : "+msg);
		Mms mms = new Mms();
		String destInfo = "윤재호"+"^"+"01038390401";
		mmsMsg = msg + "1111" + msg2 + "1111";
		int destCount = 1;
		mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
		
		int result = surveyDao.sendMmsToSelected(mms);
		if(result == 1) {
			System.out.println(" 번째 문자발송 성공!!");
		}*/
		
		//발송자 조회
		List<Sinbo> list = new ArrayList<Sinbo>();
		if(order.equals("first")) {
			list = surveyDao.selSinboFirTarget();
		}else if(order.equals("second")) {
			list = surveyDao.selSinboSecTarget();	
		}else if(order.equals("last")) {
			list = surveyDao.selSinboLastTarget();	
		}
		
		UtilDate utilDate = new UtilDate();
		String today = utilDate.getCurrentDate();
		
		//문자발송
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			Mms mms = new Mms();
			String destInfo = list.get(i).getSbCeo()+"^"+list.get(i).getSbHp();
			mmsMsg = msg + list.get(i).getSbNum() + msg2 + list.get(i).getSbNum();
			int destCount = 1;
			mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
			
			int result = surveyDao.sendMmsToSelected(mms);
			if(result == 1) {
				System.out.println(" 번째 문자발송 성공!!");
				if(order.equals("first")) {
					list.get(i).setSbOrderCount("1");
				}else {
					if(Integer.parseInt(list.get(i).getSbOrderCount()) == 1) {
						list.get(i).setSbSecDate(today);
					}else if(Integer.parseInt(list.get(i).getSbOrderCount()) == 2) {
						list.get(i).setSbThiDate(today);
					}
					list.get(i).setSbOrderCount(String.valueOf(Integer.parseInt(list.get(i).getSbOrderCount()+1)));					
				}
				list.get(i).setSbResCheck("미응답");
				int upResult = surveyDao.updateSinboState(list.get(i));
				if(upResult == 1) {
					succ++;
				}else {
					fail++;
				}
			}else {
				fail++;
			}
		}
		map.put("succ", succ);
		map.put("fail", fail);
		return map;
	}
	
	//신보 문자보내기2 - 전화면접후 부재중, 추후응답자 조회하여 문자 마지막 발송
	public Map<String, Object> sendSmsSinboLastServ(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		final int scheduleType = 0;
		final String subject = "신용보증재단 만족도조사";
		final String callback = "0632880488"; //발송번호는 등록된 번호만 가능. 추후 대표님 폰등은 필요하면 따로 등록.
		String msg = "전북신용보증재단 서비스 만족도 조사입니다.\r\n" + 
				"아래 링크를 눌러 조사에 응답해 주시면 더욱 좋은 서비스로 보답 하겠습니다.\r\n" + 
				"편하신 시간에 응답해 주시기 바랍니다.\r\n" + 
				"\r\n" + 
				"응답하기 : http://bestpoll.kr/19/0726.jsp?SB_NUM=";
		String msg2 = "\r\n\r\n";
		msg2 += "수신거부 bestpoll.kr/19/rej.jsp?SB_NUM=";
		String mmsMsg = null;
		
		//발송자 조회
		List<Sinbo> list = surveyDao.selSinboLastTarget(); //부재중
		List<Sinbo> list2 = surveyDao.selSinboLastTarget2(); //추후응답
		
		UtilDate utilDate = new UtilDate();
		String today = utilDate.getCurrentDate();
		
		//문자발송
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			Mms mms = new Mms();
			String destInfo = list.get(i).getSbCeo()+"^"+list.get(i).getSbHp();
			mmsMsg = msg + list.get(i).getSbNum() + msg2 + list.get(i).getSbNum();
			int destCount = 1;
			mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
			
			int result = surveyDao.sendMmsToSelected(mms);
			if(result == 1) {
				succ++;
			}else {
				fail++;
			}
		}
		for(int i=0; i<list2.size(); i++) {
			Mms mms = new Mms();
			String destInfo = list2.get(i).getSbCeo()+"^"+list2.get(i).getSbHp();
			mmsMsg = msg + list2.get(i).getSbNum() + msg2 + list2.get(i).getSbNum();
			int destCount = 1;
			mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
			
			int result = surveyDao.sendMmsToSelected(mms);
			if(result == 1) {
				succ++;
			}else {
				fail++;
			}
		}
		map.put("succ", succ);
		map.put("fail", fail);
		return map;
	}
	
	//문자 - mms발송
	public int sendMmsServ() {
		final int scheduleType = 0;
		final String subject = "학술정보GlocalMaster 양성사업 만족도조사";
		final String callback = "0632880488"; //발송번호는 등록된 번호만 가능. 추후 대표님 폰등은 필요하면 따로 등록.
		String msg = "전주대 학술정보 Glocal Master 양성 사업단 입니다. \n 아래 링크를 눌러 조사에 응답해 주시면 향후 양성사업의 개선에 많은 도움이 될 것입니다. \n 편하신 시간에 응답해 주시기 바랍니다.";
		msg += "\n http://sh86.kr/myApp/?userNo=";
		String destInfo = null;
		int destCount = 0; // 수신자목록 개수 최대:100
		int result = 0;
		String mmsMsg = null;
		
		Mms mms = new Mms();
		
		List<Users> userList = surveyDao.selectUserAll(); // 문자 보낼 회원조회
		
		for(int i=0; i<userList.size(); i++) {
			mmsMsg = null;
			destInfo = userList.get(i).getUserName() + "^" + userList.get(i).getUserHp().replaceAll("-", "");
			mmsMsg = msg + userList.get(i).getUserNo();
			destCount = 1;
			mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
			result = surveyDao.sendMmsToSelected(mms);
			if(result == 1) System.out.println(i+" 번째 문자발송 성공!!");
		}
		
		return result;
	}
	
	//문자 - mms발송(미응답자)
	public List<String> sendMmsNoResServ() {
		final int scheduleType = 0;
		final String subject = "학술정보GlocalMaster 양성사업 만족도조사";
		final String callback = "0632880488"; //발송번호는 등록된 번호만 가능. 추후 대표님 폰등은 필요하면 따로 등록.
		String msg = "전주대 학술정보 Glocal Master 양성 사업단 입니다. \n 아래 링크를 눌러 조사에 응답해 주시면 향후 양성사업의 개선에 많은 도움이 될 것입니다. \n 편하신 시간에 응답해 주시기 바랍니다.";
		msg += "\n http://sh86.kr/myApp/?userNo=";
		String destInfo = null;
		int destCount = 0; // 수신자목록 개수 최대:100
		int result = 0;
		String mmsMsg = null;
		
		Mms mms = new Mms();
		
		List<Users> userList = surveyDao.selectReSendList(); // 문자 보낼 회원조회(미응답자)
		
		String mmsResult = "";
		List<String> resList = new ArrayList<String>();
		
		for(int i=0; i<userList.size(); i++) {
			mmsMsg = null;
			destInfo = userList.get(i).getUserName() + "^" + userList.get(i).getUserHp().replaceAll("-", "");
			mmsMsg = msg + userList.get(i).getUserNo();
			destCount = 1;
			mms = setMms(scheduleType, subject, callback, destInfo, destCount, mmsMsg);
			result = surveyDao.sendMmsToSelected(mms);
			if(result == 1) mmsResult = userList.get(i).getUserName()+" 님 문자발송 성공!!";
			else if(result == 0) mmsResult = userList.get(i).getUserName()+" 님 문자발송 실패!!";
			resList.add(mmsResult);
		}
		surveyDao.insertMmsReport();
		
		return resList;
	}
		
	//현황표
	public Map<String, Object> readResStatusServ(){
		//마지막 문자보낸 시간 조회
		List<String> lastTimeList = surveyDao.selectLastMmsTime();
		String lastTime = lastTimeList.get(0).replaceAll("-", "");
		lastTime = lastTime.trim().replaceAll(" ","").substring(0, 10);
		System.out.println("마지막 문자 시간 : "+lastTime);
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		int total = surveyDao.selectUserCount(); //총카운트
		int resTotal = surveyDao.selectResCount(); //응답자
		int resAll = surveyDao.selectResAllCount(); //모든답변응답자
		int mmsFail = surveyDao.selectMmsFailCount(lastTime); //문자전송 실패자
		System.out.println("문자전송 실패자 : "+mmsFail);
		List<String> sendList = surveyDao.selectSendReport();
				
		map.put("total", total);
		map.put("resTotal", resTotal);
		map.put("resAll", resAll);
		map.put("mmsFail", mmsFail);
		map.put("sendList", sendList);
		System.out.println(map);
		return map;
	}
	
	// 베스트풀 중복제거
	public void removeBestpollServ() {
		List<Ars> list = surveyDao.selectBestpoll();
		
		int delCnt = 0;
		for(int i=0; i<list.size(); i++) {
			int result = surveyDao.deleteBestpoll(list.get(i));
			if(result > 0) delCnt++; 
			System.out.println(i+ " 번째 진행중!!");
		}
		
		System.out.println("총 삭제건수 : "+ delCnt);
	}
	
	// 임실군 설문샘플링 세팅
	public int setSamplingImsil(String dong, int sample) {
		int arsNum = 0; // 설문등록 후 바꿔줘야함.
		Sampling sampling = new Sampling();
		sampling.setArsNum(arsNum);
		sampling.setSido("전북");
		sampling.setSigungu("임실군");
		sampling.setDong(dong);
		sampling.setSample(sample);
		
		return surveyDao.insertSamplingImsil(sampling);
	}
	
	// 임실군 설문대상 세팅
	public void setTargerArsImsil() {
		/*List<Sample> list = surveyDao.selectSample();*/ //익산시 인거 조회
		int sampleCnt = 0;
		int count = 0;
		int arsNum = 0;
		/* 익산
		 * String[] dongList = {"오산면","모현동","송학동","중앙동","평화동","인화동","마동","남중동","신동","함열읍","황등면","함라면","웅포면","성당면","용안면","용동면","낭산면","망성면","여산면","금마면","왕궁면","춘포면","삼기면","영등2동","삼성동","동산동","영동1동","어양동","팔봉동"};
		*/
		String[] dongList = {"임실읍","성수면","운암면","신평면","신덕면","관촌면","청웅면","오수면","삼계면","강진면","덕치면","지사면"};
		int[] sampleList = {119, 32, 31, 29, 24, 63, 26, 71, 29, 30, 22, 24}; //비례할당 표본수
		for(int i=0; i<dongList.length; i++) {
			// 임실군 설문샘플링 세팅
			int result = setSamplingImsil(dongList[i], sampleList[i]);
			if(result == 1) sampleCnt++;
			
			List<Sample> list = surveyDao.selectAllHome(dongList[i]); //전화 안건 목록 동별로 조회
			for(int j=0; j<list.size(); j++) {
				Sampling sampling = new Sampling();
				sampling.setArsNum(arsNum);
				sampling.setSido(list.get(j).gettSido());
				sampling.setSigungu(list.get(j).gettSigungu());
				sampling.setDong(list.get(j).gettDong());
				if(list.get(j).gettName() != null && list.get(j).gettName() != "")sampling.setName(list.get(j).gettName());
				sampling.setTel(list.get(j).gettTelNo());
				
				int result2 = surveyDao.insertArsResultTb(sampling);
				if(result2 > 0) System.out.println(j +" 번째 결과테이블 입력성공");
				else if(result2 == 0) System.out.println(j +" 번째 결과테이블 입력실패");
				count++;
			}			
		}
		System.out.println("샘플링 등록 성공건수 : "+sampleCnt);
		System.out.println("총 카운트 : "+count);
		
		/*Sampling sampling = new Sampling();
		sampling.setArsNum(204);
		sampling.setSample(1000);
		sampling.setSido("전북");
		sampling.setSigungu("익산시");
		
		int result = surveyDao.insertSample(sampling); //샘플링데이터 입력
		
		for(int i=0; i<list.size(); i++) {
			sampling = new Sampling();
			sampling.setArsNum(204);
			sampling.setSido("전북");
			sampling.setSigungu("익산시");
			if(list.get(i).gettName() != null && list.get(i).gettName() != "")sampling.setName(list.get(i).gettName());
			sampling.setTel(list.get(i).gettTelNo());
			
			int result2 = surveyDao.insertArsResultTb(sampling);
			if(result2 > 0) System.out.println(i +" 번째 결과테이블 입력성공");
			else if(result2 == 0) System.out.println(i +" 번째 결과테이블 입력실패");
		}*/
	}
	/*List<String> aList = surveyDao.selectAgeCount();
	
	int age1=0; //10
	int age2=0; //20
	int age3=0; //30
	int age4=0; //40
	int age5=0; //50
	int age6=0; //60
	
	for(int i=0; i<aList.size(); i++) {
		
	}*/
	
	/*public void lastResultServ() {
		List<Xroshot> sList = surveyDao.selectResStat();
		
		int checkCount = 0;
		for(int i=0; i<sList.size();i++) {
			//1형, 7형, 8형
			int id = sList.get(i).getMsgId();
			if(id >= 20498 && id <=20565 || id >= 21267 && id <=21327 || id >= 21475 && id <=21785 || id >= 22212 && id <=22443 ||id >= 22589 && id <=22838 ||id >= 22903 && id <=23150) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					System.out.println("가선거구");
					sList.get(i).setAns3(1);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					System.out.println("나선거구");
					sList.get(i).setAns3(2);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					System.out.println("다선거구");
					sList.get(i).setAns3(3);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					System.out.println("라선거구");
					sList.get(i).setAns3(4);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					System.out.println("마선거구");
					sList.get(i).setAns3(5);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					System.out.println("바선거구");
					sList.get(i).setAns3(6);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					System.out.println("사선거구");
					sList.get(i).setAns3(7);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					System.out.println("아선거구");
					sList.get(i).setAns3(8);
				}
				
				//로테이션
				if(id <=22838) {
					
				}else if(id >= 22903) {
					if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
						sList.get(i).setAns5(3);
					}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
						sList.get(i).setAns5(4);
					}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
						sList.get(i).setAns5(5);
					}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
						sList.get(i).setAns5(6);
					}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
						sList.get(i).setAns5(1);
					}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
						sList.get(i).setAns5(2);
					}
				}
				
			//2형
			}else if(id >= 20566 && id <=20802 || id >= 21328 && id <=21474 || id >= 22444 && id <=22588 ||id >= 22839 && id <=22902) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					sList.get(i).setAns3(3);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					sList.get(i).setAns3(4);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					sList.get(i).setAns3(5);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					sList.get(i).setAns3(6);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					sList.get(i).setAns3(7);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					sList.get(i).setAns3(8);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					sList.get(i).setAns3(1);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					sList.get(i).setAns3(2);
				}
				
				if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
					sList.get(i).setAns5(3);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
					sList.get(i).setAns5(4);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
					sList.get(i).setAns5(5);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
					sList.get(i).setAns5(6);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
					sList.get(i).setAns5(1);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
					sList.get(i).setAns5(2);
				}
				
			//3형
			}else if(id >= 20803 && id <=21034 || id >= 21786 && id <=22073) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					sList.get(i).setAns3(5);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					sList.get(i).setAns3(6);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					sList.get(i).setAns3(7);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					sList.get(i).setAns3(8);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					sList.get(i).setAns3(1);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					sList.get(i).setAns3(2);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					sList.get(i).setAns3(3);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					sList.get(i).setAns3(4);
				}
				
				if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
					sList.get(i).setAns5(5);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
					sList.get(i).setAns5(6);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
					sList.get(i).setAns5(1);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
					sList.get(i).setAns5(2);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
					sList.get(i).setAns5(3);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
					sList.get(i).setAns5(4);
				}
			//4형
			}else if(id >= 21035 && id <=21266 || id >= 22074 && id <=22211) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					sList.get(i).setAns3(7);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					sList.get(i).setAns3(8);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					sList.get(i).setAns3(1);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					sList.get(i).setAns3(2);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					sList.get(i).setAns3(3);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					sList.get(i).setAns3(4);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					sList.get(i).setAns3(5);
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					sList.get(i).setAns3(6);
				}
				
				if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
					sList.get(i).setAns5(1);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
					sList.get(i).setAns5(2);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
					sList.get(i).setAns5(5);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
					sList.get(i).setAns5(6);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
					sList.get(i).setAns5(3);
				}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
					sList.get(i).setAns5(4);
				}
			}
			// 입력
			sList.get(i).setNo(i+1);
			int insRes = surveyDao.insertResult(sList.get(i));
			if(insRes == 1) {
				System.out.println(i+"번째 입력성공!!");
				checkCount++;
			}			
		}
		System.out.println("총 입력성공 카운트 : "+checkCount);
	}*/
	
	/*public void lastResult2Serv() {
		List<Xroshot> sList = surveyDao.selectResStat2();
		
		int checkCount = 0;
		for(int i=0; i<sList.size();i++) {
			//1형, 7형, 8형
			int id = sList.get(i).getMsgId();
			if(sList.get(i).getRepliedFile().length() >= 23) {
				if(id >= 20498 && id <=20565 || id >= 21267 && id <=21327 || id >= 21475 && id <=21785 || id >= 22212 && id <=22443 ||id >= 22589 && id <=22838 ||id >= 22903 && id <=23150) {
					
					if(sList.get(i).getRepliedFile().length() == 23) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							System.out.println("가선거구");
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							System.out.println("나선거구");
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							System.out.println("다선거구");
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							System.out.println("라선거구");
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							System.out.println("마선거구");
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							System.out.println("바선거구");
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("7")) {
							System.out.println("사선거구");
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("8")) {
							System.out.println("아선거구");
							sList.get(i).setAns3(8);
						}
					}else if(sList.get(i).getRepliedFile().length() > 23) {
						if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
							System.out.println("가선거구");
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
							System.out.println("나선거구");
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
							System.out.println("다선거구");
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
							System.out.println("라선거구");
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
							System.out.println("마선거구");
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
							System.out.println("바선거구");
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
							System.out.println("사선거구");
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
							System.out.println("아선거구");
							sList.get(i).setAns3(8);
						}
					}
					
					
					//로테이션
					if(id <=22838) {
						
					}else if(id >= 22903) {
						if(sList.get(i).getRepliedFile().length() == 35) {
							if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
								sList.get(i).setAns5(3);
							}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
								sList.get(i).setAns5(4);
							}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
								sList.get(i).setAns5(5);
							}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
								sList.get(i).setAns5(6);
							}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
								sList.get(i).setAns5(1);
							}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
								sList.get(i).setAns5(2);
							}
						}else if(sList.get(i).getRepliedFile().length() > 35){
							if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
								sList.get(i).setAns5(3);
							}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
								sList.get(i).setAns5(4);
							}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
								sList.get(i).setAns5(5);
							}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
								sList.get(i).setAns5(6);
							}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
								sList.get(i).setAns5(1);
							}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
								sList.get(i).setAns5(2);
							}
						}
						
					}
					
				//2형
				}else if(id >= 20566 && id <=20802 || id >= 21328 && id <=21474 || id >= 22444 && id <=22588 ||id >= 22839 && id <=22902) {
					if(sList.get(i).getRepliedFile().length() == 23) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("7")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("8")) {
							sList.get(i).setAns3(2);
						}
					}else if(sList.get(i).getRepliedFile().length() > 23){
						if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
							sList.get(i).setAns3(2);
						}
					}
					
					
					if(sList.get(i).getRepliedFile().length() == 35) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns5(4);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns5(2);
						}
					}else if(sList.get(i).getRepliedFile().length() > 35){
						if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
							sList.get(i).setAns5(4);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
							sList.get(i).setAns5(2);
						}
					}
					
					
				//3형
				}else if(id >= 20803 && id <=21034 || id >= 21786 && id <=22073) {
					if(sList.get(i).getRepliedFile().length() == 23) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("7")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("8")) {
							sList.get(i).setAns3(4);
						}
					}else if(sList.get(i).getRepliedFile().length() > 23) {
						if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
							sList.get(i).setAns3(6);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
							sList.get(i).setAns3(4);
						}
					}
					
					
					if(sList.get(i).getRepliedFile().length() == 35) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns5(2);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns5(4);
						}
					}else if(sList.get(i).getRepliedFile().length() > 35){
						if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
							sList.get(i).setAns5(2);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
							sList.get(i).setAns5(4);
						}
					}
					
				//4형
				}else if(id >= 21035 && id <=21266 || id >= 22074 && id <=22211) {
					if(sList.get(i).getRepliedFile().length() == 23) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("7")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("8")) {
							sList.get(i).setAns3(6);
						}
					}else if(sList.get(i).getRepliedFile().length() > 23) {
						if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
							sList.get(i).setAns3(7);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
							sList.get(i).setAns3(8);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
							sList.get(i).setAns3(1);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
							sList.get(i).setAns3(2);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
							sList.get(i).setAns3(3);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
							sList.get(i).setAns3(4);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
							sList.get(i).setAns3(5);
						}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
							sList.get(i).setAns3(6);
						}
					}
					
					
					if(sList.get(i).getRepliedFile().length() == 35) {
						if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("1")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("2")) {
							sList.get(i).setAns5(2);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("3")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("4")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("5")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(sList.get(i).getRepliedFile().length()-2, sList.get(i).getRepliedFile().length()-1).equals("6")) {
							sList.get(i).setAns5(4);
						}
					}else if(sList.get(i).getRepliedFile().length() > 35){
						if(sList.get(i).getRepliedFile().substring(33, 34).equals("1")) {
							sList.get(i).setAns5(1);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("2")) {
							sList.get(i).setAns5(2);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("3")) {
							sList.get(i).setAns5(5);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("4")) {
							sList.get(i).setAns5(6);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("5")) {
							sList.get(i).setAns5(3);
						}else if(sList.get(i).getRepliedFile().substring(33, 34).equals("6")) {
							sList.get(i).setAns5(4);
						}
					}
					
				}
						
			}
			// 입력
			sList.get(i).setNo(i+1);
			int insRes = surveyDao.insertResult(sList.get(i));
			if(insRes == 1) {
				System.out.println(i+"번째 입력성공!!");
				checkCount++;
			}	
		}
		System.out.println("총 입력성공 카운트 : "+checkCount);
	}*/
	
	public void checkSexAgeServ() {
		List<Xroshot> sList = surveyDao.selectManCount();
		
		int man = 0;
		int woman = 0;
		int age1=0; //10
		int age2=0; //20
		int age3=0; //30
		int age4=0; //40
		int age5=0; //50
		int age6=0; //60
		int loc1 = 0, loc2=0, loc3=0,loc4=0,loc5=0,loc6=0,loc7=0,loc8=0,loc9=0;
		/*System.out.println("원형 : "+sList.get(0));
		System.out.println("성별값 확인 : "+sList.get(0).substring(9, 10));
		System.out.println("나이값 확인 : "+sList.get(0).substring(15, 16));*/
		
		int ansCnt1_1=0,ansCnt1_2=0,ansCnt1_3=0,ansCnt1_4=0,ansCnt1_5=0,ansCnt1_6=0,ansCnt1_7=0,ansCnt1_8=0; //가선거구
		int ansCnt2_1=0,ansCnt2_2=0,ansCnt2_3=0,ansCnt2_4=0,ansCnt2_5=0,ansCnt2_6=0,ansCnt2_7=0,ansCnt2_8=0; //나선거구
		int ansCnt3_1=0,ansCnt3_2=0,ansCnt3_3=0,ansCnt3_4=0,ansCnt3_5=0,ansCnt3_6=0,ansCnt3_7=0,ansCnt3_8=0; //다선거수
		int ansCnt4_1=0,ansCnt4_2=0,ansCnt4_3=0,ansCnt4_4=0,ansCnt4_5=0,ansCnt4_6=0,ansCnt4_7=0,ansCnt4_8=0; //라
		int ansCnt5_1=0,ansCnt5_2=0,ansCnt5_3=0,ansCnt5_4=0,ansCnt5_5=0,ansCnt5_6=0,ansCnt5_7=0,ansCnt5_8=0; //마
		int ansCnt6_1=0,ansCnt6_2=0,ansCnt6_3=0,ansCnt6_4=0,ansCnt6_5=0,ansCnt6_6=0,ansCnt6_7=0,ansCnt6_8=0; //바
		int ansCnt7_1=0,ansCnt7_2=0,ansCnt7_3=0,ansCnt7_4=0,ansCnt7_5=0,ansCnt7_6=0,ansCnt7_7=0,ansCnt7_8=0; //사
		int ansCnt8_1=0,ansCnt8_2=0,ansCnt8_3=0,ansCnt8_4=0,ansCnt8_5=0,ansCnt8_6=0,ansCnt8_7=0,ansCnt8_8=0; //아
		
		for(int i=0; i<sList.size(); i++) {
			//성별
			if(sList.get(i).getRepliedFile().substring(8, 9).equals("1")) {
				System.out.println("남성+1!!");
				man++;
			}else if(sList.get(i).getRepliedFile().substring(8, 9).equals("2")){
				System.out.println("여성+1!!");
				woman++;
			}
			//나이
			if(sList.get(i).getRepliedFile().substring(14, 15).equals("1")) {
				System.out.println("18이하");
				age1++;
			}else if(sList.get(i).getRepliedFile().substring(14, 15).equals("2")) {
				System.out.println("20대");
				age2++;
			}else if(sList.get(i).getRepliedFile().substring(14, 15).equals("3")) {
				System.out.println("30대");
				age3++;
			}else if(sList.get(i).getRepliedFile().substring(14, 15).equals("4")) {
				System.out.println("40대");
				age4++;
			}else if(sList.get(i).getRepliedFile().substring(14, 15).equals("5")) {
				System.out.println("50대");
				age5++;
			}else if(sList.get(i).getRepliedFile().substring(14, 15).equals("6")) {
				System.out.println("60대!");
				age6++;
			}
			
			//지역
			int id = sList.get(i).getMsgId();
			
			//1형
			/*if(id >= 20498 && id <=20565 || id >= 21267 && id <=21327 || id >= 21475 && id <=21785 || id >= 22212 && id <=22443 ||id >= 22589 && id <=22838 ||id >= 22903 && id <=23029 || id >=23003) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					System.out.println("가선거구");
					loc1++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					System.out.println("나선거구");
					loc2++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					System.out.println("다선거구");
					loc3++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					System.out.println("라선거구");
					loc4++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					System.out.println("마선거구");
					loc5++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					System.out.println("바선거구");
					loc6++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					System.out.println("사선거구");
					loc7++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					System.out.println("아선거구");
					loc8++;
				}
			//2형
			}else if(id >= 20566 && id <=20802 || id >= 21328 && id <=21474 || id >= 22444 && id <=22588 ||id >= 22839 && id <=22902) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					loc3++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					loc4++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					loc5++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					loc6++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					loc7++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					loc8++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					loc1++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					loc2++;
				}
			//3형
			}else if(id >= 20803 && id <=21034 || id >= 21786 && id <=22073) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					loc5++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					loc6++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					loc7++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					loc8++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					loc1++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					loc2++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					loc3++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					loc4++;
				}
			//4형
			}else if(id >= 21035 && id <=21266 || id >= 22074 && id <=22211) {
				if(sList.get(i).getRepliedFile().substring(21, 22).equals("1")) {
					loc7++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("2")) {
					loc8++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("3")) {
					loc1++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("4")) {
					loc2++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("5")) {
					loc3++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("6")) {
					loc4++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("7")) {
					loc5++;
				}else if(sList.get(i).getRepliedFile().substring(21, 22).equals("8")) {
					loc6++;
				}	
			}*/
			
		}
		
		int[] len = {9,15,21,27,33,39};
		List<Integer> resList = new ArrayList<Integer>();
		for(int i=0; i<len.length;i++) {
			int resCnt = surveyDao.selectAgeCount(len[i]); 
			resList.add(resCnt);
		}
		
		//문항별 연령별 확인로직
		/*List<String> rList = surveyDao.selectResForAgeCheck();
		int age18=0, age20=0, age30=0, age40=0, age50=0, age60=0;
		int age20_1=0,age20_2=0,age20_3=0,age20_4=0,age20_5=0,age20_6=0,age20_7=0,age20_8=0,age20_9=0; 
		int age30_1=0,age30_2=0,age30_3=0,age30_4=0,age30_5=0,age30_6=0,age30_7=0,age30_8=0,age30_9=0;
		
		for(int i=0;i<rList.size(); i++) {
			System.out.println(i+" 번째 원형 응답 : "+ rList.get(i));
			System.out.println(i+" 번째 원형 길이 : "+ rList.get(i).length());
			
			if(rList.get(i).length() >= 17) {
				if(rList.get(i).length() == 17) {
					if(rList.get(i).substring(rList.get(i).length()-1, rList.get(i).length()).equals("2")) {
						age20++;
					}else if(rList.get(i).substring(rList.get(i).length()-1, rList.get(i).length()).equals("3")) {
						age30++;
					}
				}else {
					if(rList.get(i).substring(15, 16).equals("2")) {
						age20++;
						System.out.println("20대++");
					}else if(rList.get(i).substring(15, 16).equals("3")) {
						age30++;
					}
					if(rList.get(i).length() >= 23) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_1++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_1++;
						}
					}
					if(rList.get(i).length() >= 29) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_2++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_2++;
						}
					}
					if(rList.get(i).length() >= 35) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_3++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_3++;
						}
					}
					if(rList.get(i).length() >= 41) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_4++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_4++;
						}
					}
					if(rList.get(i).length() >= 47) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_5++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_5++;
						}
					}
					if(rList.get(i).length() >= 53) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_6++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_6++;
						}
					}
					if(rList.get(i).length() >= 59) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_7++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_7++;
						}
					}
					if(rList.get(i).length() >= 66) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_8++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_8++;
						}
					}
					if(rList.get(i).length() >= 73) {
						if(rList.get(i).substring(15, 16).equals("2")) {
							age20_9++;
							System.out.println("20대++");
						}else if(rList.get(i).substring(15, 16).equals("3")) {
							age30_9++;
						}
					}
				}
				
			}
		}*/
		
		System.out.println("***********************************");
		System.out.println("남성 : "+man+" ,여성 : "+woman);
		System.out.println("====연령============================");
		System.out.println("18세이하 : "+age1+ " 20대 : "+age2);
		System.out.println("30대 : "+age3+" 40대 : "+age4);
		System.out.println("50대 : "+age5+" 60대 : "+age6);
		System.out.println("====선거구===========================");
		/*System.out.println("가선거구 : "+loc1+" 나선거구 : "+loc2);
		System.out.println("다선거구 : "+loc3+" 라선거구 : "+loc4);
		System.out.println("마선거구 : "+loc5+" 바선거구 : "+loc6);
		System.out.println("사선거구 : "+loc7+" 아선거구 : "+loc8);*/
		System.out.println("====문항별응답자 총합====================");
		System.out.println(resList);
		/*System.out.println("====문항별20.30대응답자 총합====================");
		System.out.println("20대 : 2번 : "+age20+" 3번 : "+age20_1+" 4번 : "+age20_2+" 5번 : "+age20_3+" 6번 : "+age20_4+" 7번 : "+age20_5+ " 8번  : "+age20_6 + " 9번  : "+age20_7+" 10번  : "+age20_8+" 11번 : "+age20_9);
		System.out.println("30대 : 2번 : "+age30+" 3번 : "+age30_1+" 4번 : "+age30_2+" 5번 : "+age30_3+" 6번 : "+age30_4+" 7번 : "+age30_5+ " 8번  : "+age30_6 + " 9번  : "+age30_7+" 10번  : "+age30_8+" 11번 : "+age30_9);*/
		System.out.println("***********************************");
	}
	
	public void setTargerArs2() {
		List<String> list = surveyDao.selectTels();
		
		String tel=null;
		int success = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			System.out.println("원형 확인 : "+list.get(i));
			tel = "063"+list.get(i);
			
			System.out.println(i+ " 번째 전화번호 확인 : "+tel);
			Sampling sampling = new Sampling();
			sampling.setArsNum(207);
			sampling.setSido("전북");
			sampling.setSigungu("익산시");
			sampling.setTel(tel);			
			
			int result = surveyDao.insertArsResultTb2(sampling);
			if(result > 0) {
				System.out.println(i+ "번째 입력성공!!");
				success++;
			}else if(result == 0) {
				System.out.println(i+ "번째 입력실패!!");
				fail++;
			}
		}
		System.out.println("성공 : "+success+" , fail : "+fail);
		
	}
	
	public void setTargerArs3() {
		List<Xroshot> list = surveyDao.selectLast();
		
		String tel=null;
		int success = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			/*System.out.println("원형 확인 : "+list.get(i));
			tel = "063"+list.get(i);*/
			
			System.out.println(i+ " 번째 전화번호 확인 : "+list.get(i).getPhoneNumber());
			Sampling sampling = new Sampling();
			sampling.setArsNum(207);
			sampling.setSido("전북");
			sampling.setSigungu("익산시");
			sampling.setTel(list.get(i).getPhoneNumber());			
			
			int result = surveyDao.insertArsResultTb2(sampling);
			if(result > 0) {
				System.out.println(i+ "번째 입력성공!!");
				success++;
			}else if(result == 0) {
				System.out.println(i+ "번째 입력실패!!");
				fail++;
			}
		}
		System.out.println("성공 : "+success+" , fail : "+fail);
		
	}
	public void removeRepeatServ() {
		int count =0;
		List<Xroshot> list = surveyDao.selectAllResArs();
		for(int i=0; i<list.size(); i++) {
			List<Integer> chkList = surveyDao.selectArsResultKis(list.get(i).getPhoneNumber());
			if(chkList != null) {
				for(int j=0; j<chkList.size(); j++) {
					System.out.println(j+" 번째 값 : "+chkList.get(j));
					int result = surveyDao.updateArsResult(list.get(i));
					
					if(result > 0) {
						count++;
						System.out.println(count+" 개째 수정중!!");
					}
				}
			}
			/*if(chkList.size() > 1) {
				int result = surveyDao.deleteRepeat(chkList.get(0));
				
				if(result > 0) {
					count++;
					System.out.println(count+" 개째 삭제중!!");
				}
			}*/
		}
		System.out.println("총 "+count+ " 개 수정완료!");
	}
	
	public void reCheck() {
		List<Result> list = surveyDao.selectResultTb(206);
		
		int reCount = 0;
		for(int i=0;i<list.size(); i++) {
			int check = surveyDao.selectCntTel(list.get(i).getTel());
			
			if(check > 0) {
				System.out.println(i+" 번째 중복있음!!");
				surveyDao.deleteRepeat(list.get(i).getNum());
				reCount++;
			}
		}
		System.out.println("TOTAL RE-COUNT : "+reCount);
	}
	
	public void lastInsert() {
		List<Xroshot> list = surveyDao.selectLast();
		
		int success = 0;
		int fail = 0;
		for(int i=0; i< list.size(); i++) {
			Sampling sampling = new Sampling();
			sampling.setArsNum(207);
			sampling.setSido("전북");
			sampling.setSigungu("익산시");
			sampling.setTel(list.get(i).getPhoneNumber());
			
			int result = surveyDao.insertArsResultTb2(sampling);
			if(result > 0) {
				System.out.println(i+ "번째 입력성공!!");
				success++;
			}else if(result == 0) {
				System.out.println(i+ "번째 입력실패!!");
				fail++;
			}
			
			/*List<Integer> nList = surveyDao.selectArsResultKis(list.get(i).getPhoneNumber());*/
			/*System.out.println(i+"번째 사이즈"+nList.size());
			if(nList.size() > 1) error++;*/
			
		}
		System.out.println("최종 success 카운트 : "+success);
		System.out.println("최종 fail 카운트 : "+fail);
	}
	
	//결번삭제(익산)
	public void removeOverlap() {
		int result = surveyDao.deleteOverlap();
		
		System.out.println("****결번 데이터 삭제******************");
		System.out.println("삭제 카운트 : "+result);
		System.out.println("*********************************");
	}
	
	//ARS응답결과
	public void ArsStat() {
		int total = 0; //총 조사대상자
		int noCall = 0; //전화받지않음
		int retired = 0; //결번
		int wrongNumber = 0; //잘못된번			
	}
	
	//데이터 넣기
	public void addHome35() {
		List<User> list = surveyDao.selectDataUser();
		
		int count=0;
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getTel() != null && list.get(i).getTel() != "") {
				
			}
			if(list.get(i).getTel().length() == 7) list.get(i).setTel("063"+list.get(i).getTel());
			else if(list.get(i).getTel().substring(0,1).equals("7")) list.get(i).setTel("0"+list.get(i).getTel());
			
			int overlapCnt = surveyDao.selectOverlapHome35(list.get(i).getTel());
			if(overlapCnt == 0) {
				int result = surveyDao.insertHome35(list.get(i));
				/*int result = surveyDao.insertHome35(list.get(i));*/
				
				if(result == 1) {
					System.out.println(i+" 번째 입력성공");
					count++;
				}
			}
			
		}
		System.out.println("최종입력 카운트 : "+count);
	}
	
	// 전북대 데이터 추출 및 홈디비에 넣기
	public void addHome35FromJbuniv() {
		String[] localList = {"전주시","완주군","진안군","무주군","장수군","남원시","임실군","순창군","정읍시","고창군","부안군","김제시","군산시"};
		List<Integer> succList = new ArrayList<Integer>();
		for(int j=0; j<localList.length; j++) {
			List<User> list = surveyDao.selectJbuniv(localList[j]);
			
			int count = 0;
			for(int i=0; i<list.size(); i++) {
				list.get(i).setTel(list.get(i).getTel().replaceAll("-", ""));
				System.out.println(i+" 번째 데이터 확인 : "+list.get(i).getTel());
				
				list.get(i).setSido("전북");
				list.get(i).setSigungu(localList[j]);
				
				int overlapCnt = surveyDao.selectOverlapHome35(list.get(i).getTel());
				if(overlapCnt == 0) {
					int result = surveyDao.insertHome35(list.get(i));
					
					if(result == 1) {
						System.out.println(i+" 번째 입력성공");
						count++;
					}
				}				
			}
			succList.add(count);
		}
		System.out.println("***************************************");
		System.out.println("순서 : "+localList);
		System.out.println("성공목록 확인 : "+succList);
		
	}
	
	//생진원 - 입력
	public int addBioResServ(BioUser bioUser, BioResponse bioResponse) {
		int result = surveyDao.insertBioUser(bioUser);
		int resResult = 0;
		if(result == 1) {
			bioResponse.setUserNo(bioUser.getNo());
			resResult = surveyDao.insertBioRes(bioResponse);
		}
		
		return resResult;
	}
	
	//생진청 - 응답수조회
	public int readBioResCount() {
		return surveyDao.selectBioResCount();
	}
	
	
	//RDD - 14개 시군중 1개지역 세팅
	public Map<String, Object> setSampleRddServ(String local) {
		Dialing dialing = new Dialing();
		dialing.setLocal(local);
		List<Dialing> dialList = surveyDao.selectDialing(dialing);
	
		String tel = "063";
		
		surveyDao.deleteArsResult();//기존표본삭제
		int successCount = 0;
		int failCount = 0;
		for(int i=0; i<dialList.size(); i++) {
			for(int j=0; j<9999; j++) {
				if(j < 9) {
					tel += dialList.get(i).getDialing()+"000"+String.valueOf(j+1);
					System.out.println("************************");
					System.out.println("10번 미만 전화번호 확인 : "+tel);
					
				}else if(j >= 9 && j < 99) {
					tel += dialList.get(i).getDialing()+"00"+String.valueOf(j+1);
					System.out.println("************************");
					System.out.println("100번 미만 전화번호 확인 : "+tel);
					
				}else if(j >= 99 && j < 999) {
					tel += dialList.get(i).getDialing()+"0"+String.valueOf(j+1);
					System.out.println("************************");
					System.out.println("1000번 미만 전화번호 확인 : "+tel);
					
				}else if(j >= 999) {
					tel += dialList.get(i).getDialing()+String.valueOf(j+1);
					System.out.println("************************");
					System.out.println("10000번 미만 전화번호 확인 : "+tel);
					
				}
				//입력할 샘플링 객체 생성
				Sampling sampling = new Sampling();
				sampling.setSido("전북");
				sampling.setSigungu(local);
				sampling.setTel(tel);
				sampling.setArsNum(213);
				
				//DB인서트
				int result = surveyDao.insertArsResultTb2(sampling);
				if(result == 1) {
					System.out.println(dialList.get(i).getDialing()+ "국번의 "+(j+1)+ " 번 데이터 입력 성공~!!");
					successCount++;
				}else if(result == 0) {
					System.out.println(dialList.get(i).getDialing()+ "국번의 "+(j+1)+ " 번 데이터 입력 실패~!!");
					failCount++;
				}
				//초기화
				tel = "063";
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dialSucc", successCount);
		map.put("dialFail", failCount);
		
		//기관번호 삭제로직 추가
		Map<String,Object> resMap = addLocalNumServ(local);
		map.put("excSucc", resMap.get("excSucc"));
		map.put("excFail", resMap.get("excFail"));
		
		System.out.println("총 입력성공 : "+successCount+" 건");
		System.out.println("총 입력실패 : "+failCount+" 건");
		System.out.println("총 삭제성공 : "+map.get("excSucc")+" 건");
		System.out.println("총 삭제실패 : "+map.get("excFail")+" 건");
		
		return map;
	}
	
	//063추가 및 삭제
	public Map<String, Object> addLocalNumServ(String local) {
		ExceptionTel excTel = new ExceptionTel();
		excTel.setLocal(local);
		List<ExceptionTel> list = surveyDao.selectExcTel(excTel);
		
		int successCount = 0;
		int failCount = 0;
		for(int i=0; i<list.size(); i++) {
			list.get(i).setTel("063"+list.get(i).getTel());
			System.out.println("************************");
			System.out.println((i+1)+" 번째 전화번호 확인 : "+list.get(i).getTel());
			int result = surveyDao.deleteExcTel(list.get(i).getTel());
			
			if(result == 1) {
				System.out.println((i+1)+" 번째 전화번호 삭제성공~!!");
				successCount++;
			}else {
				System.out.println((i+1)+" 번째 전화번호 삭제실패~!!");
				failCount++;
			}
		}
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("excSucc", successCount);
		map.put("excFail", failCount);
		
		return map; 
	}
	
	//RDD - 14개 시군중 1개지역 세팅
	public Map<String, Object> setSampleRdd2Serv() {
		String[] localList = {"전주시","익산시","군산시","정읍시","김제시","부안군","남원시","완주군","무주군","고창군","진안군","장수군","임실군","순창군"};
		int successCount = 0;
		int failCount = 0;
		String local = "";
		List<Integer> succList = new ArrayList<Integer>();
		List<Integer> failList = new ArrayList<Integer>();
		
		for(int k=0; k<localList.length; k++) {
			Dialing dialing = new Dialing();
			dialing.setLocal(localList[k]);
			List<Dialing> dialList = surveyDao.selectDialing(dialing);
		
			String tel = "063";
			
			//surveyDao.deleteArsResult();//기존표본삭제
			
			for(int i=0; i<dialList.size(); i++) {
				for(int j=0; j<9999; j++) {
					if(j < 9) {
						tel += dialList.get(i).getDialing()+"000"+String.valueOf(j+1);
						System.out.println("************************");
						System.out.println("10번 미만 전화번호 확인 : "+tel);
						
					}else if(j >= 9 && j < 99) {
						tel += dialList.get(i).getDialing()+"00"+String.valueOf(j+1);
						System.out.println("************************");
						System.out.println("100번 미만 전화번호 확인 : "+tel);
						
					}else if(j >= 99 && j < 999) {
						tel += dialList.get(i).getDialing()+"0"+String.valueOf(j+1);
						System.out.println("************************");
						System.out.println("1000번 미만 전화번호 확인 : "+tel);
						
					}else if(j >= 999) {
						tel += dialList.get(i).getDialing()+String.valueOf(j+1);
						System.out.println("************************");
						System.out.println("10000번 미만 전화번호 확인 : "+tel);
						
					}
					//입력할 샘플링 객체 생성
					Sampling sampling = new Sampling();
					sampling.setSido("전북");
					sampling.setSigungu(localList[k]);
					sampling.setTel(tel);
					sampling.setLocal(changeLocalToEng(localList[k]));
					sampling.setNum((i*10000)+(j+1));
					//sampling.setArsNum(213);
					
					//DB인서트
					int result = surveyDao.insertArsResultTb3(sampling);
					if(result == 1) {
						System.out.println(dialList.get(i).getDialing()+ "국번의 "+(j+1)+ " 번 데이터 입력 성공~!!");
						successCount++;
					}else if(result == 0) {
						System.out.println(dialList.get(i).getDialing()+ "국번의 "+(j+1)+ " 번 데이터 입력 실패~!!");
						failCount++;
					}
					//초기화
					tel = "063";
				}
			}
			succList.add(successCount);
			failList.add(failCount);
			successCount=0;
			failCount=0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		/*map.put("dialSucc", successCount);
		map.put("dialFail", failCount);*/
		
		//기관번호 삭제로직 추가
		/*Map<String,Object> resMap = addLocalNumServ(local);
		map.put("excSucc", resMap.get("excSucc"));
		map.put("excFail", resMap.get("excFail"));*/
		
		System.out.println("========================================================");
		for(int i=0; i<localList.length;i++) {
			System.out.println(localList[i]+" 지역 입력성공 : "+succList.get(i)+" 건");
			System.out.println(localList[i]+" 지역 입력실패 : "+failList.get(i)+" 건");
			System.out.println("========================================================");
		}
		/*System.out.println("총 입력성공 : "+successCount+" 건");
		System.out.println("총 입력실패 : "+failCount+" 건");
		System.out.println("총 삭제성공 : "+map.get("excSucc")+" 건");
		System.out.println("총 삭제실패 : "+map.get("excFail")+" 건");*/
		
		return map;
	}
	
	//사업체번호 구분
	public void isCompany() {
		List<Xroshot> list = surveyDao.selectResJj();
		System.out.println("조회결과 : "+list);
		
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			list.get(i).setNo(i+1);
			
			int count = surveyDao.selectDateForCompare(list.get(i).getPhoneNumber());
			
			if(count == 0) {
				list.get(i).setIsCompany("가정집");
			}else {
				list.get(i).setIsCompany("사업체");
			}
			
			int result = surveyDao.insertResJj(list.get(i));
			
			if(result == 0) {
				System.out.println(i+" 번째 입력 실패~!!");
				succ++;
			}
			else if(result == 1) {
				System.out.println(i+" 번째 입력 성공~!!");
				fail++;
			}
		}
		System.out.println("성공 : "+succ);
		System.out.println("실패 : "+fail);
		
	}
	
	// 지역명 영어로(DB테이블명 때문에 변경)
	public String changeLocalToEng(String local) {
		if(local.equals("전주시")) local = "JEONJU";
		else if(local.equals("익산시")) local = "IKSAN";
		else if(local.equals("군산시")) local = "KUNSAN";
		else if(local.equals("정읍시")) local = "JEONGUB";
		else if(local.equals("김제시")) local = "KIMJE";
		else if(local.equals("남원시")) local = "NAMWON";
		else if(local.equals("완주군")) local = "WANJU";
		else if(local.equals("무주군")) local = "MUJU";
		else if(local.equals("진안군")) local = "JINAN";
		else if(local.equals("장수군")) local = "JANGSU";
		else if(local.equals("순창군")) local = "SUNCHANG";
		else if(local.equals("고창군")) local = "KOCHANG";
		else if(local.equals("부안군")) local = "BUAN";
		
		return local;
	}
	
	//전주시장 로테이션 2형 1형값으로 정리
	public void changLotationTwoToOne() {
		List<Xroshot> list = surveyDao.selectResJj();
		
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			list.get(i).setNo(i+1);
			
			/*int count = surveyDao.selectDateForCompare(list.get(i).getPhoneNumber());
			
			if(count == 0) {
				list.get(i).setIsCompany("가정집");
			}else {
				list.get(i).setIsCompany("사업체");
			}*/
			
			if(list.get(i).getMsgId() >= 41255 && list.get(i).getMsgId() <= 41374) { //2 > 1형
				if(list.get(i).getAns5() == 1) {
					list.get(i).setAns5(5);
				}else if(list.get(i).getAns5() == 2) {
					list.get(i).setAns5(6);
				}else if(list.get(i).getAns5() == 3) {
					list.get(i).setAns5(1);
				}else if(list.get(i).getAns5() == 4) {
					list.get(i).setAns5(2);
				}else if(list.get(i).getAns5() == 5) {
					list.get(i).setAns5(3);
				}else if(list.get(i).getAns5() == 6) {
					list.get(i).setAns5(4);
				}
			}else if(list.get(i).getMsgId() >= 41376 && list.get(i).getMsgId() <= 41495) { // 3형 > 1
				if(list.get(i).getAns5() == 1) {
					list.get(i).setAns5(3);
				}else if(list.get(i).getAns5() == 2) {
					list.get(i).setAns5(4);
				}else if(list.get(i).getAns5() == 3) {
					list.get(i).setAns5(5);
				}else if(list.get(i).getAns5() == 4) {
					list.get(i).setAns5(6);
				}else if(list.get(i).getAns5() == 5) {
					list.get(i).setAns5(1);
				}else if(list.get(i).getAns5() == 6) {
					list.get(i).setAns5(2);
				}
			}else if(list.get(i).getMsgId() >= 41676 && list.get(i).getMsgId() <= 41855) { //2 > 1
				if(list.get(i).getAns5() == 1) {
					list.get(i).setAns5(5);
				}else if(list.get(i).getAns5() == 2) {
					list.get(i).setAns5(6);
				}else if(list.get(i).getAns5() == 3) {
					list.get(i).setAns5(1);
				}else if(list.get(i).getAns5() == 4) {
					list.get(i).setAns5(2);
				}else if(list.get(i).getAns5() == 5) {
					list.get(i).setAns5(3);
				}else if(list.get(i).getAns5() == 6) {
					list.get(i).setAns5(4);
				}
			}else if(list.get(i).getMsgId() >= 41856 && list.get(i).getMsgId() <= 42035) { //3 > 1
				if(list.get(i).getAns5() == 1) {
					list.get(i).setAns5(3);
				}else if(list.get(i).getAns5() == 2) {
					list.get(i).setAns5(4);
				}else if(list.get(i).getAns5() == 3) {
					list.get(i).setAns5(5);
				}else if(list.get(i).getAns5() == 4) {
					list.get(i).setAns5(6);
				}else if(list.get(i).getAns5() == 5) {
					list.get(i).setAns5(1);
				}else if(list.get(i).getAns5() == 6) {
					list.get(i).setAns5(2);
				}
			}
			
			int result = surveyDao.insertResJj(list.get(i));
			
			if(result == 1) {
				System.out.println(i+" 번째 입력 성공~!!");
				succ++;
			}
			else if(result == 0) {
				System.out.println(i+" 번째 입력 실패~!!");
				fail++;
			}
		}
		System.out.println("성공 : "+succ);
		System.out.println("실패 : "+fail);
	}
	
	//정읍시장 로테이션 정리
	/*public void changLotationTwoToOne2() {
		List<Xroshot> list = surveyDao.selectResJj();
		
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			list.get(i).setNo(i+1);			
			
			if(list.get(i).getMsgId() >= 32433 && list.get(i).getMsgId() <= 32672) { //2형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("6");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("1");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("2");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("3");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("4");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("5");
				}
			}else if(list.get(i).getMsgId() >= 32673 && list.get(i).getMsgId() <= 32912) { // 3형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("4");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("5");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("6");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("1");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("2");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("3");
				}
			}else if(list.get(i).getMsgId() >= 32913 && list.get(i).getMsgId() <= 33152) { //4형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("2");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("3");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("4");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("5");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("6");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("1");
				}
			}else if(list.get(i).getMsgId() >= 33153 && list.get(i).getMsgId() <= 33392) { //5형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("1");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("2");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("3");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("4");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("5");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("6");
				}
			}else if(list.get(i).getMsgId() >= 33393 && list.get(i).getMsgId() <= 33632) { //6형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("5");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("6");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("1");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("2");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("3");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("4");
				}
			}else if(list.get(i).getMsgId() >= 33633) { //7형
				if(list.get(i).getAns5().equals("1")) {
					list.get(i).setAns5("3");
				}else if(list.get(i).getAns5().equals("2")) {
					list.get(i).setAns5("4");
				}else if(list.get(i).getAns5().equals("3")) {
					list.get(i).setAns5("5");
				}else if(list.get(i).getAns5().equals("4")) {
					list.get(i).setAns5("6");
				}else if(list.get(i).getAns5().equals("5")) {
					list.get(i).setAns5("7");
				}else if(list.get(i).getAns5().equals("6")) {
					list.get(i).setAns5("1");
				}else if(list.get(i).getAns5().equals("7")) {
					list.get(i).setAns5("2");
				}
			}
			
			int result = surveyDao.insertResJj(list.get(i));
			
			if(result == 1) {
				System.out.println(i+" 번째 입력 성공~!!");
				succ++;
			}
			else if(result == 0) {
				System.out.println(i+" 번째 입력 실패~!!");
				fail++;
			}
		}
		System.out.println("성공 : "+succ);
		System.out.println("실패 : "+fail);
	}*/
	
	//신보
	public List<SbResult> readSinboResInfoServ(){
		String startDate = "";
		String endDate = "";
		UtilDate utilDate = new UtilDate();
		String nowDate = utilDate.getNowDate(); //mm-dd
		String nowMonth = nowDate.substring(0, 2);
		int loop = Integer.parseInt(nowMonth)-3;
		List<SbResult> list = new ArrayList<SbResult>();
		
		for(int i=0; i<loop; i++) {
			Map<String, Object> params = new HashMap<String, Object>();
			if(i==0){
				startDate = "2018-04-01";
				endDate = "2018-05-02";
			}else if(i == 1){
				startDate = "2018-05-03";
				endDate = "2018-06-02";
			}else if(i == 2){
				startDate = "2018-06-04";
				endDate = "2018-07-02";
			}			
			params.put("startDate", startDate);
			params.put("endDate", endDate);
			
			SbResult sbResult = new SbResult();
			sbResult.setTotalCnt(surveyDao.selSinboTotalCnt(params)); //전제 조사 대상자수
			sbResult.setResCnt(surveyDao.selSinboResCnt(params)); //응답자수
			sbResult.setBujeCnt(surveyDao.selSinboBujeCnt(params)); //부재
			sbResult.setAfterCnt(surveyDao.selSinboAfterCnt(params)); //추후응답
			sbResult.setRejectCnt(surveyDao.selSinboRejectCnt(params)); //응답거부
			sbResult.setMmsCnt(surveyDao.selSinboMmsCnt(params)); //문자1,2차
			System.out.println(i+" 번째 목록 확인 : "+sbResult);
			list.add(sbResult);
		}
		
		return list;
	}
	
	//신보 - 응답현황표
	public List<ResData> readSinboResDataServ(String startDate, String endDate, String type){
		//파라미터 세팅
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		List<ResData> list = surveyDao.selSinboResList(params); //기간내 응답현황 목록조회
		
		if(type.equals("after")) {
			UtilDate utilDate = new UtilDate();
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getSbRrn() != null) { // 성별, 연령 세팅
					String sexCheck = list.get(i).getSbRrn().substring(7, 8);
					String ageCheck = list.get(i).getSbRrn().substring(0, 2);
					
					//성별
					if(sexCheck.equals("1") || sexCheck.equals("3") || sexCheck.equals("5")) { //남
						list.get(i).setSbSex("1");
					}else if(sexCheck.equals("2") || sexCheck.equals("4") || sexCheck.equals("6")){ //여
						list.get(i).setSbSex("2");
					}
					
					//촐생년도 계산
					if(Integer.parseInt(ageCheck) > 30 && Integer.parseInt(ageCheck) < 99) {
						ageCheck = "19"+ageCheck;
					}else if(Integer.parseInt(ageCheck) < 25) {
						ageCheck = "20"+ageCheck;
					}
					
					//연령
					int ageChk = 2018-Integer.parseInt(ageCheck);
					if(ageChk < 20) { //10대
						list.get(i).setSbAge("1");
					}else if(ageChk > 19 && ageChk < 30) { //20대
						list.get(i).setSbAge("2");
					}else if(ageChk > 29 && ageChk < 40) { //30대
						list.get(i).setSbAge("3");
					}else if(ageChk > 39 && ageChk < 50) { //40대
						list.get(i).setSbAge("4");
					}else if(ageChk > 49 && ageChk < 60) { //50대
						list.get(i).setSbAge("5");
					}else if(ageChk > 59) { //60대
						list.get(i).setSbAge("6");
					}				
				} //성별,연령 끝
				
				//지역
				if(list.get(i).getSbAdd() != null) {
					String local = list.get(i).getSbAdd();
					System.out.println(i+ " 번째 로컬 확인 : "+local);
					
					if(local.contains("전주")) list.get(i).setSbLocal("1");
					else if(local.contains("군산")) list.get(i).setSbLocal("2");
					else if(local.contains("익산")) list.get(i).setSbLocal("3");
					else if(local.contains("정읍")||local.contains("고창")) list.get(i).setSbLocal("4");
					else if(local.contains("김제")||local.contains("부안")) list.get(i).setSbLocal("5");
					else if(local.contains("남원")||local.contains("임실")||local.contains("순창")) list.get(i).setSbLocal("6");
					else if(local.contains("완주")||local.contains("진안")||local.contains("무주")||local.contains("장수")) list.get(i).setSbLocal("7");
				}
				
				//업종
				if(list.get(i).getSbUpStream() != null) {
					String biz = list.get(i).getSbUpStream();
					System.out.println(i+ " 번째 업종 확인 : "+biz);
					
					if(biz.contains("도매")||biz.contains("소매")) {
						System.out.println(i+ " 번째 업종 도소매 ");
						list.get(i).setSbBusiness("1");
					}else if(biz.contains("숙박")||biz.contains("음식점")) {
						System.out.println(i+ " 번째 업종 숙박음식점 ");
						list.get(i).setSbBusiness("2");
					}else if(biz.contains("건설")||biz.contains("제조")) {
						System.out.println(i+ " 번째 업종 건설제조 ");
						list.get(i).setSbBusiness("3");
					}else if(biz.contains("서비스")) {
						System.out.println(i+ " 번째 업종 서비스 ");
						list.get(i).setSbBusiness("4");
					}else {
						System.out.println(i+ " 번째 업종 기타 ");
						list.get(i).setSbBusiness("5");
					}
				}
				
				//업력
				if(list.get(i).getSbDateOfEst() != null) {
					int year = utilDate.getDiffDay(utilDate.getCurrentDate(), list.get(i).getSbDateOfEst())*(-1);
					System.out.println(i+" 번째 업력 리턴값 확인 : "+ year);
					
					if(year <= 365) { //1년차
						list.get(i).setSbYears("1");
					}else if(year > 365 && year <= 730) { //2년차
						list.get(i).setSbYears("2");
					}else if(year > 720 && year <= 1460) { //3~4년차
						list.get(i).setSbYears("3");
					}else if(year > 1460 && year <= 3650) { //5~10년차
						list.get(i).setSbYears("4");
					}else if(year > 3650) { //11년차
						list.get(i).setSbYears("5");
					}
				}
				
				//지점세팅
				if(list.get(i).getSbBranch() != null) {
					String branch = list.get(i).getSbBranch();
					
					if(branch.equals("본점")) list.get(i).setSbBranch("1");
					else if(branch.equals("군산지점")) list.get(i).setSbBranch("2");
					else if(branch.equals("익산지점")) list.get(i).setSbBranch("3");
					else if(branch.equals("정읍지점")) list.get(i).setSbBranch("4");
					else if(branch.equals("남원지점")) list.get(i).setSbBranch("5");
				}
				
				//조사자세팅
				if(list.get(i).getSbJosaja() != null) {
					String josaja = list.get(i).getSbJosaja();
					
					if(josaja.equals("곽선욱")) list.get(i).setSbJosaja("1");
					else if(josaja.equals("권석표")) list.get(i).setSbJosaja("2");
					else if(josaja.equals("기호형")) list.get(i).setSbJosaja("3");
					else if(josaja.equals("김나현")) list.get(i).setSbJosaja("4");
					else if(josaja.equals("김상길")) list.get(i).setSbJosaja("5");
					else if(josaja.equals("김태헌")) list.get(i).setSbJosaja("6");
					else if(josaja.equals("김항우")) list.get(i).setSbJosaja("7");
					else if(josaja.equals("김혜영")) list.get(i).setSbJosaja("8");
					else if(josaja.equals("문소정")) list.get(i).setSbJosaja("9");
					else if(josaja.equals("박순천")) list.get(i).setSbJosaja("10");
					else if(josaja.equals("박현성")) list.get(i).setSbJosaja("11");
					else if(josaja.equals("변미희정")) list.get(i).setSbJosaja("12");
					else if(josaja.equals("송현")) list.get(i).setSbJosaja("13");
					else if(josaja.equals("유승용")) list.get(i).setSbJosaja("14");
					else if(josaja.equals("이윤정")) list.get(i).setSbJosaja("15");
					else if(josaja.equals("이종백")) list.get(i).setSbJosaja("16");
					else if(josaja.equals("이지원")) list.get(i).setSbJosaja("17");
					else if(josaja.equals("이지현")) list.get(i).setSbJosaja("18");
					else if(josaja.equals("이진영")) list.get(i).setSbJosaja("19");
					else if(josaja.equals("이채명")) list.get(i).setSbJosaja("20");
					else if(josaja.equals("조두만")) list.get(i).setSbJosaja("21");
					else if(josaja.equals("천상민")) list.get(i).setSbJosaja("22");
					else if(josaja.equals("최규수")) list.get(i).setSbJosaja("23");
					else if(josaja.equals("황희망")) list.get(i).setSbJosaja("24");
				}
			}
		}	
		
		return list;
	}
	
	//여론조사 응답현황표
	public Map<String, Object> readResInfoServ(String startDate, String time, String min, int type, String endDate, String endTime, String endMin){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String sendDate = startDate.replaceAll("-", ""); //시간형식세팅 YYYYMMDDHHMMSS
		if(Integer.parseInt(time)<10) time = "0"+time;
		sendDate += time;
		sendDate += min;
		sendDate += "00";
		//System.out.println("입력시간 확인 : "+sendDate);
		
		if(!endDate.equals("none") && !endTime.equals("none")) {
			endDate = endDate.replaceAll("-", "");
			endDate += endTime;
			if(!endMin.equals("none")) {
				endDate += endMin;
			}else {
				endDate += "00";
			}
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sendDate", sendDate);
		params.put("endDate",endDate);
		
		List<Xroshot> list = surveyDao.selectResList(params);
		ArsRes arsRes = new ArsRes();
		if(type == 1) {				
			arsRes.setSendDate(sendDate);
			arsRes.setTotalCnt(surveyDao.selectTotalSend(params));
			
			params.put("result", 6); 
			arsRes.setUnqCnt(surveyDao.selectres2(params));
			
			params.put("result", 3);
			arsRes.setUnqCnt2(surveyDao.selectres2(params));
			
			params.put("result", 4);
			arsRes.setFailCnt(surveyDao.selectres2(params));
			
			params.put("result", 5);
			arsRes.setFailCnt2(surveyDao.selectres2(params));
			
			params.put("result", 2);
			arsRes.setSuccCnt(surveyDao.selectres2(params));
			
			arsRes.setCompleteCnt(list.size());
		}
		
		System.out.println("응답현황 확인 : "+arsRes);
		map.put("arsRes", arsRes);
		map.put("list", list);
		return map;
	}
	
	//응답내용 표본에서 삭제
	public Map<String, Object> removeResListServ(String startDate, String time, String min){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String sendDate = startDate.replaceAll("-", ""); //시간형식세팅 YYYYMMDDHHMMSS
		if(Integer.parseInt(time)<10) time = "0"+time;
		sendDate += time;
		sendDate += min;
		sendDate += "00";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sendDate", sendDate);
		
		params.put("result", 2);
		int res1 = surveyDao.deleteResultKis(params);
		
		params.put("result", 3);
		int res2 = surveyDao.deleteResultKis(params);
		
		params.put("result", 6);
		int res3 = surveyDao.deleteResultKis(params);
		
		map.put("res1", res1);
		map.put("res2", res2);
		map.put("res3", res3);
		
		return map;
	}
	
	//자사 가정집 DB지역정보 수정(전북)
	public void overlapHome35Serv() {
		String sendDate = "20180516090000";
		int localLen = 9;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sendDate", sendDate);
		params.put("localLen", localLen);
		
		List<Xroshot> list = surveyDao.selectLocalByRes(params);
		
		int succ = 0;
		int fail = 0;
		for(int i=0; i<list.size(); i++) {
			Home35 home35 = new Home35();
			home35.settTelno(list.get(i).getPhoneNumber());
			home35.settSiGunGu("고창군");
			if(list.get(i).getAns1() == 1) {
				home35.settDong("고창읍");
			}else if(list.get(i).getAns1() == 2) {
				home35.settDong("신림면");
			}
			home35.settIs(0);
			
			int result = surveyDao.updateHomeDbByRes(home35);
			
			if(result >= 1) {
				System.out.println((i+1)+" 번째 수정성공");
				succ++;
			}else if(result == 0) {
				System.out.println((i+1)+" 번째 수정실패");
				fail++;
			}
		}
		System.out.println("성공 : "+succ);
		System.out.println("실패 : "+fail);
		
	}
	
	//신보 엑셀업로드
	public Map<String, Object> insertSinboExcelServ(File destFile) {
		int succ = 0;
		
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F","G","H","I");
		readOption.setStartRow(2);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		  
		Sinbo sinbo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		//신보 마지막 시퀀스 조회
		int lastSeq = surveyDao.selSinboLastSbNum();
		
		for(Map<String, String> excelRow : excelContent){		  
			sinbo = new Sinbo();
			sinbo.setSbNum(lastSeq+1);
			sinbo.setSbCompany(excelRow.get("A"));
			sinbo.setSbDateOfEst(excelRow.get("B"));
			sinbo.setSbCeo(excelRow.get("C"));
			if(excelRow.get("D") != null) sinbo.setSbRrn(excelRow.get("D"));
			sinbo.setSbAdd(excelRow.get("E"));
			sinbo.setSbBranch(excelRow.get("F"));
			sinbo.setSbJosaja(excelRow.get("G"));
			sinbo.setSbHp(excelRow.get("H"));
			sinbo.setSbUpStream(excelRow.get("I"));
			sinbo.setSbReject(0);
			sinbo.setSbOrderCount("0");
		
			lastSeq++;
			
			int result = surveyDao.insertSinboExcel(sinbo);
			System.out.println("check : "+sinbo);
			
			if(result == 1) {
				System.out.println("엑셀파일 입력 성공~!!");
				succ++;			
			}
		}
		map.put("succ", succ);
		return map;
	}
}
