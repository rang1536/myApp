package kr.sh86.myApp.bc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.sh86.myApp.bc.dao.BcDao;
import kr.sh86.myApp.bc.domain.BcUser;
import kr.sh86.myApp.bc.domain.FavorCate;
import kr.sh86.myApp.bc.domain.InduCode;
import kr.sh86.myApp.bc.domain.Target;

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
					if(colCheck1.equals("북구") || colCheck1.equals("서구") || colCheck1.equals("남구") || colCheck1.equals("동구") || colCheck1.equals("중구")) { //구군이 2글자일때
						col12 = colCheck1;
					}else if(colCheck2.equals("부산진구") || colCheck2.equals("해운대구")) { //구군이 4글자일때
						col12 = colCheck2;
					}else {
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
	public List<BcUser> readBcAllServ(){
		return bcDao.selectBcAll();
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
	
	//
}
