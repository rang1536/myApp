package kr.sh86.myApp.survey.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
