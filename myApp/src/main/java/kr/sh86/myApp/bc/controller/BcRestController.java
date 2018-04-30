package kr.sh86.myApp.bc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.sh86.myApp.bc.domain.BcUser;
import kr.sh86.myApp.bc.domain.FavorCate;
import kr.sh86.myApp.bc.service.BcService;

@CrossOrigin(origins="*")
@RestController
public class BcRestController {

	@Autowired
	private BcService bcService;
	
	//모든 명함조회
	@RequestMapping(value="/getBcAll",  method = RequestMethod.POST)
	public List<BcUser> getBcAllCtrl(){
		return bcService.readBcAllServ();
	}
	
	//즐겨찾기 changeFavor
	@RequestMapping(value="/changeFavor",  method = RequestMethod.POST)
	public Map<String, Object> changeFavorCtrl(BcUser bcUser){
		//System.out.println("즐겨찾기 값 확인 : "+bcUser);
		return bcService.modifyBcFavorByPoNumServ(bcUser);
	}
	
	//상세보기
	@RequestMapping(value="/getUserDetail",  method = RequestMethod.POST)
	public BcUser getUserDetailCtrl(@RequestParam(value="poNum")int poNum){
		return bcService.readUserByPoNumServ(poNum);
	}
	
	//명함검색 - 이름으로
	@RequestMapping(value="/searchUser",  method = RequestMethod.POST)
	public List<BcUser> searchUserCtrl(@RequestParam(value="searchValue", defaultValue="none")String searchValue,
			@RequestParam(value="local", defaultValue="none")String local,
			@RequestParam(value="jobCate", defaultValue="직업")String jobCate,
			@RequestParam(value="relationShip", defaultValue="관계")String relationShip,
			@RequestParam(value="searchType", defaultValue="search")String searchType){
		//System.out.println(searchValue+local+jobCate+relationShip);
		Map<String, String> params = new HashMap<String, String>();
		params.put("searchValue", searchValue);
		params.put("local", local);
		params.put("jobCate", jobCate);
		params.put("relationShip", relationShip);
		params.put("searchType", searchType);
		return bcService.readUserByPoNameServ(params);
	}
	
	//명함삭제 
	@RequestMapping(value="/removeUser",  method = RequestMethod.POST)
	public Map<String, Object> removeUserCtrl(@RequestParam(value="checkedData")String checkedData){
		//System.out.println("삭제할 pk 값 확인 : "+checkedData);
		return bcService.removeUserByPoNumServ(checkedData);
	}
	
	//즐겨찾기 카테고리 조회
	@RequestMapping(value="/getFavorCateAll",  method = RequestMethod.POST)
	public List<FavorCate> getFavorCateAllCtrl(){
		return bcService.readFavorCateAllServ();
	}
	
	//명함정보에 즐겨찾기 카테고리 등록 setPoFavorCate
	@RequestMapping(value="/setPoFavorCate",  method = RequestMethod.POST)
	public Map<String, Object> setPoFavorCateCtrl(BcUser bcUser){
		System.out.println("명함정보 pk 값 확인 : "+bcUser);
		return bcService.modifyUserFavorCateServ(bcUser);
	}
	
	//검색옵션 조회
	@RequestMapping(value="/getSearchOption",  method = RequestMethod.POST)
	public Map<String, Object> getSearchOptionCtrl(){
		return bcService.readSearchOptionServ();
	}
	
	//즐겨찾기 검색
	@RequestMapping(value="/getFavorListCate",  method = RequestMethod.POST)
	public List<BcUser> getFavorListCateCtrl(@RequestParam(value="cateNum", defaultValue="0")int cateNum){
		System.out.println("cateNum : "+cateNum);
		return bcService.readFavorListByCateServ(cateNum);
	}
	
	//모바일기기 전화번호부 입력 addHpList
	/*@RequestMapping(value="/addHpList",  method = RequestMethod.POST)
	public List<BcUser> addHpListCtrl(@RequestParam(value="checkedName")String checkedName,
			@RequestParam(value="checkedHp")String checkedHp){
		return bcService.readFavorListByCateServ(cateNum);
	}*/
}
