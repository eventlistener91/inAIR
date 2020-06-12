package kr.or.inair.controller.individualmember;

import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.individualmember.service.IINDVDLMEMService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.utiles.CaptchaComparer;
import kr.or.inair.utiles.CaptchaImageGenerator;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.MailSender;
import kr.or.inair.utiles.SMSSender;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.UpProVO;
import kr.or.inair.vo.ZipVO;
import kr.or.inair.zip.service.IZipService;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/individualMember/join/")
@Controller
public class IndividualMemberJoinController {
	
	@Autowired
	private IINDVDLMEMService individualMemberService;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private IUpPROService upProService;
	@Autowired
	private IZipService zipService;
	@Autowired
	private IINDVDLMEMService indvdlMemService;
	@Autowired
	private CaptchaImageGenerator captchaImageGenerator;
	@Autowired
	private CaptchaComparer captcahComparer;
	@Autowired
	private MailSender mailSender;
	@Autowired
	private SMSSender smsSender;
	@Autowired
	private CryptoGenerator cryptoGenerator;
	@Autowired
	private ObjectMapper mapper;
	
	@RequestMapping("joinForm")
	public ModelAndView joinForm(ModelAndView andView, HttpSession session, Map<String, String> publicKeyMap) throws Exception {
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<UpProVO> upProList = upProService.getUpPROList();
		publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		
		String captchaImageName = captchaImageGenerator.getImageName();
		String captchaKey = captchaImageGenerator.getKey();
		
		andView.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.addObject("captchaImageName", captchaImageName);
		andView.addObject("captchaKey", captchaKey);
		andView.addObject("upProList", upProList);
		andView.addObject("finalAcademicList", finalAcademicList);
		andView.setViewName("join/indvdlMember/joinForm");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("refreshCaptcha")
	public String refreshCaptcha(Map<String, String> params) throws Exception {
		String captchaImageName = captchaImageGenerator.getImageName();
		String captchaKey = captchaImageGenerator.getKey();
		
		params.put("captchaImageName", captchaImageName);
		params.put("captchaKey", captchaKey);
		
		String jsonData = mapper.writeValueAsString(params);
		
		return jsonData;
	}
	
	@RequestMapping("zipSearchForm")
	public String zipSearchForm() throws Exception{
		return "join/indvdlMember/zipSearchForm";
	}
	
	@ResponseBody
	@RequestMapping("zipSearch")
	public String zipSearch(String sido, String gugun, String dong, Map<String, String> params) throws Exception{
		params.put("sido", sido);
		params.put("gugun", gugun);
		params.put("dong", dong);
		List<ZipVO> zipList = zipService.getZipList(params);
		
		List<Map<String, String>> listMap = new ArrayList<Map<String,String>>();
		for(int i = 0; i < zipList.size(); i++){
			Map<String, String> newParams = new HashMap<String, String>();
			newParams.put("search_count", String.valueOf(zipList.size()));
			newParams.put("zipcode", zipList.get(i).getZipcode());
			newParams.put("sido", zipList.get(i).getSido());
			newParams.put("gugun", zipList.get(i).getGugun());
			newParams.put("dong", zipList.get(i).getDong());
			newParams.put("bunji", zipList.get(i).getBunji());
			
			listMap.add(newParams);
		}
		
		String jsonData = mapper.writeValueAsString(listMap);
		
		return jsonData; 
	}
	
	@ResponseBody
	@RequestMapping("mailCheck")
	public String mailCheck(String indvdl_mail, Map<String, String> jsonMap, Map<String, String> params) throws Exception {
		params.put("indvdl_mail", indvdl_mail);
		
		INDVDLMEMVO indvdlMemberInfo = indvdlMemService.duplCheck(params);
		String jsonData = "";
		
		if (indvdlMemberInfo != null) {
			jsonMap.put("resultFlag", "false");
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		} else {
			String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
			String subject = "inAIR 메일인증 입니다.";
			String body = "인증번호 [" + randomString + "]를 입력해주세요.";
			mailSender.mailSender(indvdl_mail, subject, body);
			
			jsonMap.put("resultFlag", "true");
			jsonMap.put("randomString", randomString);
			
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		}
	}
	
	@ResponseBody
	@RequestMapping("telCheck")
	public String telCheck(String indvdl_tel, Map<String, String> params, Map<String, String> jsonMap) throws Exception {
		String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		params.put("to", indvdl_tel);
		params.put("from", "01025527637");
		params.put("type", "SMS");
		params.put("text", "(inAIR)고객님의 인증번호는 [" + randomString + "] 입니다.");
		params.put("app_version", "testapp 1.2");
		smsSender.send(params);
		
		jsonMap.put("randomString", randomString);
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("IDDuplCheck")
	public String IDDuplCheck(String indvdl_id, Map<String, String> params, Map<String, String> jsonMap) throws Exception {
		params.put("indvdl_id", indvdl_id);
		INDVDLMEMVO indvdlMemberInfo = individualMemberService.duplCheck(params);
		
		if (indvdlMemberInfo == null){ // 입력한 아이디가 존재하지 않을 때
			jsonMap.put("flag", "true");
		} else { // 입력한 아이디가 존재할 때
			jsonMap.put("flag", "false");
		}
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("captchaCheck")
	public String captchaCheck(String value, String key) throws Exception {
		return captcahComparer.getResponsBody(key, value);
	}
	
	@RequestMapping("join")
	public String join(INDVDLMEMVO indvdlMemInfo, HttpSession session) throws Exception {
		PrivateKey privateKey = (PrivateKey)session.getAttribute("privateKey");
		String decryptIndvdl_pass = CryptoGenerator.decryptRSA(privateKey, indvdlMemInfo.getIndvdl_pass());
		indvdlMemInfo.setIndvdl_pass(decryptIndvdl_pass);
		
		indvdlMemService.insertIndvdlMember(indvdlMemInfo);
		
		return "redirect:/individualMember/mainView.do";
	}
	
	@RequestMapping("callback")
	public ModelAndView callback(ModelAndView andView) throws Exception{
		andView.addObject("naverSocialID", GlobalConstant.NAVER_SOCIAL_ID);
		andView.setViewName("join/indvdlMember/callback");
		
		return andView;	
	}
	
}
