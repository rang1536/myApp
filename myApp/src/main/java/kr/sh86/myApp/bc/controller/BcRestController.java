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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.sh86.myApp.bc.domain.BcGroup;
import kr.sh86.myApp.bc.domain.BcUser;
import kr.sh86.myApp.bc.domain.FavorCate;
import kr.sh86.myApp.bc.domain.GroupCate;
import kr.sh86.myApp.bc.service.BcService;
import kr.sh86.myApp.util.UtilFile;

@CrossOrigin(origins="*")
@RestController
public class BcRestController {

	@Autowired
	private BcService bcService;
	
	//모든 명함조회
	@RequestMapping(value="/getBcAll",  method = RequestMethod.POST)
	public List<BcUser> getBcAllCtrl(@RequestParam(value="poNum", defaultValue="0")int poNum,
			@RequestParam(value="checkBackNNext")String checkBackNNext){
		return bcService.readBcAllServ(poNum, checkBackNNext);
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
	@RequestMapping(value="/addHpList",  method = RequestMethod.POST)
	public Map<String, Object> addHpListCtrl(@RequestParam(value="checkedName")String checkedName,
			@RequestParam(value="checkedHp")String checkedHp){
		return bcService.addPhoneListServ(checkedName, checkedHp);
	}
	
	//파일업로드
	@RequestMapping(value="/fileUpload",  method = RequestMethod.POST)
	public Map<String, Object> fileUploadCtrl(MultipartHttpServletRequest request){
		System.out.println("파일업로드~!!");
		System.out.println("파일이름 : "+request.getFile("photo"));
		System.out.println("pk확인 : "+request.getParameter("poNum"));
		
		/*UtilFile utilFile = new UtilFile();
		utilFile.singleUploadFile(request);*/
		int result = bcService.modifyBcImgServ(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "succ");
		
		return map;
	}
	
	//이미지 미리보기 위한 최근 업로드 사진 조회
	@RequestMapping(value="/addBcUser",  method = RequestMethod.POST)
	public Map<String, Object> getPhotoCtrl(BcUser bcUser){
		System.out.println("폼값 확인 : "+bcUser);
		return bcService.addBcUserServ(bcUser);
	}
	
	//선택된 번호 문자발송 smsSendByChecked
	@RequestMapping(value="/smsSendByChecked",  method = RequestMethod.POST)
	public Map<String, Object> smsSendByCheckedCtrl(@RequestParam(value="checkedName")String checkedName,
			@RequestParam(value="checkedHp")String checkedHp,
			@RequestParam(value="smsMsg")String smsMsg){
		return bcService.sendMmsForContractServ(checkedName, checkedHp, smsMsg);
	}
	
	//==========================================================================================================
	
	//전화번호부 그룹핑 하기 
	@RequestMapping(value="/addHpGrouping",  method = RequestMethod.POST)
	public Map<String, Object> addHpGroupingCtrl(@RequestParam(value="checkedName")String checkedName,
			@RequestParam(value="checkedHp")String checkedHp,
			@RequestParam(value="telNum")String telNum,
			@RequestParam(value="groupNo")int groupNo){
		//System.out.println("checkedName : "+checkedName);
		//System.out.println("checkedHp : "+checkedHp);
		//System.out.println("telNum : "+telNum);
		//System.out.println("groupNo : "+groupNo);
		return bcService.addPhoneListServ(checkedName, checkedHp, telNum, groupNo);
	}
	
	//전화번호부 그룹 카테고리 조회 getGroupCateAll
	@RequestMapping(value="/getGroupCateAll",  method = RequestMethod.POST)
	public List<GroupCate> getGroupCateAllCtrl(){
		return bcService.readGroupCateAllServ();
	}
	
	//전화번호부 그룹핑 된 목록 조회
	@RequestMapping(value="/getListByGroup",  method = RequestMethod.POST)
	public List<BcGroup> getListByGroupCtrl(@RequestParam(value="groupNo", defaultValue="0")int groupNo,
			@RequestParam(value="telNum")String telNum){
		System.out.println("groupNo : "+groupNo);
		System.out.println("telNum : "+telNum);
		return bcService.readListByGroupServ(groupNo, telNum);
	}
	
	//문자수신거부 huNetRejCheck
	@RequestMapping(value="/huNetRejCheck",  method = RequestMethod.POST)
	public Map<String, Object> huNetRejCheckCtrl(@RequestParam(value="rejHp")String rejHp){
		return bcService.bcRejectServ(rejHp);
	}
	
}
