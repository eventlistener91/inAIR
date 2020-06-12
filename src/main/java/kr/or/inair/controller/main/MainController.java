package kr.or.inair.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/")
public class MainController {
	@RequestMapping("main")
	public String mainView(){
		return "a/a";
	}
	
	@RequestMapping("test")
	public String test(){
		return "individualMember/test";
	}
}
