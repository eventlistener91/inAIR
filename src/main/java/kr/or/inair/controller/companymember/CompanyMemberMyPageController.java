package kr.or.inair.controller.companymember;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companyinfo.service.ICompanyInfoService;
import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.companymember.comprofile.service.ICompanyMEMComProfileService;
import kr.or.inair.companymember.comsecession.service.ICompanyMEMCOMDropService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.COM_DropVO;
import kr.or.inair.vo.COM_ProfileVO;
import kr.or.inair.vo.CompanyInfoVO;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.CompanyVO;
import kr.or.inair.vo.UpIndustryVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companyMember/myPage/")
public class CompanyMemberMyPageController {
	@Autowired
	private IUpIndustryService upIndustryService;
	@Autowired
	private ICompanyMEMService companyMEMService;
	@Autowired
	private ICompanyMEMComProfileService companyMEMComProfileService; 
	@Autowired
	private AttachFileMapper fileMapper;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ICompanyInfoService companyInfoService;
	@Autowired
	private ICompanyMEMCOMDropService comMemDropService;
	
	 
	@RequestMapping("myPageHome")
	public String myPageHome(){
		
		return "companyMember/myPage/myPageCertification";
	}
	
	@ResponseBody
	@RequestMapping("getLoginCommemInfo")
	public String getLoginCommemInfo(CompanyMemVO companyMemVo,
									 String com_id) throws Exception{
		
		companyMemVo = companyMEMService.getMyPageCompanyMemberInfo(com_id);
		String com_pass = companyMemVo.getCom_pass();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("com_pass", com_pass);
		
		jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	@RequestMapping("myPageUpdateForm")
	public ModelAndView myPageUpdateForm(ModelAndView modelAndView,
										 HttpSession session,
										 CompanyMemVO companyMemVo,
										 String com_id,
										 COM_ProfileVO comProfileInfo) throws Exception{
		com_id = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO")).getCom_id();
		companyMemVo = companyMEMService.getMyPageCompanyMemberInfo(com_id);
		comProfileInfo = companyMEMComProfileService.getComProfileInfo(com_id);

		modelAndView.addObject("companyMemVo" , companyMemVo);
		modelAndView.addObject("comProfileInfo" , comProfileInfo);
		
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();			
		modelAndView.addObject("upIndustryList" , upIndustryList);
		modelAndView.setViewName("companyMember/myPage/myPageUpdateForm");
		
		return modelAndView;
	}
	
	@RequestMapping("passwordChange")
	public ModelAndView updateCompanyMem(ModelAndView modelAndView){
		
		modelAndView.setViewName("companyMember/myPage/passwordChange");
		
		return modelAndView;
	}
	
	@RequestMapping("passwordCheck")
	public String passwordCheck(Map<String, String> params,
								String com_id,
								String com_pass) throws Exception{
		params.put("com_id", com_id);
		params.put("com_pass", com_pass);
		
		companyMEMService.passwordChange(params);
		
		String unEncodingMessage = URLEncoder.encode("비밀번호 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/companyMember/myPage/myPageHome.do?message=" + encodingMessage;
	}
	
	@RequestMapping("updateCompanyMem")
	public ModelAndView passwordChange(ModelAndView modelAndView,
									   CompanyMemVO updateCompanyMemVo,
									   String com_file_num,
									   @RequestParam("com_profile") MultipartFile item) throws Exception{
		
		companyMEMService.updatecompanyMEMInfo(updateCompanyMemVo);
		
		COM_ProfileVO comProfileInfo = null;
		if(item != null){
			comProfileInfo = fileMapper.comProfileMapper(item, updateCompanyMemVo.getCom_id());
		}
		
		//프로필 번호가 null이면 insert, null이 아니면 update 
		if(com_file_num == null){
			companyMEMComProfileService.insertComProfileInfo(comProfileInfo);
		}else if(com_file_num != null && (comProfileInfo.getCom_file_name() != null) && (!comProfileInfo.getCom_file_name().equals(""))){
			comProfileInfo.setCom_file_num(com_file_num);
			companyMEMComProfileService.updateComProfileInfo(comProfileInfo);
		}
		
		String unEncodingMessage = URLEncoder.encode("기본정보 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		modelAndView.setViewName("redirect:/companyMember/myPage/myPageHome.do?message=" + encodingMessage);
		
		return modelAndView;
	}
	
	@RequestMapping("updateCompany")
	public ModelAndView updateCompany(ModelAndView modelAndView,
									  CompanyVO updateCompanyVo) throws Exception{
		companyService.updateCompany(updateCompanyVo);
		
		String unEncodingMessage = URLEncoder.encode("기업정보 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		modelAndView.setViewName("redirect:/companyMember/myPage/myPageHome.do?message=" + encodingMessage);
		
		return modelAndView;
	}
	
	@RequestMapping("updateCompanyInfo")
	public ModelAndView updateCompanyInfo(ModelAndView modelAndView,
										  CompanyMemVO updateCompanyMemVo) throws Exception{
		List<CompanyInfoVO> updateCompanyInfoList = new ArrayList<CompanyInfoVO>();
		
		for(int i=0; i<2; i++){
			updateCompanyInfoList.add(updateCompanyMemVo.getCompanyInfoList().get(i));
		}
		
		companyInfoService.updateCompanyInfoList(updateCompanyInfoList);
		
		String unEncodingMessage = URLEncoder.encode("기업 추가정보 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		modelAndView.setViewName("redirect:/companyMember/myPage/myPageHome.do?message=" + encodingMessage);
		
		return modelAndView;
	}
	
	@RequestMapping("comMemberdropOut")
	public ModelAndView comMemberdropOut(ModelAndView modelAndView) throws Exception{
		
		List<COM_DropVO> dropOutList = comMemDropService.getDropOutList();
		modelAndView.addObject("dropOutList", dropOutList);
		
		modelAndView.setViewName("companyMember/myPage/comMemberDropOut");
		
		return modelAndView;
	}
	@RequestMapping("comMemberDelete")
	public ModelAndView comMemberDelete(ModelAndView modelAndView, 
										String com_id, 
										String com_secsn,
										Map<String, String> params,
										HttpSession session) throws Exception{
		params.put("com_id", com_id);
		params.put("com_secsn", com_secsn);
		
		companyMEMService.deleteComMem(params);
		session.invalidate();
		
		modelAndView.addObject("com_id", com_id);
		modelAndView.setViewName("companyMember/myPage/comMemberDropOutComplete");
		
		return modelAndView;
	}
	
}
