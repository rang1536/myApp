package kr.sh86.myApp;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.sh86.myApp.bc.service.BcService;
import kr.sh86.myApp.survey.domain.BioResponse;
import kr.sh86.myApp.survey.domain.BioUser;
import kr.sh86.myApp.survey.domain.Users;
import kr.sh86.myApp.survey.service.SurveyService;
import kr.sh86.myApp.util.RombInteg;

@Controller
public class HomeController {
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private BcService bcService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "privercy/a";
	}
	
	@RequestMapping(value = "/siRej", method = RequestMethod.GET)
	public String sicheckRejCtrl(Model model,
			@RequestParam(value="poNum", defaultValue="0")String poNum) {
		model.addAttribute("poNum", poNum);
		return "/sicheck/rej";
	}
	
	@RequestMapping(value = "/sicheckList", method = RequestMethod.GET)
	public String sicheckListCtrl(Model model) {
		model.addAttribute("list", surveyService.sicheckServ());
		return "/sicheck/list";
	}
	
	@RequestMapping(value = "/sbList", method = RequestMethod.GET)
	public String sbListCtrl(Model model) {
		model.addAttribute("list", surveyService.readSinboResInfoServ());
		return "/sinbo/sbList";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listCtrl(Model model) {
		Map<String, Object> map = surveyService.readResStatusServ();
		
		model.addAttribute("total", map.get("total"));
		model.addAttribute("resTotal", map.get("resTotal"));
		model.addAttribute("resAll", map.get("resAll"));
		model.addAttribute("mmsFail", map.get("mmsFail"));
		model.addAttribute("sendList", map.get("sendList"));
		
		return "/glocal/list";
	}
	
	@RequestMapping(value = "/insertBioRes", method = RequestMethod.POST)
	public String insertBioResCtrl(BioUser bioUser, BioResponse bioResponse) {
		System.out.println("기업정보 : "+bioUser);
		System.out.println("응답정보 : "+bioResponse);
		
		int result = surveyService.addBioResServ(bioUser, bioResponse);
		
		return "bio/b";
	}
	
	//휴넷 - 수신거부 
	@RequestMapping(value = "/rej", method = RequestMethod.GET)
	public String rejCtrl() {		
		return "bcApp/reject";
	}
	
	

}
