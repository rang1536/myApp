package kr.sh86.myApp.bc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.sh86.myApp.bc.dao.BcDao;
import kr.sh86.myApp.bc.domain.BcGroup;
import kr.sh86.myApp.bc.domain.BcReject;
import kr.sh86.myApp.bc.domain.BcUser;
import kr.sh86.myApp.bc.domain.FavorCate;
import kr.sh86.myApp.bc.domain.GroupCate;
import kr.sh86.myApp.bc.domain.InduCode;
import kr.sh86.myApp.bc.domain.Mms;
import kr.sh86.myApp.bc.domain.Target;
import kr.sh86.myApp.bc.domain.UploadFileDTO;
import kr.sh86.myApp.util.UtilFile;

@Service
public class BcService {

	@Autowired
	private BcDao bcDao;
	
	//산업코드 관련
	public void induCodeAddServ() {
		List<InduCode> indList = bcDao.selectInduCodeAll();
		
		int succ = 0;
		int fail = 0;
		
		if(indList.size() != 0) {
			for(int i=0; i<indList.size(); i++) {
				List<Target> targetList = bcDao.selectInduCodeAtInduCode(indList.get(i).getIndBBSmallGroup());
				
				for(int j=0; j<targetList.size(); j++) {
					String col11 = targetList.get(j).getColumn14().substring(0, 5);
					String colCheck1 = targetList.get(j).getColumn14().substring(6, 8);
					String colCheck2 = targetList.get(j).getColumn14().substring(6, 10);
					String col12 = "";
					
					//구군명이 2글자 혹은 4글자일때 해당 구군 명 적기
					if(colCheck1.equals("북구") || colCheck1.equals("서구") || colCheck1.equals("남구") || colCheck1.equals("동구") || colCheck1.equals("중구")) { //구군이 2글자일때
						col12 = colCheck1;
					}else if(colCheck2.equals("부산진구") || colCheck2.equals("해운대구")) { //구군이 4글자일때
						col12 = colCheck2;
					}else { //3글자 손대지 않아도 됨
						col12 = targetList.get(j).getColumn14().substring(6, 9);
					}
					
					targetList.get(j).setColumn5(indList.get(i).getIndLargeGroup());
					targetList.get(j).setColumn6(indList.get(i).getIndMiddleGroup());
					targetList.get(j).setColumn7(indList.get(i).getIndSmallGroup());
					targetList.get(j).setColumn8(indList.get(i).getIndBSmallGroup());
					targetList.get(j).setColumn11(col11);
					targetList.get(j).setColumn12(col12);
					
					int result = bcDao.updateTargetInduCode(targetList.get(j));
					
					if(result == 1) {
						System.out.println(j+ " 번째 데이터 산업코드 입력 성공~!!");
						succ++;
					}else {
						System.out.println(j+ " 번째 데이터 산업코드 입력 실패~!!");
						fail++;
					}
				}
			}
		}
		
		System.out.println("=======================");
		System.out.println("성공 : "+succ);
		System.out.println("실패 : "+fail);
	}
	
	
	//모든 명함조회
	public List<BcUser> readBcAllServ(int poNum, String checkBackNNext){
		Map<String, Object> params = new HashMap<String, Object>();
		if(poNum == 0) {
			poNum = bcDao.selectLastestPk();
			params.put("startNum", (poNum - 100));
			params.put("endNum", poNum);
		}else if(poNum > 0){
			if(checkBackNNext.equals("back")) {
				params.put("startNum", poNum+100);
				params.put("endNum", poNum+200);
			}else if(checkBackNNext.equals("next")) {
				params.put("startNum", poNum-100);
				params.put("endNum", poNum);
			}			
		}
		return bcDao.selectBcAll(params);
	}
	
