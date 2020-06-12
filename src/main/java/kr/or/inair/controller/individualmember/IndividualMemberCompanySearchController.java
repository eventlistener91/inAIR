package kr.or.inair.controller.individualmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companymember.careerhistory.service.ICareerHistoryService;
import kr.or.inair.individualmember.employment.service.IEmploymentService;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.lowpro.service.ILowPROService;
import kr.or.inair.individualmember.salary.service.ISalaryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.vo.CareerHistoryVO;
import kr.or.inair.vo.CompanyVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.Job_OfferVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpProVO;

import org.codehaus.jettison.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companySearch/")
public class IndividualMemberCompanySearchController {
	
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
	private ICompanyService companyService;
	@Autowired
	private IJobOfferService jobOfferService;

	@RequestMapping("companySearchHome")
	public ModelAndView companySearch(ModelAndView andView,
									  Map<String, String> params, 
									  String corp_name, 
									  String search_pro, 
									  String corp_add,
									  String corp_acdmcr,
									  String corp_employment,
									  String corp_salary,
									  String careerRadio,
									  String corp_lowPro
									  ) throws Exception {
		
		params.put("corp_name", corp_name);
		params.put("corp_lowPro", corp_lowPro);
		params.put("corp_add", corp_add);
		params.put("corp_acdmcr", corp_acdmcr);
		params.put("corp_employment", corp_employment);
		params.put("corp_salary", corp_salary);
		params.put("careerRadio", careerRadio);
		
		List<SalaryVO> salaryList = this.salaryService.getSalaryList();
		List<CareerHistoryVO> careerHistoryList = this.careerHistorySevice.getcareerHistoryList();
		List<EmploymentVO> employmentList = this.employmentService.getEmploymentList();
		List<Final_AcademicVO> finalAcademicList = this.finalAcademicService.getFinalAcademicList();
		List<UpProVO> upProList = this.upProService.getUpPROList();
		List<CompanyVO> companyList = this.companyService.companyList(params);
		List<Job_OfferVO> jobOfferList = this.jobOfferService.jobOfferList(params);
		
		andView.addObject("salaryList", salaryList);
		andView.addObject("careerHistoryList", careerHistoryList);
		andView.addObject("employmentList", employmentList);
		andView.addObject("finalAcademicList", finalAcademicList);
		andView.addObject("upProList", upProList);
		andView.addObject("corp_name", corp_name);
		andView.addObject("companyList", companyList);
		andView.addObject("jobOfferList", jobOfferList);
		
		andView.setViewName("indvdlMember/companySearch/companySearchHome");
		
		return andView;
	}
	
}
