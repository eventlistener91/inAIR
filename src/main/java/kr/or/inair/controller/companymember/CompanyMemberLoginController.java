package kr.or.inair.controller.companymember;

import java.net.URLEncoder;
import java.security.PrivateKey;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.vo.CompanyMemVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/companyMember/login/")
public class CompanyMemberLoginController {
	
	@Autowired
	private ICompanyMEMService companyMemberService;
	@Autowired
	private ObjectMapper mapper;
	
	@ResponseBody
	@RequestMapping("loginCheck")
	public String loginCheck(HttpSession session, String com_id, String com_pass, Map<String, String> params, Map<String, String> jsonMap) throws Exception{
		PrivateKey privateKey = (PrivateKey)session.getAttribute("privateKey");
		
		com_id = CryptoGenerator.decryptRSA(privateKey, com_id);
		com_pass = CryptoGenerator.decryptRSA(privateKey, com_pass);
		
		params.put("com_id", com_id);
		params.put("com_pass", com_pass);
		
		CompanyMemVO comMemInfo = companyMemberService.getComMemInfo(params);
		
		if (comMemInfo == null) {
			jsonMap.put("resultFlag", "false");
		} else {
			session.setAttribute("LOGIN_COMMEMINFO", comMemInfo);
			jsonMap.put("resultFlag", "true");
		}
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		
		String message =URLEncoder.encode("로그아웃되었습니다.", "UTF-8");
		session.invalidate();
		return "redirect:/individualMember/mainView.do?message="+message;
		
	}
	
	
	
	
	
}
