package kr.or.inair.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.admin.itemmanagement.service.ItemManagementService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.INDVDL_DropVO;
import kr.or.inair.vo.LanguageVO;




import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.pattern.color.CyanCompositeConverter;

//항목관리 페이지
@Controller
@RequestMapping("/admin/ItemManagement/")
public class AdminItemManagementController {
	
	@Autowired
	private ItemManagementService itemManagementService;
	
	@Autowired
	private RolePagingUtile rolePagingUtile;
	
	//언어항목
	@RequestMapping("itemManagementHome")
	public ModelAndView itemManagementHome(HttpSession session
										  ,HttpServletRequest request
										  ,ModelAndView andView
										  ,String currentPage
										  ,String search_keycode
										  ,String search_keyword
										  ,String paginationHTML
										  ,Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" :currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		//언어
		String totalCount = itemManagementService.totalCount(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
	
		
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = rolePagingUtile.getPagingHtmls();
		
		List<LanguageVO> languageList = this.itemManagementService.adminLanguageList(params);
		andView.addObject("search_keyword",search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("languageList", languageList);
		andView.setViewName("admin/ItemManagement/itemManagementHome");
		return andView;
	}
	//급여항목
	@RequestMapping("itemSalaryManagement")
	public ModelAndView salaryItemManageHome(HttpSession session
											,HttpServletRequest request
											,ModelAndView andView
											,String currentPage
											,String search_keycode
											,String search_keyword
											,String paginationHTML
											,Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		currentPage = currentPage == null ? "1" :currentPage;
		params.put("currentPage", currentPage);

		//언어
		String totalCount = itemManagementService.getAdminTotalCount();
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = rolePagingUtile.getPagingHtmls();
		
		List<SalaryVO> salaryList = this.itemManagementService.salaryList(params);

		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("salaryList", salaryList);

		andView.setViewName("admin/ItemManagement/salaryItemManagementHome");
		return andView;
	}

	//언어항목 추가 
	@ResponseBody
	@RequestMapping("insertLang")
	public void insertLang(LanguageVO languageInfo) throws Exception{
		this.itemManagementService.insertLanguage(languageInfo);
	}
	
	//언어항목 삭제 
	@ResponseBody
	@RequestMapping("deleteLang")
	public void deleteLang(Map<String, String> params
						  ,String lang_num) throws Exception{
		params.put("lang_num", lang_num);
		this.itemManagementService.deleteLanguage(params);
		
	}
	
	//급여항목 추가 
	@ResponseBody
	@RequestMapping("insertSalary")
	public void insertSalary(SalaryVO salaryInfo) throws Exception{
		this.itemManagementService.insertSalary(salaryInfo);
		
	}
	//급여항목 삭제 
	@ResponseBody
	@RequestMapping("deleteSalary")
	public void deleteSalary(Map<String, String> params
							,String salary_num) throws Exception{
		params.put("salary_num", salary_num);
		this.itemManagementService.deleteSalary(params);
	}
	
	//직급항목
	@RequestMapping("itemClsfManagement")
	public ModelAndView classOfPositionHome(HttpSession session
											,HttpServletRequest request
											,ModelAndView andView
											,String currentPage
											,String search_keycode
											,String search_keyword
											,String paginationHTML
											,Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		currentPage = currentPage == null ? "1" :currentPage;
		params.put("currentPage", currentPage);

		//직급항목
		String totalCount = itemManagementService.clsfTotal(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = rolePagingUtile.getPagingHtmls();
		
		List<ClassOfPositionVO> clsfList = this.itemManagementService.classOfPositionList(params);

		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("clsfList", clsfList);

		andView.setViewName("admin/ItemManagement/classOfPositionHome");
		return andView;
	}
	//직급항목 추가 
	@ResponseBody
	@RequestMapping("insertClsf")
	public void insertClsf(ClassOfPositionVO clsfInfo) throws Exception{
		this.itemManagementService.insertClsf(clsfInfo);
	}
	//직급항목 삭제
	@ResponseBody
	@RequestMapping("deleteClsf")
	public void deleteClsf(Map<String, String> params
						  ,String clsf_num) throws Exception{
		params.put("clsf_num", clsf_num);
		this.itemManagementService.deleteClsf(params);
		
	}
	
	//상위직종
	@RequestMapping("itemUpProManagement")
	public ModelAndView upproItemManagementHome(HttpSession session
												,HttpServletRequest request
												,ModelAndView andView
												,String currentPage
												,String search_keycode
												,String search_keyword
												,String paginationHTML
												,Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		currentPage = currentPage == null ? "1" :currentPage;
		params.put("currentPage", currentPage);

		//상위직종
		String totalCount = itemManagementService.totalUpPRO(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = rolePagingUtile.getPagingHtmls();
		
		List<UpProVO> UpProList = this.itemManagementService.UpProList(params);

		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("UpProList", UpProList);

		andView.setViewName("admin/ItemManagement/upproItemManagementHome");
		return andView;
	}
	
	//상위직종 추가 
	@ResponseBody
	@RequestMapping("insertUppro")
	public void insertUppro(UpProVO upProInfo) throws Exception{
		
		this.itemManagementService.insertUpPRO(upProInfo);
		
	}
	
	//상위직종 삭제
	@ResponseBody
	@RequestMapping("deleteUppro")
	public void deleteUppro(Map<String, String> params
							,String uppro_num) throws Exception{
		
		params.put("uppro_num", uppro_num);
		this.itemManagementService.deleteUpPRO(params);
	}
	
	//하위직종
	@ResponseBody
	@RequestMapping("lowProList")
	public ModelAndView lowProList(String uppro_num,
								   Map<String,String> params,
								   ModelAndView andView) throws Exception{
		params.put("uppro_num", uppro_num);
		List<LowProVO> lowPROList = this.itemManagementService.AdminlowPROList(params);
		
		andView.addObject("lowPROList", lowPROList);
		andView.setViewName("jsonConvertView");

		return andView;
	}
	
	//하위직종 추가
	@ResponseBody
	@RequestMapping("insertLowPro")
	public void insertLowPro(LowProVO lowProInfo) throws Exception{
		
		this.itemManagementService.insertLowPRO(lowProInfo);
	}
	
	//하위직종 삭제
	@ResponseBody
	@RequestMapping("deleteLowPro")
	public void deleteLowPro(Map<String, String> params,
							  String lowpro_num) throws Exception{
		params.put("lowpro_num", lowpro_num);
		this.itemManagementService.deleteLowPRO(params);
	}
	
	
	//상위업종
		@RequestMapping("inDustyItemManagement")
		public ModelAndView inDustyItemManagementHome(HttpSession session
													,HttpServletRequest request
													,ModelAndView andView
													,String currentPage
													,String search_keycode
													,String search_keyword
													,String paginationHTML
													,Map<String,String> params) throws Exception{
			
			params = CryptoGenerator.getGeneratePairKey(session);
			currentPage = currentPage == null ? "1" :currentPage;
			params.put("currentPage", currentPage);

			//상위업종
			String totalCount = itemManagementService.totalUpIndustry(params);
			rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
			String startCount = String.valueOf(rolePagingUtile.getStartCount());
			String endCount = String.valueOf(rolePagingUtile.getEndCount());
			
			params.put("startCount", startCount);
			params.put("endCount", endCount);
			
			paginationHTML = rolePagingUtile.getPagingHtmls();
			
			List<UpIndustryVO> UpIndustyList = this.itemManagementService.UpIndustryList(params);

			andView.addObject("publicKeyMap", params);
			andView.addObject("paginationHTML", paginationHTML);
			andView.addObject("UpIndustyList", UpIndustyList);

			andView.setViewName("admin/ItemManagement/InDustyItemManagementHome");
			return andView;
		}
	
		//상위업종 추가 
		@ResponseBody
		@RequestMapping("insertIUpIndusty")
		public void insertIUpIndusty(UpIndustryVO upindustryInfo) throws Exception{
			this.itemManagementService.insertUpIndustry(upindustryInfo);
		}
		
		//상위업종 삭제 
		@ResponseBody
		@RequestMapping("DeleteUpIndusty")
		public void DeleteUpIndusty(Map<String, String> params
								    ,String upinduty_num) throws Exception{
			params.put("upinduty_num", upinduty_num);
			this.itemManagementService.deleteUpIndustry(params);
			
			
		}
		//하위업종 리스트 출력
		//하위직종
		@ResponseBody
		@RequestMapping("lowIndustList")
		public ModelAndView lowIndustList(String upinduty_num,
				                          Map<String,String> params,
									      ModelAndView andView) throws Exception{
			params.put("upinduty_num", upinduty_num);
			List<LowIndustryVO> lowIndustyList = this.itemManagementService.AdminLowIndustryList(params);
			
			andView.addObject("lowIndustyList", lowIndustyList);
			andView.setViewName("jsonConvertView");

			return andView;
		}
		
		//하위직종 추가 
		@ResponseBody
		@RequestMapping("insertLowInduty")
		public void insertLowInduty(LowIndustryVO lowindustryInfo) throws Exception{
			this.itemManagementService.insertLowIndustry(lowindustryInfo);
			
		}
		
		//하위직종 삭제
		@ResponseBody
		@RequestMapping("deletelwindusty")
		public void deletelwindusty(Map<String, String> params
									,String lwinduty_num) throws Exception{
			params.put("lwinduty_num", lwinduty_num);
			this.itemManagementService.deleteLowIndustry(params);
			
		}
		
		
		//탈퇴회원 리스트 출력 
		@RequestMapping("IndvdlDropManagement")
		public ModelAndView IndvdlDropManagementtHome(HttpSession session
													,HttpServletRequest request
													,ModelAndView andView
													,String currentPage
													,String search_keycode
													,String search_keyword
													,String paginationHTML
													,Map<String,String> params) throws Exception{
			
			params = CryptoGenerator.getGeneratePairKey(session);
			currentPage = currentPage == null ? "1" :currentPage;
			params.put("currentPage", currentPage);

			//상위업종
			String totalCount = itemManagementService.indvdlDropTotalCount(params);
			rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
			String startCount = String.valueOf(rolePagingUtile.getStartCount());
			String endCount = String.valueOf(rolePagingUtile.getEndCount());
			
			params.put("startCount", startCount);
			params.put("endCount", endCount);
			
			paginationHTML = rolePagingUtile.getPagingHtmls();
			
			List<INDVDL_DropVO> IndvdlDropList = this.itemManagementService.IndvdlDropList(params);

			andView.addObject("publicKeyMap", params);
			andView.addObject("paginationHTML", paginationHTML);
			andView.addObject("IndvdlDropList", IndvdlDropList);

			andView.setViewName("admin/ItemManagement/IndvdlDropManagementHome");
			return andView;
		}
		
		//탈퇴항목 추가
		@ResponseBody
		@RequestMapping("insertIndvdlDrop")
		public void insertIndvdlDrop(INDVDL_DropVO indvdlDropInfo) throws Exception{
			this.itemManagementService.insertIndvdlDrop(indvdlDropInfo);
			
		}
		
		//탈퇴항목 삭제
		@ResponseBody
		@RequestMapping("deleteIndvdlDrop")
		public void deleteIndvdlDrop(Map<String, String> params,
									String indvdl_secsn_num) throws Exception{
			
			params.put("indvdl_secsn_num", indvdl_secsn_num);
			this.itemManagementService.deleteIndvdlDrop(params);
		}
		
		//고용형태 리스트 출력 
		@RequestMapping("employList")
		public ModelAndView employList(HttpSession session
										,HttpServletRequest request
										,ModelAndView andView
										,String currentPage
										,String search_keycode
										,String search_keyword
										,String paginationHTML
										,Map<String,String> params) throws Exception{
			params = CryptoGenerator.getGeneratePairKey(session);
			currentPage = currentPage == null? "1" : currentPage;
			params.put("currentPage", currentPage);
			
			String adminEmployTotalCount = itemManagementService.adminEmployTotalCount();
			rolePagingUtile.adminBoardPagination(request, Integer.parseInt(adminEmployTotalCount), Integer.parseInt(currentPage), search_keyword, search_keycode);
			String startCount = String.valueOf(rolePagingUtile.getStartCount());
			String endCount = String.valueOf(rolePagingUtile.getEndCount());
			
			params.put("startCount", startCount);
			params.put("endCount", endCount);
			
			paginationHTML = rolePagingUtile.getPagingHtmls();
			List<EmploymentVO> employmentList = itemManagementService.adminEmploymentList(params);
			
			andView.addObject("publicKeyMap", params);
			andView.addObject("paginationHTML", paginationHTML);
			andView.addObject("employmentList", employmentList);

			andView.setViewName("admin/ItemManagement/EmploymentManagementHome");
			return andView;

		}
		
		@ResponseBody
		@RequestMapping("insertEmployment")
		public void insertEmployment(EmploymentVO employmentInfo) throws Exception{
			this.itemManagementService.insertEmploy(employmentInfo);
		}
		
		@ResponseBody
		@RequestMapping("deleteEmplym")
		public void deleteEmplym(Map<String, String> params,
										  String emplym_num) throws Exception{
			params.put("emplym_num", emplym_num);
			this.itemManagementService.deleteEmploy(params);
		}
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
}
