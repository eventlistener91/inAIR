package kr.or.inair.controller.main;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.utiles.CryptoGenerator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login/")
public class LoginController {

	@RequestMapping("loginForm")
	public ModelAndView login(HttpSession session, ModelAndView andView) throws Exception{
		
		Map<String, String> publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		
		andView.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.setViewName("login/indvdlMember/login");
		
		return andView;
	}
	
}
