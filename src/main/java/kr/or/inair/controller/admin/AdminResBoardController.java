package kr.or.inair.controller.admin;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.resboard.service.IRESBoardService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.ResboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/resboard/")
public class AdminResBoardController {
	@Autowired
	private IRESBoardService iresAdminService;
	
	@Autowired
	private RolePagingUtile rolePagingUtile;

	
	@RequestMapping("adminResboardHome")
	public ModelAndView adminResboardHome(HttpSession session,
										   HttpServletRequest request,
										   ModelAndView andView,
										   String currentPage,
										   String search_keycode,
										   String search_keyword,
										   String paginationHTML,
										   Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" :currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		
		String totalCount = iresAdminService.totalCount(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= rolePagingUtile.getPagingHtmls();
		
		
		List<ResboardVO> resboardList = this.iresAdminService.resboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("resboardList", resboardList);
		
		andView.setViewName("admin/resboard/adminResboardHome");
		return andView;
	}
	
	@RequestMapping("resboardView")
	public ModelAndView resboardView(String res_num
									,String rnum
									,Map<String, String> params
									,ResboardVO resboardInfo
									,String search_keycode
									,String search_keyword
									,String res_group
									,ModelAndView andView
									,Map<String, String> commentParams
									,HttpSession session) throws Exception{
		params.put("res_num", res_num);
		resboardInfo = this.iresAdminService.resboardInfo(params);

		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("resboardInfo", resboardInfo);
		
		andView.setViewName("admin/resboard/adminResboardView");

		return andView;
	}
	
	@RequestMapping("deleteResboard")
	public String deleteResboard(String res_num
									  ,Map<String, String> params) throws Exception{
		params.put("res_num", res_num);
		this.iresAdminService.deleteResboard(params);
		
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		
		return "redirect:/admin/resboard/adminResboardHome.do?message="+ encodingMessage;
	}
	
	
	

	
	
	
	
	
}
