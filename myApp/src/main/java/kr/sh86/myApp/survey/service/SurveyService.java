package kr.sh86.myApp.survey.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.sh86.myApp.survey.dao.SurveyDao;
import kr.sh86.myApp.survey.domain.Mms;
import kr.sh86.myApp.survey.domain.Response;
import kr.sh86.myApp.survey.domain.Users;

@Service
public class SurveyService {
	
	@Autowired
	private SurveyDao surveyDao;
	
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
		Map<String, Object> map = new HashMap<String, Object>(); 
		int total = surveyDao.selectUserCount(); //총카운트
		int resTotal = surveyDao.selectResCount(); //응답자
		int resAll = surveyDao.selectResAllCount(); //모든답변응답자
		int mmsFail = surveyDao.selectMmsFailCount(); //문자전송 실패자
		List<String> sendList = surveyDao.selectSendReport();
				
		map.put("total", total);
		map.put("resTotal", resTotal);
		map.put("resAll", resAll);
		map.put("mmsFail", mmsFail);
		map.put("sendList", sendList);
		System.out.println(map);
		return map;
	}
}
