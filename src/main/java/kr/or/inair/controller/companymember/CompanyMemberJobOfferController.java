package kr.or.inair.controller.companymember;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companyinfo.service.ICompanyInfoService;
import kr.or.inair.companymember.careerhistory.service.ICareerHistoryService;
import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.companymember.comprofile.service.ICompanyMEMComProfileService;
import kr.or.inair.individualmember.classofposition.service.IClassOfPositionService;
import kr.or.inair.individualmember.employment.service.IEmploymentService;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.jobofferfile.service.IJobOfferFileService;
import kr.or.inair.individualmember.joboffersubmit.service.IJOSubmitService;
import kr.or.inair.individualmember.lowindustry.service.ILowIndustryService;
import kr.or.inair.individualmember.lowpro.service.ILowPROService;
import kr.or.inair.individualmember.resume.service.IResumeService;
import kr.or.inair.individualmember.salary.service.ISalaryService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.COM_ProfileVO;
import kr.or.inair.vo.CareerHistoryVO;
import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.CompanyInfoVO;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.CompanyVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;
import kr.or.inair.vo.Job_OfferVO;
import kr.or.inair.vo.Job_Offer_FileVO;
import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.ResumeVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companyMember/jobOffer/")
public class CompanyMemberJobOfferController {
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
	private ICompanyMEMService companyMEMService;
	@Autowired
	private ICompanyInfoService companyInfoService;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ICompanyMEMComProfileService comProfileService;
	@Autowired
	private IJobOfferService jobOfferService;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private AttachFileMapper fileMapper;
	@Autowired
	private IJobOfferFileService jobOfferFileService;
	@Autowired
	private ICareerHistoryService careerHistoryService;
	@Autowired
	private ICompanyMEMComProfileService companyMEMComProfileService;
	@Autowired
	private IJOSubmitService joSubmitService;
	@Autowired
	private IResumeService resumeService;
	
	@RequestMapping("jobOfferHome")
	public ModelAndView jobOfferHome(ModelAndView modelAndView,
									 HttpSession session,
									 CompanyMemVO companyMemVo,
									 String jo_aireqst,
									 String joOfferStatus,
									 Map<String, String> params) throws Exception{
		companyMemVo = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO"));
		
		params.put("com_id", companyMemVo.getCom_id());
		if(jo_aireqst != null && !jo_aireqst.equals("all") && !jo_aireqst.equals("")){
			params.put("jo_aireqst", jo_aireqst);
		}
		
		String joOfferStatus0 = "";
		String joOfferStatus1 = "";
		String joOfferStatus2 = "";
		if(joOfferStatus != null && joOfferStatus.equals("0")){
			joOfferStatus0 = "0";
			params.put("joOfferStatus0", joOfferStatus0);
		}else if(joOfferStatus != null && joOfferStatus.equals("1")){
			joOfferStatus1 = "0";
			params.put("joOfferStatus1", joOfferStatus1);
		}else if(joOfferStatus != null && joOfferStatus.equals("2")){
			joOfferStatus2 = "0";
			params.put("joOfferStatus2", joOfferStatus2);
		}
		
		List<Job_OfferVO> jobOfferList = jobOfferService.getJobOfferList(params);
		
		modelAndView.addObject("jobOfferList", jobOfferList);
		modelAndView.addObject("jo_aireqst", jo_aireqst);
		modelAndView.addObject("joOfferStatus", joOfferStatus);
		
		modelAndView.setViewName("companyMember/jobOffer/jobOfferHome");
		
		return modelAndView;
	}
	
	@RequestMapping("jobOfferSelectInsertForm")
	public ModelAndView jobOfferSelectInsertForm(ModelAndView modelAndView,
												 HttpSession session,
												 CompanyMemVO companyMemVo,
												 CompanyVO companyVo) throws Exception{
		companyMemVo = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO"));
		companyVo = companyService.getCompanyInfo(companyMemVo.getCorp_code());
		
		modelAndView.addObject("companyVo", companyVo);
		
		modelAndView.setViewName("companyMember/jobOffer/jobOfferSelectInsertForm");
		
		return modelAndView;
	}
	
