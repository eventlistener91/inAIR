package kr.or.inair.controller.individualmember;

import java.security.PrivateKey;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.individualmember.service.IINDVDLMEMService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.utiles.CaptchaComparer;
import kr.or.inair.utiles.CaptchaImageGenerator;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.MailSender;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.UpProVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/individualMember/login/")
public class IndividualMemberLoginController {
	
	@Autowired
	private CaptchaImageGenerator captchaImageGenerator;
	@Autowired
	private CaptchaComparer captcahComparer;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private IUpPROService upProService;
	@Autowired
	private IINDVDLMEMService individualMemberService;
	@Autowired
	private MailSender mailsend;
	@Autowired
	private ObjectMapper mapper;
	
	@ResponseBody
	@RequestMapping("loginCheck")
	public String loginCheck(HttpServletRequest request,
							 HttpServletResponse response,
							 HttpSession session,
							 Map<String,String> params,
							 String indvdl_id,
							 String indvdl_pass,
							 Map<String, String> jsonMap) throws Exception{
		
		PrivateKey privateKey = (PrivateKey)session.getAttribute("privateKey");
		
		//복호화
		indvdl_id = CryptoGenerator.decryptRSA(privateKey, indvdl_id);
		indvdl_pass = CryptoGenerator.decryptRSA(privateKey, indvdl_pass);
		
		params.put("indvdl_id", indvdl_id);
		params.put("indvdl_pass", indvdl_pass);
		
		INDVDLMEMVO indvdlMemInfo = individualMemberService.indvdlmemInfo(params);
		
		if(indvdlMemInfo == null){
			jsonMap.put("resultFlag", "false");
		}else{
			session.setAttribute("LOGIN_INDVDLMEMINFO", indvdlMemInfo);
			jsonMap.put("resultFlag", "true");
		}
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@RequestMapping("emailSend")
	public ModelAndView idSearch(HttpServletRequest request,
			 					HttpServletResponse response,
								ModelAndView andView,
							    String indvdl_name,
							    String indvdl_mail,
								Map<String,String> params,
								INDVDLMEMVO indvdlmemidInfo) throws Exception{
		//입력한 이름과 메일주소를 params에 넣어준다.
		params.put("indvdl_name", indvdl_name);
		params.put("indvdl_mail", indvdl_mail);
		
		//params를 서비스단 searchid()에 보내 해당하는 indvdlmemvo를 가져온다.
		indvdlmemidInfo = this.individualMemberService.searchid(params);
		// mailsend로 mailSender 매서드를 호출하여 이용하여 보내는 사람의 email,제목,아이디(내용)을 보내준다.
		mailsend.mailSender(indvdlmemidInfo.getIndvdl_mail(), "e-로움 아이디입니다.",  "아이디:"+indvdlmemidInfo.getIndvdl_id());
		
		andView.addObject("indvdlmemInfo",indvdlmemidInfo);
		andView.setViewName("login/indvdlMember/emailSend");
		
		return andView;
	}
	
	@RequestMapping("emailPassSend")
	public ModelAndView passSearch(HttpServletRequest request,
			 					HttpServletResponse response,
								ModelAndView andView,
							    String indvdl_id,
							    String indvdl_mail,
								Map<String,String> params,
								Map<String,String> param,
								INDVDLMEMVO indvdlmempassInfo) throws Exception{
		
		//임시 비밀번호를 만들 객체 temporarypassword 초기화
 		String temporarypassword = "";
		
 		//랜덤한 임시 비밀번호 생성
		for(int i = 0; i < 1; i++){
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			uuid = uuid.substring(0, 10);
			temporarypassword += uuid;
		}
		//아이디와 임시비밀번호를 params에 담아 서비스단 updatePassword()로 넘겨주고 db단에서 임시비밀번호로 update시켜준다.
		params.put("indvdl_id", indvdl_id);
	    params.put("indvdl_pass", temporarypassword);
		this.individualMemberService.updatePassword(params);
		
		//사용자가 입력한 아이디와 메일을 param으로 받아 서비스단의 searchpass()로 넘겨주어 해당하는 indvdlmemvo 받아온다. 
		param.put("indvdl_id", indvdl_id);
		param.put("indvdl_mail", indvdl_mail);
		indvdlmempassInfo = this.individualMemberService.searchpass(params);

		//db에 저장된 mail로 임시패스워드를 발송
		mailsend.mailSender(indvdlmempassInfo.getIndvdl_mail(), "e-로움 임시패스워드입니다.", "패스워드:"+temporarypassword);
		andView.setViewName("login/indvdlMember/emailPassSend");
		return andView;
	}
	
	
	@RequestMapping("idSearchView")
	public String idSearch() throws Exception{
		return "login/indvdlMember/idSearchView";
	}
	
	@RequestMapping("passSearch")
	public String passSearch() throws Exception{
		return "login/indvdlMember/passSearchView";
	}
	
	@RequestMapping("callback")
	public ModelAndView callback(ModelAndView andview) throws Exception {
		andview.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
		andview.setViewName("login/indvdlMember/callback");
		
		return andview;
	}
	
	@RequestMapping("socialLoginCheck")
	public ModelAndView socialLoginCheck(HttpSession session, ModelAndView andView, String indvdl_gender, String indvdl_name, String indvdl_mail, String loginTarget, Map<String, String> params, Map<String, String> publicKeyMap) throws Exception{
		params.put("indvdl_mail", indvdl_mail);
		
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<UpProVO> upProList = upProService.getUpPROList();
		INDVDLMEMVO indvdlMemInfo = individualMemberService.indvdlmemInfo(params);
		publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		
		String captchaImageName = captchaImageGenerator.getImageName();
		String captchaKey = captchaImageGenerator.getKey();
		
		if(indvdlMemInfo != null) {
			session.setAttribute("LOGIN_INDVDLMEMINFO", indvdlMemInfo);
			andView.setViewName("redirect:/individualMember/mainView.do");
		} else {
			
			if(loginTarget.equals("N")) {
				andView.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
				andView.addObject("publicKeyMap", publicKeyMap);
				andView.addObject("upProList", upProList);
				andView.addObject("finalAcademicList", finalAcademicList);
				andView.addObject("naverSocialIsPass", "true");
				andView.addObject("indvdl_gender", indvdl_gender);
				andView.addObject("indvdl_name", indvdl_name);
				andView.addObject("indvdl_mail", indvdl_mail);
				andView.setViewName("join/indvdlMember/joinForm");
			} else if (loginTarget.equals("G")) {
				andView.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
				andView.addObject("publicKeyMap", publicKeyMap);
				andView.addObject("upProList", upProList);
				andView.addObject("finalAcademicList", finalAcademicList);
				andView.addObject("googleSocialIsPass", "true");
				andView.addObject("indvdl_name", indvdl_name);
				andView.addObject("indvdl_mail", indvdl_mail);
				andView.setViewName("join/indvdlMember/joinForm");
			}
		}
		
		return andView;
	}
}
