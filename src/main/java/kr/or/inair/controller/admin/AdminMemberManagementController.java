package kr.or.inair.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.inair.admin.companymember.service.IAdminCompanyMEMService;
import kr.or.inair.admin.individualmember.service.IAdminIndividualMemberService;
import kr.or.inair.individualmember.finalacademic.service.IFinalAcademicService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.utiles.MailSender;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.CompanyMemVO;
import kr.or.inair.vo.Final_AcademicVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/admin/memberManagement/")
@Controller
public class AdminMemberManagementController {

	@Autowired
	private IAdminIndividualMemberService individualMemberService;
	@Autowired
	private IAdminCompanyMEMService companyMemberService;
	@Autowired
	private RolePagingUtile rolePagingUtile;
	@Autowired
	private IFinalAcademicService finalAcademicService;
	@Autowired
	private IUpPROService upPROService;
	@Autowired
	private MailSender mailSender;
	@Autowired
	private IUpIndustryService upIndustryService;
	
	
	
	@RequestMapping("individualMemberHome")
	public ModelAndView individualMember(HttpServletRequest request,
										 ModelAndView modelAndView,
										 Map<String, String> params,
										 String currentPage,
										 String search_indvdl_id,
										 String search_indvdl_name,
										 String search_indvdl_mail,
										 String search_gender,
										 String search_indvdl_adres1_1,
										 String search_indvdl_adres1_2,
										 String search_fin_acdmcr_num,
										 String search_hopepro_num) throws Exception{
		//search_keyword search_keycode
		
		params.put("search_indvdl_id", search_indvdl_id);
		params.put("search_indvdl_name", search_indvdl_name);
		params.put("search_indvdl_mail", search_indvdl_mail);
		params.put("search_gender", search_gender);
		params.put("search_indvdl_adres1_1", search_indvdl_adres1_1);
		params.put("search_indvdl_adres1_2", search_indvdl_adres1_2);
		params.put("search_fin_acdmcr_num", search_fin_acdmcr_num);
		params.put("search_hopepro_num", search_hopepro_num);
		
		String totalCount = individualMemberService.getTotalCount(params);
		
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		rolePagingUtile.adminPagination(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),
										search_indvdl_id,
										search_indvdl_name,
										search_indvdl_mail,
										search_gender,
										search_indvdl_adres1_1,
										search_indvdl_adres1_2,
										search_fin_acdmcr_num,
										search_hopepro_num);
		
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<INDVDLMEMVO> indvdlMemList = individualMemberService.getINDVDLMemList(params);
		String pagingHtmls = rolePagingUtile.getPagingHtmls();
		modelAndView.addObject("indvdlMemList", indvdlMemList);
		modelAndView.addObject("pagingHtmls", pagingHtmls);
		
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("upPROList", upPROList);
		
		modelAndView.setViewName("admin/member/individualMember");
		