	@RequestMapping("jobOfferInsertForm")
	public ModelAndView jobOfferInsertForm(ModelAndView modelAndView,
										   HttpSession session,
										   CompanyMemVO companyMemVo) throws Exception{
		List<EmploymentVO> employmentList = employmentService.getEmploymentList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		List<ClassOfPositionVO> classOfPositionList = classOfPositionService.getClassOfPositionList();
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getJobOfferFinalAcademicList();
		List<CareerHistoryVO> careerHistoryList = careerHistoryService.getcareerHistoryList();
		
		companyMemVo = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO"));
		
		List<CompanyInfoVO> companyInfoList = companyInfoService.getCompanyInfo(companyMemVo.getCorp_code());
		CompanyVO companyVo = companyService.getCompanyInfo(companyMemVo.getCorp_code());
		LowIndustryVO industryInfo = lowIndustryService.getIndustryInfo(companyMemVo.getLwinduty_num());
		
		CompanyInfoVO companyInfofirst = null;
		CompanyInfoVO companyInfosecond = null; 
		for(int i=0; i<companyInfoList.size(); i++){
			if(companyInfoList.get(i).getSexdstn().equals("여")){
				companyInfofirst = companyInfoList.get(i);
			}else{
				companyInfosecond = companyInfoList.get(i);
			}
			
		}
		
		COM_ProfileVO comProfile = comProfileService.getComProfileInfo(companyMemVo.getCom_id());
		
		modelAndView.addObject("employmentList", employmentList);
		modelAndView.addObject("salaryList", salaryList);
		modelAndView.addObject("upPROList", upPROList);
		modelAndView.addObject("upIndustryList", upIndustryList);
		modelAndView.addObject("classOfPositionList", classOfPositionList);
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("careerHistoryList", careerHistoryList);
		
		modelAndView.addObject("comProfile", comProfile);
		modelAndView.addObject("companyInfofirst", companyInfofirst);
		modelAndView.addObject("companyInfosecond", companyInfosecond);
		modelAndView.addObject("companyVo", companyVo);
		modelAndView.addObject("industryInfo", industryInfo);
		
		modelAndView.setViewName("companyMember/jobOffer/jobOfferInsertForm");
		
		return modelAndView;
	}
	
