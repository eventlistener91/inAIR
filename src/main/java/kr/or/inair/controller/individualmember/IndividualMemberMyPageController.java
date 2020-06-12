package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.inair.characterlist.service.ICHARListService;
import kr.or.inair.characterresult.service.ICHARResultService;
import kr.or.inair.idpicture.service.IIdPictureService;
import kr.or.inair.individualmember.academic.service.IAcademicService;
import kr.or.inair.individualmember.classofposition.service.IClassOfPositionService;
import kr.or.inair.individualmember.individualmember.service.IINDVDLMEMService;
import kr.or.inair.individualmember.indvdlsecession.service.IINDVDLDropService;
import kr.or.inair.individualmember.joboffersubmit.service.IJOSubmitService;
import kr.or.inair.individualmember.lowpro.service.ILowPROService;
import kr.or.inair.individualmember.resume.service.IResumeService;
import kr.or.inair.individualmember.salary.service.ISalaryService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.individualmember.work.service.IWorkService;
import kr.or.inair.mentor.service.IMentorService;
import kr.or.inair.recentjo.service.IRecentJOService;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.utiles.MailSender;
import kr.or.inair.utiles.SMSSender;
import kr.or.inair.vo.CHAR_ListVO;
import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.INDVDL_DropVO;
import kr.or.inair.vo.Jo_SubmitVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.Recent_JoVO;
import kr.or.inair.vo.ResumeVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;
import kr.or.inair.vo.WorkVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/myPage/")
public class IndividualMemberMyPageController {
	@Autowired
	private IINDVDLMEMService individualService;
	@Autowired
	private IMentorService mentorService;
	@Autowired
	private IIdPictureService idPictureService;
	@Autowired
	private AttachFileMapper fileMapper;
	@Autowired
	private MailSender mailSender;
	@Autowired
	private SMSSender smsSender;
	@Autowired
	private ICHARListService charListService;
	@Autowired
	private ICHARResultService charResultService;
	@Autowired
	private IResumeService resumeService;
	@Autowired
	private IAcademicService academicService;
	@Autowired
	private ILowPROService lowProService;
	@Autowired
	private ISalaryService salaryService;
	@Autowired
	private IClassOfPositionService positionService;
	@Autowired
	private IUpPROService upProService;
	@Autowired
	private IUpIndustryService upINdustryService;
	@Autowired
	private IWorkService workService;
	@Autowired
	private IINDVDLDropService dropOutService;
	@Autowired
	private IClassOfPositionService classOfPositionService;
	@Autowired
	private IRecentJOService recentJOService;
	@Autowired
	private IJOSubmitService joSubmitService;
	
	@RequestMapping("myPageHome")
	public ModelAndView myPageHome(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		
		List<Jo_SubmitVO> joSubmitList = this.joSubmitService.joSubmitList(indvdl_id);
		
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		andView.addObject("joSubmitList", joSubmitList);
		
		andView.setViewName("myPage/indvdlMember/myPageHome");
		return andView;
	}
	
	@RequestMapping("myPageCertification")
	public ModelAndView myPageCertification(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();;
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		andView.setViewName("myPage/indvdlMember/myPageCertification");
		
		return andView;
	}
	
	@RequestMapping("myPageUpdateForm")
	public ModelAndView myPageUpdateForm(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, String indvdl_id) throws Exception {
		
		params.put("indvdl_id", indvdl_id);
		
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		andView.setViewName("myPage/indvdlMember/myPageUpdateForm");
		
		return andView;
	}
	
