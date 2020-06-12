package kr.or.inair.controller.companymember;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.joboffersubmit.service.IJOSubmitService;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.Job_OfferVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companyMember/applicant/")
public class CompanyMemberApplicantController {
	
	@Autowired
	private IJobOfferService jobOfferService;
	@Autowired
	private ICompanyMEMService companyMemService;

	@RequestMapping("applicantHome")
	public ModelAndView applicantList(ModelAndView andView, HttpSession session, CompanyMemVO companyInfo, Map<String, String> params) throws Exception {
		
		String com_id = ((CompanyMemVO)session.getAttribute("LOGIN_COMMEMINFO")).getCom_id();
		
		params.put("com_id", com_id);
		
		List<Job_OfferVO> jobOfferList = this.jobOfferService.getJobOfferList(params);
		
		andView.addObject("jobOfferList", jobOfferList);
		andView.addObject("companyInfo", companyInfo);
		
		andView.setViewName("companyMember/applicant/applicantHome");
		
		return andView;
	}
	
}