	//즐겨찾기추가
	public Map<String, Object> modifyBcFavorByPoNumServ(BcUser bcUser){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(bcUser.getPoFavor() == 1) {
			bcUser.setPoFavor(2);
		}else if(bcUser.getPoFavor() == 2) {
			bcUser.setPoFavor(1);
		}
		
		int result = bcDao.updateBcFavorByPoNum(bcUser);
		
		if(result == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	//상세보기
	public BcUser readUserByPoNumServ(int poNum) {
		return bcDao.selectUserByPoNum(poNum);
	}
	
	//명함검색
	public List<BcUser> readUserByPoNameServ(Map<String, String> params){
		return bcDao.selectUserByPoName(params);
	}
	
	//명함삭제
	public Map<String, Object> removeUserByPoNumServ(String checkedData){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] poNumList = checkedData.split(",");
		
		int succ = 0;
		int fail = 0;
		for(int i=0; i<poNumList.length; i++) {
			//System.out.println(i+" 번째 pk값 확인 : "+poNumList[i]);
			int result = bcDao.deleteUserByPoNum(Integer.parseInt(poNumList[i]));
			if(result == 1) succ++;
			else if(result == 0) fail++;
		}
		
		if(succ > 0 && fail == 0) {
			map.put("result", "success");
			map.put("succ", succ);
		}else if(succ > 0 && fail > 0) {
			map.put("result", "half");
			map.put("succ", succ);
			map.put("fail", fail);
		}else if(succ < 1) {
			map.put("result", "fail");
			map.put("fail", fail);
		}
		return map;
	}
	
	//즐겨찾기 카테고리 조회
	public List<FavorCate> readFavorCateAllServ(){
		return bcDao.selectFavorCateAll(); 
	}
	
	//전화번호부 카테고리 조회
	public List<GroupCate> readGroupCateAllServ(){
		return bcDao.selectGroupCateAll(); 
	}
	
	//명함정보에 즐겨찾기 카테고리 등록
	public Map<String, Object> modifyUserFavorCateServ(BcUser bcUser){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = bcDao.updateUserFavorCate(bcUser);
		if(result == 1) map.put("result", "success");
		else if(result == 0)map.put("result", "fail");
		
		return  map;
	}
	
	//검색옵션조회 - 직업, 관계
	public Map<String, Object> readSearchOptionServ(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		//직업조회
		List<String> jobList = bcDao.selectJobCode();
		map.put("jobList", jobList);
		
		//관계조회
		List<String> relationList = bcDao.selectRelation();
		map.put("relationList", relationList);
		
		return  map;
	}
	
	//즐겨찾기 목록 조회
	public List<BcUser> readFavorListByCateServ(int cateNum){
		return bcDao.selectFavorListByCate(cateNum);
	}
	
	//전화번호부 입력
	public Map<String, Object> addPhoneListServ(String checkedName, String checkedHp){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] nameList = checkedName.split(",");
		String[] hpList = checkedHp.split(",");
		
		int succ = 0;
		int fail = 0;
		List<String> overlapList = new ArrayList<String>();
		if(nameList.length == hpList.length) {
			for(int i=0; i<nameList.length; i++) {
				BcUser bcUser = new BcUser();
				bcUser.setPoName(nameList[i]);
				bcUser.setPoTel2(hpList[i].replaceAll("-", ""));
				bcUser.setPoFavor(1);
				
				//중복체크
				int count = bcDao.selectReCheckHp(hpList[i].replaceAll("-", ""));
				
				if(count == 0) { //중복없음
					int result = bcDao.insertPhoneList(bcUser);
					
					if(result == 1) {
						System.out.println("입력 성공");
						succ++;
					}else {
						System.out.println("입력 실패");
						fail++;
					}
				}else if(count > 0){
					System.out.println("중복데이터 있음");
					overlapList.add(nameList[i]);
				}							
			}
		}
		
		map.put("overlapList", overlapList); //중복목록 세팅
		if(succ == (nameList.length-overlapList.size())) {
			map.put("result", "success");
			map.put("succCount", "succ");
		}else {
			map.put("result", "fail");
			map.put("succCount", "succ");
			map.put("failCount", "fail");
		}
		
		return map;
	}
	
	//명함입력
	public Map<String, Object> addBcUserServ(BcUser bcUser){
		Map<String, Object> map = new HashMap<String, Object>();
		
		bcUser.setPoAddr(bcUser.getPoSido()+" "+bcUser.getPoGuGun()+" "+bcUser.getPoSangseAddr()); //주소합침
		bcUser.setPoFavor(1); //좋아요 디폰트값으로 세팅
		bcUser.setPoTel2(bcUser.getPoTel2().replaceAll("-", ""));
		
		//중복체크
		int count = bcDao.selectReCheckHp(bcUser.getPoTel2());
		
		if(count == 0) {
			int result = bcDao.insertPhoneList(bcUser);
			if(result == 1) {
				map.put("result", "succ");
				map.put("poNum", bcUser.getPoNum());
			}else {
				map.put("result", "fail");
			}
		}else {
			map.put("result", "exist");
		}
		
		return map; 
	}
	
