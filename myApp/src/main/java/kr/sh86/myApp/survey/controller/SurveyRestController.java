package kr.sh86.myApp.survey.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.sh86.myApp.survey.domain.ResData;
import kr.sh86.myApp.survey.domain.Response;
import kr.sh86.myApp.survey.service.SurveyService;

@RestController
public class SurveyRestController {
	
	@Autowired
	private SurveyService surveyService;
	
	@RequestMapping(value="/insertRes", method = RequestMethod.POST)
	public Map<String, String> insertResCtrl(Response response,
			@RequestParam(value="nowPageNum")int nowPageNum){
		
		return null;
	}
	
	//modifyRes
	@RequestMapping(value="/modifyRes", method = RequestMethod.POST)
	public Map<String, String> modifyResCtrl(@RequestParam(value="userNo")int userNo,
			@RequestParam(value="resNo")int resNo,
			@RequestParam(value="nowPageNum")int nowPageNum,
			@RequestParam(value="ansC", defaultValue="9")String ansC,
			@RequestParam(value="ansK", defaultValue="9")String ansK,
			@RequestParam(value="ansM", defaultValue="9")String ansM,
			@RequestParam(value="ansEtc", defaultValue="none")String ansEtc){
		System.out.println(nowPageNum+" 번째 답변 확인  ====================");
		System.out.println("ansC : "+ansC);
		System.out.println("ansK : "+ansK);
		System.out.println("ansM : "+ansM);
		System.out.println("ansEtc : "+ansEtc);
		
		Map<String, String> map = surveyService.modifyResServ(userNo, resNo, nowPageNum, ansC, ansK, ansM, ansEtc);
		return map;
	}
	
	//문자 재발송
	@RequestMapping(value="/sendMmsRe", method = RequestMethod.POST)
	public List<String> sendMmsReCtrl(){
		List<String> list = surveyService.sendMmsNoResServ();
		return list;
	}
	
	//신보응답자 조회 getResList
	@RequestMapping(value="/getResList", method = RequestMethod.POST)
	public Map<String, Object> getResListCtrl(@RequestParam(value="startDate")String startDate, 
			@RequestParam(value="endDate")String endDate,
			@RequestParam(value="type")String type){
		List<ResData> list = surveyService.readSinboResDataServ(startDate, endDate, type);
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("list", list);
		return map;
	}
	
	//여론조사 응답현황 getResInfo
	@RequestMapping(value="/getResInfo", method = RequestMethod.POST)
	public Map<String, Object> getResInfoCtrl(@RequestParam(value="startDate")String startDate, 
			@RequestParam(value="time")String time,
			@RequestParam(value="min")String min,
			@RequestParam(value="type",defaultValue="2")int type,
			@RequestParam(value="endDate", defaultValue="none")String endDate, 
			@RequestParam(value="endTime", defaultValue="none")String endTime,
			@RequestParam(value="endMin", defaultValue="none")String endMin){
		Map<String, Object> map = surveyService.readResInfoServ(startDate, time, min, type, endDate, endTime, endMin); 		
		return map;
	}
	
	//응답자 표본에서 삭제 deleteResList
	@RequestMapping(value="/deleteResList", method = RequestMethod.POST)
	public Map<String, Object> deleteResListCtrl(@RequestParam(value="startDate")String startDate, 
			@RequestParam(value="time")String time,
			@RequestParam(value="min")String min){
		Map<String, Object> map = surveyService.removeResListServ(startDate, time, min); 		
		return map;
	}
	
	//신보 문자보내기
	@RequestMapping(value="/sendSmsSinbo", method = RequestMethod.POST)
	public Map<String, Object> sendSmsSinboCtrl(@RequestParam(value="order")String order,
			@RequestParam(value="msg")String msg){
		Map<String, Object> map = surveyService.sendSmsSinboServ(order, msg); 		
		return map;
	}
	
	//신보 - 엑셀파일 업로드
	@RequestMapping(value="/addSinboExcel", method = RequestMethod.POST)
    public Map<String, Object> addSinboExcelCtrl(MultipartHttpServletRequest request){
        //System.out.println("g2");
        MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File("D:\\sinboExcel\\"+excelFile.getOriginalFilename());
        try {
        	excelFile.transferTo(destFile);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        Map<String, Object> map = surveyService.insertSinboExcelServ(destFile);
        
        //FileUtils.deleteFile(destFile.getAbsolutePath());
        
        return map;
    }
	
	//신보 고객 번호 조회 getSbNum
	@RequestMapping(value="/getSbNum", method = RequestMethod.POST)
	public Map<String, Object> getSbNumCtrl(@RequestParam(value="sbHp")String sbHp){
		Map<String, Object> map = surveyService.readSbNumServ(sbHp); 		
		return map;
	}
}
