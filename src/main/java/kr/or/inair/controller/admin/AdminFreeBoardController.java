package kr.or.inair.controller.admin;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.freeboard.service.IFreeBoardService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.FreeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/freeboard/")
public class AdminFreeBoardController {
	@Autowired
	private IFreeBoardService freeBoardService;
	
	@Autowired
	private RolePagingUtile rolePagingUtile;

	
	@RequestMapping("adminFreeboardHome")
	public ModelAndView adminFreeboardHome(HttpSession session,
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
		
		
		String totalCount = freeBoardService.totalCount(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= rolePagingUtile.getPagingHtmls();
		
		
		List<FreeboardVO> freeboardList = this.freeBoardService.freeboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("freeboardList", freeboardList);
		
		andView.setViewName("admin/freeboard/adminFreeboardHome");
		return andView;
	}

	@RequestMapping("freeboardView")
	public ModelAndView freeboardView(String freeboard_num,
									  String rnum,
									  Map<String, String> params,
									  FreeboardVO freeboardInfo,
									  String search_keycode,
									  String search_keyword,
									  ModelAndView andView,
									  String freeboard_group,
									  Map<String,String> commentparams,
									  HttpSession session)throws Exception{

		params.put("freeboard_num", freeboard_num);
		freeboardInfo = this.freeBoardService.freeboardInfo(params);	
		commentparams.put("freeboard_group", freeboard_group);
		List<FreeboardVO> freeboardComList = this.freeBoardService.freeboardComment(commentparams);
		
		
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("freeboardInfo", freeboardInfo);
		andView.addObject("freeboardComList", freeboardComList);
		
		andView.setViewName("admin/freeboard/adminFreeboardView");

		return andView;

	}
	
	@RequestMapping("deleteFreeboard")
	public String deleteFreeboard(String freeboard_num,
			  					  Map<String,String> params) throws Exception{

		params.put("freeboard_num", freeboard_num);
		this.freeBoardService.deleteFreeboardInfo(params);
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
		String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		
		return "redirect:/admin/freeboard/adminFreeboardHome.do?message=" + encodingMessage;

	}
	
	@ResponseBody
	@RequestMapping("deleteFreeboardComment")
	public void deleteFreeboardComment(String freeboard_num,
									   Map<String, String> params) throws Exception{
		params.put("freeboard_num", freeboard_num);
		this.freeBoardService.deleteFreeboardInfo(params);

	}
	
	
	
	
	
}
