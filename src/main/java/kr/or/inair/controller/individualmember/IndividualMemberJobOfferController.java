package kr.or.inair.controller.individualmember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.inair.companymember.companymember.service.ICompanyMEMService;
import kr.or.inair.companymember.comprofile.service.ICompanyMEMComProfileService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferServiceImpl;
import kr.or.inair.individualmember.jobofferfile.service.IJobOfferFileService;
import kr.or.inair.individualmember.joboffersubmit.service.IJOSubmitService;
import kr.or.inair.individualmember.resume.service.IResumeService;
import kr.or.inair.recentjo.service.IRecentJOService;
import kr.or.inair.vo.COM_ProfileVO;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;
import kr.or.inair.vo.Job_OfferVO;
import kr.or.inair.vo.Job_Offer_FileVO;
import kr.or.inair.vo.Recent_JoVO;
import kr.or.inair.vo.ResumeVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/individualMember/jobOffer/")
public class IndividualMemberJobOfferController {
	@Autowired
	private IJobOfferService jobOfferService;
	@Autowired
	private ICompanyMEMService companyMEMService;
	@Autowired
	private ICompanyMEMComProfileService companyMEMComProfileService; 
	@Autowired
	private IJobOfferFileService jobOfferFileService;
	@Autowired
	private IResumeService resumeService;
	@Autowired
	private IRecentJOService recentJOService;
	@Autowired
	private IJOSubmitService joSubmitService;
	
	@RequestMapping("jobOfferView")
	public ModelAndView jobOfferViewForm(ModelAndView modelAndView,
										 Job_OfferVO jobOfferInfo,
										 CompanyMemVO companyMemVo,
										 COM_ProfileVO comProfileInfo,
										 String jo_num,
										 HttpSession session,
										 Map<String, String> params) throws Exception{
		
		jobOfferInfo = jobOfferService.getJobOfferInfo(jo_num);
		companyMemVo = companyMEMService.getMyPageCompanyMemberInfo(jobOfferInfo.getCom_id());
		comProfileInfo = companyMEMComProfileService.getComProfileInfo(jobOfferInfo.getCom_id());
		List<Job_Offer_FileVO> jobOfferFileList = jobOfferFileService.getJobOfferFileList(jo_num);
		List<Jo_SubmitVO> joSubmitList = joSubmitService.getjoSubmitList(jo_num);
		
		JoSubmitChartsVO joSubmitGenderChartsInfo = joSubmitService.getJoSubmitCharts(jo_num);
		JoSubmitChartsVO joSubmitSalaryChartsInfo = joSubmitService.getJoSubmitSalaryCharts(jo_num);
		JoSubmitChartsVO joSubmitFinalAcademicChartsInfo = joSubmitService.getJoSubmitFinalAcademicCharts(jo_num);
		JoSubmitChartsVO joSubmitAgeChartsInfo = joSubmitService.getJoSubmitAgeCharts(jo_num);
		
		if (session.getAttribute("LOGIN_INDVDLMEMINFO") != null) {
			String indvdl_id = ((INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO")).getIndvdl_id();
			
			params.put("jo_inquire_num", jobOfferInfo.getJo_num());
			params.put("jo_inquire_sj", jobOfferInfo.getJo_sj());
			params.put("jo_inquire_rgsde", jobOfferInfo.getJo_rgsde());
			params.put("jo_inquire_clos", jobOfferInfo.getJo_clos());
			params.put("indvdl_id", indvdl_id);
			params.put("jo_num", jobOfferInfo.getJo_num());

			recentJOService.insertRecentJo(params);
		}
		
		modelAndView.addObject("jobOfferInfo", jobOfferInfo);
		modelAndView.addObject("companyMemVo", companyMemVo);
		modelAndView.addObject("comProfileInfo", comProfileInfo);
		modelAndView.addObject("jobOfferFileList", jobOfferFileList);
		modelAndView.addObject("joSubmitList", joSubmitList);
		modelAndView.addObject("joSubmitGenderChartsInfo", joSubmitGenderChartsInfo);
		modelAndView.addObject("joSubmitSalaryChartsInfo", joSubmitSalaryChartsInfo);
		modelAndView.addObject("joSubmitFinalAcademicChartsInfo", joSubmitFinalAcademicChartsInfo);
		modelAndView.addObject("joSubmitAgeChartsInfo", joSubmitAgeChartsInfo);
		
		modelAndView.setViewName("indvdlMember/jobOffer/jobOfferView");
		
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

	@RequestMapping("joSubmitResumeList")
	public ModelAndView joSubmitResumeList(ModelAndView modelAndView,
								   		   HttpSession session,
								   		   String jo_num) throws Exception{
		INDVDLMEMVO loginMem = (INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO");
		List<ResumeVO> joSubmitResumeList = resumeService.getResumeList(loginMem.getIndvdl_id());
		
		modelAndView.addObject("joSubmitResumeList", joSubmitResumeList);
		modelAndView.addObject("jo_num", jo_num);
		
		return modelAndView;
	}
	
	@RequestMapping("insertJoSubmit")
	public void insertJoSubmit(Map<String, String> params,
							   String resume_num,
							   String jo_num) throws Exception{
		params.put("resume_num", resume_num);
		params.put("jo_num", jo_num);
		
		joSubmitService.insertJoSubmit(params);
	}
	
	@ResponseBody
	@RequestMapping("joSubmitResumeListCheck")
	public String joSubmitResumeListCheck(String jo_num,
										  Map<String, String> params,
										  HttpSession session) throws Exception{
		
		INDVDLMEMVO loginMem = (INDVDLMEMVO)session.getAttribute("LOGIN_INDVDLMEMINFO");
		
		params.put("jo_num", jo_num);
		params.put("indvdl_id", loginMem.getIndvdl_id());
		
		int count = joSubmitService.getjoSubmitListCount(params);	
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		Map<String, String> jsonMap = new HashMap<String, String>();
		if(count > 0){
			jsonMap.put("resultFlag", "false");
		}else{
			jsonMap.put("resultFlag", "true");
		}
		
		jsonData = mapper.writeValueAsString(jsonMap);
		
		return jsonData;
	}
	
}
