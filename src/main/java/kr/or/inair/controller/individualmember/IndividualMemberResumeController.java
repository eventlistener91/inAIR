package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.idpicture.service.IIdPictureService;
import kr.or.inair.individualmember.academic.service.IAcademicService;
import kr.or.inair.individualmember.classofposition.service.IClassOfPositionService;
import kr.or.inair.individualmember.employment.service.IEmploymentService;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.language.service.ILanguageService;
import kr.or.inair.individualmember.lowindustry.service.ILowIndustryService;
import kr.or.inair.individualmember.lowpro.service.ILowPROService;
import kr.or.inair.individualmember.resume.service.IResumeService;
import kr.or.inair.individualmember.salary.service.ISalaryService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.individualmember.work.service.IWorkService;
import kr.or.inair.portfolio.service.IPortfolioService;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.AcademicVO;
import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.LanguageVO;
import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.PortfolioVO;
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
@RequestMapping("/individualMember/")
public class IndividualMemberResumeController {
	@Autowired
	private IResumeService resumeService;
	@Autowired
	private IEmploymentService employmentService;
	@Autowired
	private ISalaryService salaryService;
	@Autowired
	private IUpPROService upPROService;
	@Autowired
	private IUpIndustryService upIndustryService;
	@Autowired
	private ILowPROService lowPROService;
	@Autowired
	private ILowIndustryService lowIndustryService;
	@Autowired
	private IClassOfPositionService classOfPositionService;
	@Autowired
	private ILanguageService languageService;
	@Autowired
	private IWorkService workService;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private IAcademicService academicService;
	@Autowired
	private AttachFileMapper fileMapper;
	@Autowired
	private IPortfolioService portfolioService;
	
	
	//개인회원 이력서관리 화면 
	@RequestMapping("resumeHome")
	public ModelAndView resumeView(HttpSession session,
								ModelAndView modelAndView) throws Exception{
		INDVDLMEMVO loginMem = (INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO");
		List<ResumeVO> resumeList;
		resumeList = resumeService.getResumeList(loginMem.getIndvdl_id());
	
		modelAndView.addObject("resumeList", resumeList);
		modelAndView.setViewName("indvdlMember/resume/resumeHome");
		return modelAndView;
	}
	
	/**
	 * 이력서 등록 화면 
	 * @param modelAndView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("resumeInsertForm")
	public ModelAndView resumeInsertForm(ModelAndView modelAndView
										) throws Exception{
		List<EmploymentVO> employmentList = employmentService.getEmploymentList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		List<ClassOfPositionVO> classOfPositionList = classOfPositionService.getClassOfPositionList();
		List<LanguageVO> languageList = languageService.getLanguageList();
		List<WorkVO> workList = workService.getWorkList();
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<AcademicVO> academicList = academicService.getAcademicList();
		
		modelAndView.addObject("employmentList", employmentList);
		modelAndView.addObject("salaryList", salaryList);
		modelAndView.addObject("upPROList", upPROList);
		modelAndView.addObject("upIndustryList", upIndustryList);
		modelAndView.addObject("classOfPositionList", classOfPositionList);
		modelAndView.addObject("languageList", languageList);
		modelAndView.addObject("workList", workList);
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("academicList", academicList);
		
		modelAndView.setViewName("indvdlMember/resume/resumeInsertForm");
		return modelAndView;
	}
	
	/**
	 * 이력서 등록 화면 
	 * @param modelAndView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("insertResume")
	public String insertResume(ResumeVO insertResumeInfo,
							   @RequestParam("portfolioFiles") MultipartFile[] items) throws Exception{
		String resume_num = resumeService.insertResume(insertResumeInfo);
		
		List<PortfolioVO> inserPortfolioList = null;
		if(items != null){
			inserPortfolioList = fileMapper.portfolioMapper(items, resume_num);
			portfolioService.inserPortfolioList(inserPortfolioList);
		}
		
		String unEncodingMessage = URLEncoder.encode("이력서 등록이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/individualMember/resumeHome.do?message=" + encodingMessage;
	}
	
	/**
	 * 상위 직종 번호를 받아 하위 직종리스트를 반환하는 컨트롤러
	 * @param uppro_num
	 * @param params
	 * @return 직종리스트
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("lowPROList")
	public String lowPROList(String uppro_num,
					 	     Map<String, String> params) throws Exception{
		params.put("uppro_num",uppro_num);
		
		List<LowProVO> lowPROList = lowPROService.getLowPROList(params);
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		
		for (int i = 0; i < lowPROList.size(); i++){
			Map<String, String> tempMap =  new HashMap<String, String>();
			tempMap.put("lowpro_name", lowPROList.get(i).getLowpro_name());
			tempMap.put("lowpro_num", lowPROList.get(i).getLowpro_num());
			tempMap.put("uppro_num", lowPROList.get(i).getUppro_num());
			
			mapList.add(tempMap);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(mapList);
		
		return jsonData;
	}
	
	/**
	 * 상위 업종 번호를 받아 하위 업종리스트를 반환하는 컨트롤러
	 * @param uppro_num
	 * @param params
	 * @return 업종리스트
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("lowIndustryList")
	public String lowIndustryList(String upinduty_num,
								  Map<String, String> params) throws Exception{
		params.put("upinduty_num",upinduty_num);
		
		List<LowIndustryVO> lowIndustryList = lowIndustryService.getLowIndustryList(params);
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		
		for (int i = 0; i < lowIndustryList.size(); i++){
			Map<String, String> tempMap =  new HashMap<String, String>();
			tempMap.put("lwinduty_name", lowIndustryList.get(i).getLwinduty_name());
			tempMap.put("lwinduty_num", lowIndustryList.get(i).getLwinduty_num());
			tempMap.put("upinduty_num", lowIndustryList.get(i).getUpinduty_num());
			
			mapList.add(tempMap);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(mapList);
		
		return jsonData;
	}

	/**
	 * 이력서 update form 컨트롤러
	 * @param modelAndView
	 * @param resume_num
	 * @param resumeInfo
	 * @return 이력서 update 화면 
	 * @throws Exception 
	 */
	@RequestMapping("resumeUpdateForm")
	public ModelAndView resumeUpdateForm(ModelAndView modelAndView,
										 String resume_num,
										 ResumeVO resumeInfo) throws Exception{
		
		List<EmploymentVO> employmentList = employmentService.getEmploymentList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		List<ClassOfPositionVO> classOfPositionList = classOfPositionService.getClassOfPositionList();
		List<LanguageVO> languageList = languageService.getLanguageList();
		List<WorkVO> workList = workService.getWorkList();
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<AcademicVO> academicList = academicService.getAcademicList();
		
		modelAndView.addObject("employmentList", employmentList);
		modelAndView.addObject("salaryList", salaryList);
		modelAndView.addObject("upPROList", upPROList);
		modelAndView.addObject("upIndustryList", upIndustryList);
		modelAndView.addObject("classOfPositionList", classOfPositionList);
		modelAndView.addObject("languageList", languageList);
		modelAndView.addObject("workList", workList);
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("academicList", academicList);
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		modelAndView.addObject("resumeInfo", resumeInfo);
		
		modelAndView.setViewName("indvdlMember/resume/resumeUpdateForm");
		return modelAndView;
	}

	@RequestMapping("updateResume")
	public String updateResume(ResumeVO updateResumeVo,
							   String[] port_num,
							   String updateport_num0,
							   String updateport_num1,
							   String updateport_num2,
							   String updateport_num3,
							   String updateport_num4,
							   @RequestParam("portfolioFiles") MultipartFile[] items) throws Exception{
		resumeService.updateResumeInfo(updateResumeVo);

		List<PortfolioVO> updatePortfolioList = null;
		if(items != null){
			updatePortfolioList = fileMapper.portfolioMapper(items, updateResumeVo.getResume_num());
			int temp=0;
			if(updateport_num0.equals("1") && temp<updatePortfolioList.size()){
				updatePortfolioList.get(temp++).setPort_num(port_num[0]);
			}
			if(updateport_num1.equals("1") && temp<updatePortfolioList.size()){
				updatePortfolioList.get(temp++).setPort_num(port_num[1]);
			}
			if(updateport_num2.equals("1") && temp<updatePortfolioList.size()){
				updatePortfolioList.get(temp++).setPort_num(port_num[2]);
			}
			if(updateport_num3.equals("1") && temp<updatePortfolioList.size()){
				updatePortfolioList.get(temp++).setPort_num(port_num[3]);
			}
			if(updateport_num4.equals("1") && temp<updatePortfolioList.size()){
				updatePortfolioList.get(temp++).setPort_num(port_num[4]);
			}
			portfolioService.updatePortfolioList(updatePortfolioList);
		}
		
		String unEncodingMessage = URLEncoder.encode("이력서 수정이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/individualMember/resumeHome.do?message=" + encodingMessage;
	}
	
	
	@RequestMapping("deleteResume")
	public String deleteResume(String resume_num) throws Exception{
		resumeService.deleteResume(resume_num);
		
		String unEncodingMessage = URLEncoder.encode("이력서 삭제가 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/individualMember/resumeHome.do?message=" + encodingMessage;
	}
	
	@RequestMapping("portfolioDownload")
	public ModelAndView portfolioDownload(ModelAndView modelAndView,
										  String port_filesavename,
										  String port_filename){
		modelAndView.addObject("targetFileName", port_filesavename);
		modelAndView.addObject("fileName", port_filename);
		modelAndView.setViewName("fileDownloadView");
		
		return modelAndView;
	}
	
	@RequestMapping("resumeView")
	public ModelAndView resumeView(ModelAndView modelAndView,
								   String resume_num,
								   ResumeVO resumeInfo,
								   IDPictureVO idPictureInfo) throws Exception{
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		List<UpProVO> upProList = upPROService.getUpPROList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		
		modelAndView.addObject("resumeInfo", resumeInfo);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("salaryList", salaryList);
		
		modelAndView.setViewName("indvdlMember/resume/resumeView");
		return modelAndView;
	}
	
	
}
