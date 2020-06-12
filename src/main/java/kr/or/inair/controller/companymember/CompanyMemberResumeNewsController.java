package kr.or.inair.controller.companymember;

import java.util.List;
import java.util.Map;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companymember.careerhistory.service.ICareerHistoryService;
import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.companymember.comprofile.service.ICompanyMEMComProfileService;
import kr.or.inair.individualmember.employment.service.IEmploymentService;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.jobofferfile.service.IJobOfferFileService;
import kr.or.inair.individualmember.joboffersubmit.service.IJOSubmitService;
import kr.or.inair.individualmember.resume.service.IResumeService;
import kr.or.inair.individualmember.salary.service.ISalaryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.vo.COM_ProfileVO;
import kr.or.inair.vo.CareerHistoryVO;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.CompanyVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;
import kr.or.inair.vo.Job_OfferVO;
import kr.or.inair.vo.Job_Offer_FileVO;
import kr.or.inair.vo.ResumeVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companyMember/resumeNews/")
public class CompanyMemberResumeNewsController {
	@Autowired
	private ISalaryService salaryService;
	@Autowired
	private ICareerHistoryService careerHistorySevice;
	@Autowired
	private IEmploymentService employmentService;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private IUpPROService upProService;
	@Autowired
	private IResumeService resumeService;
	@Autowired
	private IJobOfferService jobOfferService;
	@Autowired
	private IJobOfferFileService jobOfferFileService;
	@Autowired
	private ICompanyMEMComProfileService companyMEMComProfileService;
	@Autowired
	private IJOSubmitService joSubmitService;
	@Autowired
	private ICompanyMEMService companyMEMService;
	
	
	@RequestMapping("resumeNewsHome")
	public ModelAndView resumeNewsHome(ModelAndView modelAndView, 
								 	   Map<String, String> params,
								 	   String search_keyword,
								 	   String corp_lowPro,
								 	   String corp_add,
								 	   String careerRadio,
								 	   String corp_acdmcr,
								 	   String corp_employment,
								 	   String corp_salary) throws Exception{
		String corp_name = search_keyword;
		
		params.put("search_keyword", search_keyword);
		params.put("corp_name", corp_name);
		params.put("corp_add", corp_add);
		params.put("corp_acdmcr", corp_acdmcr);
		params.put("corp_employment", corp_employment);
		params.put("corp_salary", corp_salary);
		params.put("corp_lowPro", corp_lowPro);
		
		List<SalaryVO> salaryList = this.salaryService.getSalaryList();
		List<CareerHistoryVO> careerHistoryList = this.careerHistorySevice.getcareerHistoryList();
		List<EmploymentVO> employmentList = this.employmentService.getEmploymentList();
		List<Final_AcademicVO> finalAcademicList = this.finalAcademicService.getFinalAcademicList();
		List<UpProVO> upProList = this.upProService.getUpPROList();
		List<ResumeVO> resumeList = this.resumeService.resumeList(params);
		List<Job_OfferVO> jobOfferList = this.jobOfferService.jobOfferList(params);
		
		modelAndView.addObject("salaryList", salaryList);
		modelAndView.addObject("careerHistoryList", careerHistoryList);
		modelAndView.addObject("employmentList", employmentList);
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("search_keyword", search_keyword);
		modelAndView.addObject("resumeList", resumeList);
		modelAndView.addObject("jobOfferList", jobOfferList);
		
		modelAndView.setViewName("companyMember/resumeNews/resumeNewsHome");
		
		return modelAndView;
	}
	
	@RequestMapping("resumeView")
	public ModelAndView resumeView(ModelAndView modelAndView,
								   String resume_num,
								   ResumeVO resumeInfo,
								   IDPictureVO idPictureInfo) throws Exception{
		
		resumeInfo = resumeService.getResumeInfo(resume_num);
		List<UpProVO> upProList = upProService.getUpPROList();
		List<SalaryVO> salaryList = salaryService.getSalaryList();
		
		modelAndView.addObject("resumeInfo", resumeInfo);
		modelAndView.addObject("upProList", upProList);
		modelAndView.addObject("salaryList", salaryList);
		
		modelAndView.setViewName("companyMember/resumeNews/resumeView");
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
		
		modelAndView.setViewName("companyMember/resumeNews/jobOfferView");
		
		return modelAndView;
	}
	
}
