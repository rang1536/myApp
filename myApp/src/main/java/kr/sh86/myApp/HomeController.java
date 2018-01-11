package kr.sh86.myApp;

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

import kr.sh86.myApp.survey.domain.Users;
import kr.sh86.myApp.survey.service.SurveyService;

@Controller
public class HomeController {
	
	@Autowired
	private SurveyService surveyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,
			@RequestParam(value="userNo", defaultValue="0")int userNo) {
		if(userNo == 0) {
			return "redirect:list";
		}
		Users user = surveyService.readUserServ(userNo);
		Map<String, Object> map= surveyService.createResServ(user);
		
		/*surveyService.sendMmsServ();*/
		model.addAttribute("user", user);
		model.addAttribute("res", map.get("response"));
		model.addAttribute("check", map.get("check"));
		model.addAttribute("lastQuNum", user.getResComplete());
		return "/glocal/a";
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
	
}