	//명함 이미지 등록
	public int modifyBcImgServ(MultipartHttpServletRequest request) {
		UtilFile utilFile = new UtilFile();
		UploadFileDTO fileInfo = utilFile.singleUploadFile(request);
		
		BcUser bcUser = new BcUser();
		bcUser.setPoNum(Integer.parseInt(request.getParameter("poNum")));
		bcUser.setPoBcImgPath(fileInfo.getFilePath());
		bcUser.setPoBcImgName(fileInfo.getFileName());
		
		int result = bcDao.updateBcImg(bcUser);
		return result;
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
	
	//문자발송 - 전화번호부
	public Map<String, Object> sendMmsForContractServ(String checkedName, String checkedHp, String smsMsg){
		//System.out.println("이름 : "+checkedName);
		//System.out.println("휴대폰 : "+checkedHp);
		//System.out.println("메세지 : "+smsMsg);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] nameList = checkedName.split(",");
		String[] hpList = checkedHp.split(",");
		
		final int scheduleType = 0;
		final String subject = "알림";
		final String callback = "01036731951";
		String destInfo = null;
		int destCount = 1; // 수신자목록 개수 최대:100
		smsMsg += "\n 문자 수신거부 : http://survey.bestpoll.kr/rej";
		
		int succ = 0;
		int fail = 0;
		
		if(nameList.length == hpList.length) {
			for(int i=0; i<nameList.length; i++) {
				Mms mms = new Mms();
				destInfo = nameList[i]+"^"+hpList[i].replaceAll("-", "");
				mms = setMms(scheduleType, subject, callback, destInfo, destCount, smsMsg);
				int result = bcDao.insertMms(mms);
				
				if(result == 1) succ++;
				else if(result == 0) fail ++;
			}
		}
		map.put("succ", succ);
		map.put("fail", fail);
		return map;
	}
	
	//==============================================================================================================
	
	//전화번호부 그룹핑
	//전화번호부 입력메서드 오버로딩
	public Map<String, Object> addPhoneListServ(String checkedName, String checkedHp, String telNum, int groupNo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] nameList = checkedName.split(",");
		String[] hpList = checkedHp.split(",");
		
		int succ = 0;
		int fail = 0;
		List<String> overlapList = new ArrayList<String>();
		if(nameList.length == hpList.length) {
			for(int i=0; i<nameList.length; i++) {
				BcGroup bcGroup = new BcGroup();
				bcGroup.setBcName(nameList[i]);
				bcGroup.setBcHp(hpList[i].replaceAll("-", ""));
				bcGroup.setBcOrderHp(telNum);
				bcGroup.setBcCate(groupNo);
				
				//중복체크
				int count = bcDao.selectReCheckHpByGroup(bcGroup);
				
				if(count == 0) { //중복없음
					int result = bcDao.insertHpByGroup(bcGroup);
					
					if(result == 1) {
						System.out.println("입력 성공");
						succ++;
					}else {
						System.out.println("입력 실패");
						fail++;
					}
				}else if(count > 0){
					System.out.println("중복데이터 있음");
					overlapList.add(nameList[i]);
				}							
			}
		}
		
		map.put("overlapList", overlapList); //중복목록 세팅
		if(succ == (nameList.length-overlapList.size())) {
			map.put("result", "success");
			map.put("succCount", "succ");
		}else {
			map.put("result", "fail");
			map.put("succCount", "succ");
			map.put("failCount", "fail");
		}
		
		return map;
	}
	
	//전화번호부 그룹핑 된  목록 조회
	public List<BcGroup> readListByGroupServ(int groupNo, String telNum){
		BcGroup bcGroup = new BcGroup();
		bcGroup.setBcCate(groupNo);
		bcGroup.setBcOrderHp(telNum);
		return bcDao.selectListByGroup(bcGroup);
	}
	
	//수신거부
	public Map<String, Object> bcRejectServ(String rejHp){
		Map<String, Object> map = new HashMap<String, Object>();
		
		BcReject bcReject = new BcReject();
		bcReject.setRejHp(rejHp);
		
		int addRes = bcDao.insertBcReject(bcReject);
		int upRes = 0;
		
		if(addRes == 1) {
			BcGroup bcGroup = new BcGroup();
			bcGroup.setBcHp(rejHp);
			bcGroup.setBcReject(1);
			List<BcGroup> list = bcDao.selectBcGroupByHp(bcGroup);
			
			if(list.size() > 0) {
				for(int i=0; i<list.size(); i++) {
					list.get(i).setBcReject(2);
					
					upRes = bcDao.updateBcGroupRej(list.get(i));
					
					if(upRes >= 1) map.put("result", "succ");
				}
			}else {
				map.put("result", "succ");
			}
			
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
}
