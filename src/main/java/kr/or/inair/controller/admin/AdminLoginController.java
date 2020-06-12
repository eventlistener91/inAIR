package kr.or.inair.controller.admin;

import java.net.URLEncoder;
import java.security.PrivateKey;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.admin.admin.service.IAdminService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.vo.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/login/")
public class AdminLoginController {
	@Autowired
	private IAdminService adminService;

	@RequestMapping("adminLoginForm")
	public ModelAndView adminLoginForm(HttpSession session,
			 					 ModelAndView andView){
		
		Map<String, String> publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.setViewName("/admin/login/adminLoginForm");
		
		return andView;
	}
	
	@RequestMapping("loginCheckAdmin")
	public String loginAdmin(HttpSession session,
							 AdminVO adminInfo) throws Exception{
		PrivateKey privateKey = (PrivateKey)session.getAttribute("privateKey");
		String decryptAdmin_id = CryptoGenerator.decryptRSA(privateKey, adminInfo.getAdmin_id());
		String decryptAdmin_pass = CryptoGenerator.decryptRSA(privateKey, adminInfo.getAdmin_pass());
		
		adminInfo.setAdmin_id(decryptAdmin_id);
		adminInfo.setAdmin_pass(decryptAdmin_pass);
		
		boolean result = adminService.getAdminInfo(adminInfo);
		String viewName; 
		
		if(result == true){
			session.setAttribute("LOGIN_ADMININFO", adminInfo);
			
			String unEncodingMessage = URLEncoder.encode("관리자님 환영합니다.", "UTF-8");
			String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");

			viewName = "redirect:/admin/main/mainView.do?message=" + encodingMessage;
		}else{
			
			String unEncodingMessage = URLEncoder.encode("아이디와 비밀번호를 확인해 주세요.", "UTF-8");
			String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
			
			viewName = "redirect:/admin/login/adminLoginForm.do?message=" + encodingMessage;
		}
		
		return viewName;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		
		String message =URLEncoder.encode("로그아웃되었습니다.", "UTF-8");
		session.invalidate();
		return "redirect:/admin/login/adminLoginForm.do?message="+message;
		
	}
	
	
	
	
	
}