	@RequestMapping("updateIndvdlMem")
	public ModelAndView updateIndvdlMember( ModelAndView andView,
											INDVDLMEMVO indvdlMemInfo, 
											String indvdl_id, 
											String idpic_file_num,
											@RequestParam("idPicture") MultipartFile picture) throws Exception {
		
		this.individualService.updateIndvdlMember(indvdlMemInfo);
		
		IDPictureVO idPictureInfo = null;
		
		if (picture.getOriginalFilename() != null && !picture.getOriginalFilename().equals("")) {
			idPictureInfo = fileMapper.idPictureMapper(picture, indvdl_id);
		}
		
		if(idPictureInfo != null){
			if (idpic_file_num == null) {
				idPictureService.insertIdPicture(idPictureInfo);
			} else if ( (idpic_file_num != null) && (idPictureInfo.getIdpic_file_name() != null) && (!idPictureInfo.getIdpic_file_name().equals("")) ) {
				idPictureInfo.setIdpic_file_num(idpic_file_num);
				idPictureService.updateIdPicture(idPictureInfo);
			}
		}
		
		String unEncodingMessage = URLEncoder.encode("개인정보 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		
//		andView.addObject("idPictureInfo", idPictureInfo);
		andView.setViewName("redirect:/myPage/myPageHome.do?message=" + encodingMessage);
				
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("mailCheck")
	public String mailCheck(String indvdl_mail, Map<String, String> jsonMap, HttpSession session) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		
		String sessionMail = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_mail();
		
		if ( indvdl_mail.equals(sessionMail) ) {
			String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
			String subject = "inAIR 메일 인증입니다.";
			String body = "인증번호 [ " + randomString + " ]를 입력해주세요.";
			mailSender.mailSender(indvdl_mail, subject, body);
			
			jsonMap.put("resultFlag", "true");
			jsonMap.put("randomString", randomString);
			
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		} else {
			jsonMap.put("resultFlag", "false");
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		}
	}
	
	@ResponseBody
	@RequestMapping("getLoginCommemInfo")
	public String getLoginCommemInfo(INDVDLMEMVO indvdlMemInfo,
			String indvdl_id) throws Exception{
		
		indvdlMemInfo = individualService.getLoginINDVDLMEMInfo(indvdl_id);
		String indvdl_pass = indvdlMemInfo.getIndvdl_pass();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("indvdl_pass", indvdl_pass);
		
		jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
	
	@ResponseBody
	@RequestMapping("telCheck")
	public String telCheck(String indvdl_tel, Map<String, String> params, Map<String, String> jsonMap, HttpSession session) throws Exception {
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		
		String sessionTel = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_tel();
		
		if ( indvdl_tel.equals(sessionTel) ) {
			String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
			params.put("to", indvdl_tel);
			params.put("form", "01046071091");
			params.put("type", "SMS");
			params.put("text", "(inAIR) 고객님의 인증번호는 [" + randomString + "] 입니다" );
			params.put("app_version", "testapp 1.2");
			smsSender.send(params);
			
			jsonMap.put("resultFlag", "true");
			jsonMap.put("randomString", randomString);
			
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		} else {
			jsonMap.put("resultFlag", "false");
			jsonData = mapper.writeValueAsString(jsonMap);
			
			return jsonData;
		}
	}
	
	@RequestMapping("passwordChange")
	public ModelAndView passwordChange(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();;
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		andView.setViewName("myPage/indvdlMember/passwordChange");
		
		return andView;
	}
	
	@RequestMapping("passwordCheck")
	public String passwordCheck(Map<String, String> params, String indvdl_id, String indvdl_pass) throws Exception {
		params.put("indvdl_id", indvdl_id);
		params.put("indvdl_pass", indvdl_pass);
		
		individualService.passwordChange(params);
		
		String unEncodingMessage = URLEncoder.encode("비밀번호 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		
		return "redirect:/myPage/myPageHome.do?encodingMessage=" + encodingMessage;
	}
	
	@RequestMapping("myProfile")
	public ModelAndView myProfile(ModelAndView andView, 
								  INDVDLMEMVO indvdlMemInfo, 
								  Map<String, String> params,
								  ResumeVO resumeInfo, 
								  HttpSession session) throws Exception {
		
		// 기본 정보
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		// 이력서 정보
		List<ResumeVO> resumeList = this.resumeService.getResumeInfoList(params);
		List<LowProVO> proList = this.lowProService.getLowProfession();
		List<SalaryVO> salaryList = this.salaryService.getSalaryList();
		List<ClassOfPositionVO> positionList = this.positionService.getClassOfPositionList();
		
		andView.addObject("resumeList", resumeList);
		andView.addObject("proList", proList);
		andView.addObject("salaryList", salaryList);
		andView.addObject("positionList", positionList);
		
		// 인성 검사
		List<CHAR_ListVO> charList = this.charListService.char_List();
		andView.addObject("charList", charList);
		
		andView.setViewName("myPage/indvdlMember/myProfile");
		
		return andView;
	}
	
	@RequestMapping("academicUpdateForm")
	public ModelAndView academicUpdate(ModelAndView andView, String resume_num, ResumeVO resumeInfo) throws Exception {
		
		List<UpProVO> upPROList = this.upProService.getUpPROList();
		List<UpIndustryVO> upIndustryList = this.upINdustryService.getUpIndustryList();
		List<WorkVO> workList = workService.getWorkList();
		List<ClassOfPositionVO> classOfPositionList = classOfPositionService.getClassOfPositionList();
		
		andView.addObject("upPROList", upPROList);
		andView.addObject("upIndustryList", upIndustryList);
		andView.addObject("workList", workList);
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		andView.addObject("resumeInfo", resumeInfo);
		
		andView.setViewName("myPage/indvdlMember/academicUpdateForm");
		
		return andView;
	}
	
	@RequestMapping("carrerUpdateForm")
	public ModelAndView carrerUpdate(ModelAndView andView, String resume_num, ResumeVO resumeInfo) throws Exception {
		
		List<UpProVO> upPROList = this.upProService.getUpPROList();
		List<UpIndustryVO> upIndustryList = this.upINdustryService.getUpIndustryList();
		List<WorkVO> workList = this.workService.getWorkList();
		List<ClassOfPositionVO> classOfPositionList = this.classOfPositionService.getClassOfPositionList();
		
		andView.addObject("upPROList", upPROList);
		andView.addObject("upIndustryList", upIndustryList);
		andView.addObject("workList", workList);
		andView.addObject("classOfPositionList", classOfPositionList);
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		andView.addObject("resumeInfo", resumeInfo);
		
		andView.setViewName("myPage/indvdlMember/careerUpdateForm");
		
		return andView;
	}
	
	@RequestMapping("selfIntroductionForm")
	public ModelAndView selfIntroduction(ModelAndView andView, String resume_num, ResumeVO resumeInfo, HttpServletResponse response) throws Exception {
		
		List<ClassOfPositionVO> classOfPositionList = this.positionService.getClassOfPositionList();
		List<UpProVO> upProList = this.upProService.getUpPROList();
		List<UpIndustryVO> upIndustryList = this.upINdustryService.getUpIndustryList();
		List<WorkVO> workList = this.workService.getWorkList();
		List<SalaryVO> salaryList = this.salaryService.getSalaryList();
		
		andView.addObject("classOfPositionList", classOfPositionList);
		andView.addObject("upPROList", upProList);
		andView.addObject("upIndustryList", upIndustryList);
		andView.addObject("workList", workList);
		andView.addObject("salaryList", salaryList);
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		andView.addObject("resumeInfo", resumeInfo);
		
		andView.setViewName("myPage/indvdlMember/selfIntroductionForm");
		
		return andView;
	}
	
	@RequestMapping("memberDropOut")
	public ModelAndView memberDropOut(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		List<INDVDL_DropVO> dropOutList = this.dropOutService.indvdlDropOutList();
		andView.addObject("dropOutList", dropOutList);

		andView.setViewName("myPage/indvdlMember/memberDropOut");
		
		return andView;
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(Map<String, String> params, String indvdl_id, String indvdl_secsn, HttpSession session ) throws Exception {
		
		params.put("indvdl_id", indvdl_id);
		params.put("indvdl_secsn", indvdl_secsn);
		
		this.individualService.deleteIndvdlMember(params);
		
		session.removeAttribute("LOGIN_MEMBERINFO");
		
		return "myPage/indvdlMember/memberDropOutComplete";
	}
	
	@RequestMapping("sessionRemove")
	public String sessionRemove(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/individualMember/mainView.do";
	}
	
	@RequestMapping("memberDropOutComplete")
	public ModelAndView memberDropOutComplete(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		session.removeAttribute("LOGIN_MEMBERINFO");
		
		andView.setViewName("myPage/indvdlMember/memberDropOutComplete");
		
		return andView;
	}
	
	@RequestMapping("recentJobOffer")
	public ModelAndView recentJobOffer(ModelAndView andView, INDVDLMEMVO indvdlMemInfo, Map<String, String> params, HttpSession session) throws Exception {
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		List<Recent_JoVO> recentJoList = recentJOService.recentJoList(indvdl_id);
		
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		
		andView.addObject("indvdlMemInfo", indvdlMemInfo);
		andView.addObject("recentJoList", recentJoList);
		
		andView.setViewName("myPage/indvdlMember/recentJobOffer");
		
		return andView;
	}
	
	@RequestMapping("resumeView")
	public ModelAndView resumeView(ModelAndView modelAndView,
								   String resume_num,
								   ResumeVO resumeInfo,
								   IDPictureVO idPictureInfo,
								   INDVDLMEMVO indvdlMemInfo, 
								   Map<String, String> params, 
								   HttpSession session) throws Exception{
		
		String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
		params.put("indvdl_id", indvdl_id);
		indvdlMemInfo = this.individualService.indvdlInfo(params);
		modelAndView.addObject("indvdlMemInfo", indvdlMemInfo);
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		List<UpProVO> upProList = upProService.getUpPROList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		
		modelAndView.addObject("resumeInfo", resumeInfo);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("salaryList", salaryList);
		
		modelAndView.setViewName("myPage/indvdlMember/resumeView");
		return modelAndView;
	}
	
	@RequestMapping("resumeDownload")
	public ModelAndView resumeDownload(ModelAndView modelAndView,
								   String resume_num,
								   ResumeVO resumeInfo,
								   IDPictureVO idPictureInfo,
								   HttpServletResponse response) throws Exception{
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		List<UpProVO> upProList = upProService.getUpPROList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		
		String name = URLEncoder.encode(resumeInfo.getIndvdlMemInfo().getIndvdl_name(), "utf-8");
	 	
	 	response.setHeader("Content-Disposition", "inline;fileName=" + name + ".doc");
	 	response.setHeader("Content-Description", "JSP Generated Data");
		
		modelAndView.addObject("resumeInfo", resumeInfo);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("salaryList", salaryList);
		
		modelAndView.setViewName("myPage/indvdlMember/resumeDownload");
		return modelAndView;
	}
	
}