	@RequestMapping("insertJobOffer")
	public String insertJobOffer(Job_OfferVO insertJobOffer,
								 @RequestParam("jobOfferFiles") MultipartFile[] items) throws Exception{
		String jo_num = jobOfferService.insertjobOffer(insertJobOffer);
		
		List<Job_Offer_FileVO> insertJobOfferFileList = null;
		if(items != null){
			insertJobOfferFileList = fileMapper.jobOfferFileMapper(items, jo_num);
			jobOfferFileService.insertJobOfferFileList(insertJobOfferFileList);
		}

		String unEncodingMessage = URLEncoder.encode("구인공고 등록이 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/companyMember/jobOffer/jobOfferHome.do?message=" + encodingMessage;
	}
	
	@RequestMapping("deleteJobOffer")
	public String deleteJobOffer(String jo_num) throws Exception{
		
		jobOfferService.deleteJobOffer(jo_num);
			
		String unEncodingMessage = URLEncoder.encode("구인공고 삭제가 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/companyMember/jobOffer/jobOfferHome.do?message=" + encodingMessage;
	}
	
	@RequestMapping("aiJobOfferInsertForm")
	public ModelAndView aiJobOfferInsertForm(ModelAndView modelAndView,
											 HttpSession session,
											 CompanyMemVO companyMemVo) throws Exception{
		List<EmploymentVO> employmentList = employmentService.getEmploymentList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		List<ClassOfPositionVO> classOfPositionList = classOfPositionService.getClassOfPositionList();
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getJobOfferFinalAcademicList();
		List<CareerHistoryVO> careerHistoryList = careerHistoryService.getcareerHistoryList();
		
		companyMemVo = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO"));
		
		List<CompanyInfoVO> companyInfoList = companyInfoService.getCompanyInfo(companyMemVo.getCorp_code());
		CompanyVO companyVo = companyService.getCompanyInfo(companyMemVo.getCorp_code());
		LowIndustryVO industryInfo = lowIndustryService.getIndustryInfo(companyMemVo.getLwinduty_num());
		
		CompanyInfoVO companyInfofirst = null;
		CompanyInfoVO companyInfosecond = null; 
		for(int i=0; i<companyInfoList.size(); i++){
			if(companyInfoList.get(i).getSexdstn().equals("여")){
				companyInfofirst = companyInfoList.get(i);
			}else{
				companyInfosecond = companyInfoList.get(i);
			}
			
		}
		
		COM_ProfileVO comProfile = comProfileService.getComProfileInfo(companyMemVo.getCom_id());
		
		modelAndView.addObject("employmentList", employmentList);
		modelAndView.addObject("salaryList", salaryList);
		modelAndView.addObject("upPROList", upPROList);
		modelAndView.addObject("upIndustryList", upIndustryList);
		modelAndView.addObject("classOfPositionList", classOfPositionList);
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("careerHistoryList", careerHistoryList);
		
		modelAndView.addObject("comProfile", comProfile);
		modelAndView.addObject("companyInfofirst", companyInfofirst);
		modelAndView.addObject("companyInfosecond", companyInfosecond);
		modelAndView.addObject("companyVo", companyVo);
		modelAndView.addObject("industryInfo", industryInfo);
		
		modelAndView.setViewName("companyMember/jobOffer/aiJobOfferInsertForm");
		return modelAndView;
	}
	
	@RequestMapping("jobOfferView")
	public ModelAndView jobOfferViewForm(ModelAndView modelAndView,
										 Job_OfferVO jobOfferInfo,
										 CompanyMemVO companyMemVo,
										 COM_ProfileVO comProfileInfo,
										 String jo_num) throws Exception{
		
		jobOfferInfo = jobOfferService.getJobOfferInfo(jo_num);
		companyMemVo = companyMEMService.getMyPageCompanyMemberInfo(jobOfferInfo.getCom_id());
		comProfileInfo = companyMEMComProfileService.getComProfileInfo(jobOfferInfo.getCom_id());
		List<Job_Offer_FileVO> jobOfferFileList = jobOfferFileService.getJobOfferFileList(jo_num);
		List<Jo_SubmitVO> joSubmitList = joSubmitService.getjoSubmitList(jo_num);
		
		JoSubmitChartsVO joSubmitGenderChartsInfo = joSubmitService.getJoSubmitCharts(jo_num);
		JoSubmitChartsVO joSubmitSalaryChartsInfo = joSubmitService.getJoSubmitSalaryCharts(jo_num);
		JoSubmitChartsVO joSubmitFinalAcademicChartsInfo = joSubmitService.getJoSubmitFinalAcademicCharts(jo_num);
		JoSubmitChartsVO joSubmitAgeChartsInfo = joSubmitService.getJoSubmitAgeCharts(jo_num);
		
		modelAndView.addObject("jobOfferInfo", jobOfferInfo);
		modelAndView.addObject("companyMemVo", companyMemVo);
		modelAndView.addObject("comProfileInfo", comProfileInfo);
		modelAndView.addObject("jobOfferFileList", jobOfferFileList);
		modelAndView.addObject("joSubmitList", joSubmitList);
		modelAndView.addObject("joSubmitGenderChartsInfo", joSubmitGenderChartsInfo);
		modelAndView.addObject("joSubmitSalaryChartsInfo", joSubmitSalaryChartsInfo);
		modelAndView.addObject("joSubmitFinalAcademicChartsInfo", joSubmitFinalAcademicChartsInfo);
		modelAndView.addObject("joSubmitAgeChartsInfo", joSubmitAgeChartsInfo);
		
		modelAndView.setViewName("companyMember/jobOffer/jobOfferView");
		
		return modelAndView;
	}
	
	@RequestMapping("joSubmitList")
	public ModelAndView joSubmitResumeList(ModelAndView modelAndView,
								   		   HttpSession session,
								   		   String jo_num,
								   		   Job_OfferVO jobOfferInfo) throws Exception{
		
		List<Jo_SubmitVO> joSubmitList = joSubmitService.getjoSubmitList(jo_num);
		jobOfferInfo = jobOfferService.getJobOfferInfo(jo_num);
		
		modelAndView.addObject("joSubmitList", joSubmitList);
		modelAndView.addObject("jobOfferInfo", jobOfferInfo);
		modelAndView.addObject("jo_num", jo_num);
		
		return modelAndView;
	}
	
	@RequestMapping("jobOfferFileDownload")
	public ModelAndView jobOfferFileDownload(ModelAndView modelAndView,
										     String jo_file_savename,
										     String jo_file_name){
		modelAndView.addObject("targetFileName", jo_file_savename);
		modelAndView.addObject("fileName", jo_file_name);
		modelAndView.setViewName("fileDownloadView");
		
		return modelAndView;
	}
	
	@RequestMapping("joSubmitFinish")
	public String joSubmitFinish(String jo_num) throws Exception {
		
		this.jobOfferService.jobOfferFinish(jo_num);
		
		return "redirect:jobOfferHome.do";
	}
	
	@RequestMapping("aiPassIndvdlMem")
	public String aiPassIndvdlMem(String submit_num, String jo_num) throws Exception {
		
		this.joSubmitService.aiPassIndvdlMem(submit_num);
		
		return "redirect:joSubmitList.do?jo_num=" + jo_num;
	}
	
	@RequestMapping("aiFailIndvdlMem")
	public String aiFailIndvdlMem(String submit_num, String jo_num) throws Exception {
		
		this.joSubmitService.aiFailIndvdlMem(submit_num);
		
		return "redirect:joSubmitList.do?jo_num=" + jo_num;
	}
	
	@RequestMapping("finalPassIndvdlMem")
	public String finalPassIndvdlMem(String submit_num, String jo_num) throws Exception {
		
		this.joSubmitService.finalPassIndvdlMem(submit_num);
		
		return "redirect:joSubmitList.do?jo_num=" + jo_num;
	}
	
	@RequestMapping("finalFailIndvdlMem")
	public String finalFailIndvdlMem(String submit_num, String jo_num) throws Exception {
		
		this.joSubmitService.finalFailIndvdlMem(submit_num);
		
		return "redirect:joSubmitList.do?jo_num=" + jo_num;
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
		
		modelAndView.setViewName("companyMember/jobOffer/resumeView");
		return modelAndView;
	}

	@RequestMapping("resumeDownload")
	public ModelAndView resumeDownload(ModelAndView modelAndView,
								   String resume_num,
								   ResumeVO resumeInfo,
								   IDPictureVO idPictureInfo,
								   HttpServletResponse response) throws Exception{
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		List<UpProVO> upProList = upPROService.getUpPROList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		
		String name = URLEncoder.encode(resumeInfo.getIndvdlMemInfo().getIndvdl_name(), "utf-8");
		
	 	response.setHeader("Content-Disposition", "attachment;fileName=" + name + ".doc");
	 	response.setHeader("Content-Description", "JSP Generated Data");
		
		modelAndView.addObject("resumeInfo", resumeInfo);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("salaryList", salaryList);
		
		modelAndView.setViewName("companyMember/jobOffer/resumeDownload");
		return modelAndView;
	}
	
	
}
