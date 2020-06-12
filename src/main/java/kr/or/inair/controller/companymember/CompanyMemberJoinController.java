package kr.or.inair.controller.companymember;

import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import kr.or.inair.comcrtfckey.service.IComCrtfcKeyService;
import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companyinfo.service.ICompanyInfoService;
import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.utiles.CompanyInfoCrawler;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.MailSender;
import kr.or.inair.utiles.SMSSender;
import kr.or.inair.vo.Com_CrtfcKeyVO;
import kr.or.inair.vo.CompanyInfoVO;
import kr.or.inair.vo.CompanyMemJoinVO;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.UpIndustryVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/companyMember/join/")
@Controller
public class CompanyMemberJoinController {
	
	@Autowired
	private ICompanyMEMService companyMemberService;
	@Autowired
	private IComCrtfcKeyService comCrtfcKeyService;
	@Autowired
	private IUpIndustryService upIndustryService;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ICompanyInfoService companyInfoService;
	@Autowired
	private CryptoGenerator cryptoGenerator;
	@Autowired
	private CompanyInfoCrawler companyInfoCrawler;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private SMSSender smsSender;
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping("joinForm")
	public ModelAndView joinForm(ModelAndView andView,HttpSession session, Map<String, String> publicKeyMap) throws Exception {
		List<UpIndustryVO> list = upIndustryService.getUpIndustryList();
		publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.addObject("upIndutyList", list);
		andView.setViewName("join/comMember/joinForm");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("searchCompany")
	public String searchCompany(String corp_name, Map<String, String> params, Map<String, String> resultDataMap) throws Exception {
		params.put("corp_name", corp_name);
		
		List<Map<String, String>> listMap = new ArrayList<Map<String,String>>();
		List<Com_CrtfcKeyVO> list= comCrtfcKeyService.getComCrtfcKey(params);
		
		if(list.size() != 0) {
			resultDataMap.put("resultFlag", "true");
			listMap.add(resultDataMap);
			for(int i = 0; i < list.size(); i++) {
				Map<String, String> tempMap = new HashMap<String, String>();
				tempMap.put("corp_name", list.get(i).getCorp_name());
				tempMap.put("corp_code", list.get(i).getCorp_code());
				tempMap.put("stock_code", list.get(i).getStock_code());
				tempMap.put("modify_date", list.get(i).getModify_date());
				
				listMap.add(tempMap);
			}
		} else {
			resultDataMap.put("resultFlag", "false");
			listMap.add(resultDataMap);
		}
		
		String jsonData = mapper.writeValueAsString(listMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("getCompanyInfo")
	public String getCompanyInfo(String corp_code) throws Exception {
		return companyInfoCrawler.getCompanyInfo(corp_code);
	}
	
	@RequestMapping("comDetailInfoInsertForm")
	public String comDetailInfoInsertForm() throws Exception{
		return "join/comMember/comDetailInfoInsertForm";
	}
	
	@ResponseBody
	@RequestMapping("IDDuplCheck")
	public String IDDupleChck(String com_id, Map<String, String> params, Map<String, String> jsonMap) throws Exception {
		params.put("com_id", com_id);
		CompanyMemVO comMemberInfo = companyMemberService.duplCheck(params);
		
		if (comMemberInfo == null){
			jsonMap.put("flag", "true");
		} else {
			jsonMap.put("flag", "false");
		}
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("corpCodeDuplCheck")
	public String corpCodeDuplCheck(String corp_code, Map<String, String> params, Map<String, String> jsonMap) throws Exception {
		params.put("corp_code", corp_code);
		CompanyMemVO comMemberInfo = companyMemberService.duplCheck(params);
		
		if(comMemberInfo == null) {
			jsonMap.put("flag", "true");
		} else {
			jsonMap.put("flag", "false");
		}
		
		String jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("telCheck")
	public String telCheck(String com_tel, Map<String, String> params, Map<String, String> jsonMap) throws Exception {
		String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		params.put("to", com_tel);
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
	@RequestMapping("mailCheck")
	public String mailCheck(String com_mail, Map<String, String> jsonMap, Map<String, String> params) throws Exception {
		params.put("com_mail", com_mail);
		
		CompanyMemVO comMemberInfo = companyMemberService.duplCheck(params);
		String jsonData = "";
		
		if(comMemberInfo != null) {
			jsonMap.put("resultFlag", "false");
			jsonData = mapper.writeValueAsString(jsonData);
			
			return jsonData;
		} else {
			String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
			String subject = "inAIR 메일인증입니다.";
			String body = "인증번호 [" + randomString + "]를 입력해주세요.";
			mailSender.mailSender(com_mail, subject, body);
			
			jsonMap.put("resultFlag", "true");
			jsonMap.put("randomString", randomString);
			
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		}
		
	}
	
	@RequestMapping("join")
	public String join(CompanyMemJoinVO comMemJoinInfo, HttpSession session) throws Exception {
		PrivateKey privateKey = (PrivateKey) session.getAttribute("privateKey");
		String decryptComMemPass = CryptoGenerator.decryptRSA(privateKey, comMemJoinInfo.getCom_pass());
		comMemJoinInfo.setCom_pass(decryptComMemPass);
		
		CompanyMemVO comMemberInfo = new CompanyMemVO();
		
		comMemberInfo.setCom_id(comMemJoinInfo.getCom_id());
		comMemberInfo.setCom_pass(comMemJoinInfo.getCom_pass());
		comMemberInfo.setCom_tel(comMemJoinInfo.getCom_tel());
		comMemberInfo.setCom_selng(comMemJoinInfo.getCom_selng());
		comMemberInfo.setCom_profit(comMemJoinInfo.getCom_profit());
		comMemberInfo.setCom_mail(comMemJoinInfo.getCom_mail());
		comMemberInfo.setLwinduty_num(comMemJoinInfo.getLwinduty_num());
		comMemberInfo.setCorp_code(comMemJoinInfo.getCorp_code());
		
		CompanyInfoVO comInfo = new CompanyInfoVO();
		comInfo.setCorp_code(comMemJoinInfo.getCorp_code());
		comInfo.setSexdstn(comMemJoinInfo.getM_sexdstn());
		comInfo.setRgllbr_co(comMemJoinInfo.getM_rgllbr_co());
		comInfo.setCnttk_co(comMemJoinInfo.getM_cnttk_co());
		comInfo.setSm(comMemJoinInfo.getM_sm());
		comInfo.setFyer_salary_totamt(comMemJoinInfo.getM_fyer_salary_totamt());
		comInfo.setJan_salary_am(comMemJoinInfo.getM_jan_salary_am());
		
		companyInfoService.insertCompanyInfoByVO(comInfo);
		
		comInfo.setCorp_code(comMemJoinInfo.getCorp_code());
		comInfo.setSexdstn(comMemJoinInfo.getF_sexdstn());
		comInfo.setRgllbr_co(comMemJoinInfo.getF_rgllbr_co());
		comInfo.setCnttk_co(comMemJoinInfo.getF_cnttk_co());
		comInfo.setSm(comMemJoinInfo.getF_sm());
		comInfo.setFyer_salary_totamt(comMemJoinInfo.getF_fyer_salary_totamt());
		comInfo.setJan_salary_am(comMemJoinInfo.getF_jan_salary_am());
		
		companyInfoService.insertCompanyInfoByVO(comInfo);
		
		companyMemberService.insertCompanyMember(comMemberInfo);
		
		return "redirect:/individualMember/mainView.do";
	}
}