		return modelAndView;
	}
	
	@RequestMapping("individualMemberViewForm")
	public ModelAndView individualMemberViewForm(HttpServletRequest request,
												 ModelAndView modelAndView,
												 Map<String, String> params,
												 String currentPage,
												 String indvdl_id) throws Exception{
		
		INDVDLMEMVO indvdlMemberInfo = individualMemberService.getINDVDLMEMInfo(indvdl_id);
		
		modelAndView.addObject("indvdlMemberInfo", indvdlMemberInfo);
		modelAndView.setViewName("admin/member/individualMemberViewForm");
		
		return modelAndView;
	}
	
	@RequestMapping("individualDeleteMemberViewForm")
	public ModelAndView individualDeleteMemberViewForm(HttpServletRequest request,
												       ModelAndView modelAndView,
												       Map<String, String> params,
												       String currentPage,
												       String indvdl_id) throws Exception{
		
		INDVDLMEMVO indvdlMemberInfo = individualMemberService.getINDVDLMEMInfo(indvdl_id);
		
		modelAndView.addObject("indvdlMemberInfo", indvdlMemberInfo);
		modelAndView.setViewName("admin/member/individualDeleteMemberViewForm");
		
		return modelAndView;
	}
	
	@RequestMapping("individualDeleteMember")
	public ModelAndView individualDeleteMember(HttpServletRequest request,
											   ModelAndView modelAndView,
											   Map<String, String> params,
											   String currentPage,
											   String search_indvdl_id,
											   String search_indvdl_name,
											   String search_indvdl_mail,
											   String search_gender,
											   String search_indvdl_adres1_1,
											   String search_indvdl_adres1_2,
											   String search_fin_acdmcr_num,
											   String search_hopepro_num) throws Exception{
		
		params.put("search_indvdl_id", search_indvdl_id);
		params.put("search_indvdl_name", search_indvdl_name);
		params.put("search_indvdl_mail", search_indvdl_mail);
		params.put("search_gender", search_gender);
		params.put("search_indvdl_adres1_1", search_indvdl_adres1_1);
		params.put("search_indvdl_adres1_2", search_indvdl_adres1_2);
		params.put("search_fin_acdmcr_num", search_fin_acdmcr_num);
		params.put("search_hopepro_num", search_hopepro_num);
		
		String totalCount = individualMemberService.getDeleteINDVDLMEMTotalCount(params);
		
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		rolePagingUtile.adminPagination(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),
										search_indvdl_id,
										search_indvdl_name,
										search_indvdl_mail,
										search_gender,
										search_indvdl_adres1_1,
										search_indvdl_adres1_2,
										search_fin_acdmcr_num,
										search_hopepro_num);
		
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<INDVDLMEMVO> indvdlMemList = individualMemberService.getDelteINDVDLMemList(params);
		String pagingHtmls = rolePagingUtile.getPagingHtmls();
		modelAndView.addObject("indvdlMemList", indvdlMemList);
		modelAndView.addObject("pagingHtmls", pagingHtmls);
		
		List<Final_AcademicVO> finalAcademicList = finalAcademicService.getFinalAcademicList();
		List<UpProVO> upPROList = upPROService.getUpPROList();
		
		modelAndView.addObject("finalAcademicList", finalAcademicList);
		modelAndView.addObject("upPROList", upPROList);
		
		modelAndView.setViewName("admin/member/individualDeleteMember");
		
		return modelAndView;
	}
	
	@RequestMapping("sendEmailForm")
	public ModelAndView sendEmailForm(ModelAndView modelAndView,
							   String ids, String names, String emails){
		modelAndView.addObject("ids", ids);
		modelAndView.addObject("names", names);
		modelAndView.addObject("emails", emails);
		
		modelAndView.setViewName("admin/sendEmailForm");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("sendEmails")
	public void sendEmails(String TMPemails, String emailContent) throws Exception{
		String[] emailList = TMPemails.split(",");
		for(int i = 0; i < emailList.length; i++){
			mailSender.mailSender(emailList[i], "[inAIR] inAIR 안내 메일입니다.", emailContent);
		}
	}
	
	@RequestMapping("companyMemberHome")
	public ModelAndView companyMemberHome(HttpServletRequest request,
									      ModelAndView modelAndView,
									      Map<String, String> params,
									      String currentPage,
									      String search_com_id,
									      String search_corp_name,
									      String search_ceo_nm,
									      String search_com_mail,
									      String search_bizr_no,
									      String search_addr1,
									      String search_addr2,
									      String lwinduty_num) throws Exception{
		
		params.put("search_com_id", search_com_id);
		params.put("search_corp_name", search_corp_name);
		params.put("search_ceo_nm", search_ceo_nm);
		params.put("search_com_mail", search_com_mail);
		params.put("search_bizr_no", search_bizr_no);
		params.put("search_addr1", search_addr1);
		params.put("search_addr2", search_addr2);
		params.put("lwinduty_num", lwinduty_num);
		
		String totalCount = companyMemberService.getTotalCount(params);
		
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		rolePagingUtile.adminCompanyMemPagination(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),
												  search_com_id,
											      search_corp_name,
											      search_ceo_nm,
											      search_com_mail,
											      search_bizr_no,
											      search_addr1,
											      search_addr2,
											      lwinduty_num);
		
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<CompanyMemVO> companyMemList = companyMemberService.getCompanyMemList(params);
		String pagingHtmls = rolePagingUtile.getPagingHtmls();
		modelAndView.addObject("companyMemList", companyMemList);
		modelAndView.addObject("pagingHtmls", pagingHtmls);
		
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		modelAndView.addObject("upIndustryList", upIndustryList);
		
		modelAndView.setViewName("admin/member/companyMemberList");
		
		return modelAndView;
	}
	
	@RequestMapping("companyDeleteMemberList")
	public ModelAndView companyDeleteMemberList(HttpServletRequest request,
										        ModelAndView modelAndView,
										        Map<String, String> params,
										        String currentPage,
										        String search_com_id,
										        String search_corp_name,
										        String search_ceo_nm,
										        String search_com_mail,
										        String search_bizr_no,
										        String search_addr1,
										        String search_addr2,
										        String lwinduty_num) throws Exception{
		
		params.put("search_com_id", search_com_id);
		params.put("search_corp_name", search_corp_name);
		params.put("search_ceo_nm", search_ceo_nm);
		params.put("search_com_mail", search_com_mail);
		params.put("search_bizr_no", search_bizr_no);
		params.put("search_addr1", search_addr1);
		params.put("search_addr2", search_addr2);
		params.put("lwinduty_num", lwinduty_num);
		
		String totalCount = companyMemberService.getDeleteCompanyMemberTotalCount(params);
		
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		rolePagingUtile.adminCompanyMemPagination(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),
												  search_com_id,
											      search_corp_name,
											      search_ceo_nm,
											      search_com_mail,
											      search_bizr_no,
											      search_addr1,
											      search_addr2,
											      lwinduty_num);
		
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<CompanyMemVO> companyMemList = companyMemberService.getDeleteCompanyMemList(params);
		
		String pagingHtmls = rolePagingUtile.getPagingHtmls();
		modelAndView.addObject("companyMemList", companyMemList);
		modelAndView.addObject("pagingHtmls", pagingHtmls);
		
		List<UpIndustryVO> upIndustryList = upIndustryService.getUpIndustryList();
		modelAndView.addObject("upIndustryList", upIndustryList);
		
		modelAndView.setViewName("admin/member/companyDeleteMemberList");
		
		return modelAndView;
	}
	
	@RequestMapping("companyMemberView")
	public ModelAndView companyMemberView(HttpServletRequest request,
										  ModelAndView modelAndView,
										  Map<String, String> params,
										  String currentPage,
										  String com_id,
										  CompanyMemVO companyMemInfo) throws Exception{
		companyMemInfo = companyMemberService.getCompanyMemberInfo(com_id);
		
		modelAndView.addObject("companyMemInfo", companyMemInfo);
		
		modelAndView.setViewName("admin/member/companyMemberView");
		
		return modelAndView;
	}
	
	@RequestMapping("comMemberViewForm")
	public ModelAndView comMemberViewForm(HttpServletRequest request,
										  ModelAndView modelAndView,
										  Map<String, String> params,
										  String currentPage,
										  String com_id) throws Exception{

		CompanyMemVO companyMemInfo = companyMemberService.getCompanyMemberInfo(com_id);
		
		modelAndView.addObject("companyMemInfo", companyMemInfo);
		modelAndView.setViewName("admin/member/companyMemberView");
		
		return modelAndView;
	}
	
	@RequestMapping("comMemberDeleteViewForm")
	public ModelAndView comMemberDeleteViewForm(HttpServletRequest request,
												ModelAndView modelAndView,
												Map<String, String> params,
												String currentPage,
												String com_id) throws Exception{
		
		CompanyMemVO companyMemInfo = companyMemberService.getCompanyMemberInfo(com_id);
		
		modelAndView.addObject("companyMemInfo", companyMemInfo);
		modelAndView.setViewName("admin/member/companyDeleteMemberView");
		
		return modelAndView;
	}
}