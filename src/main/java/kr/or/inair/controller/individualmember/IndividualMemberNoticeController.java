package kr.or.inair.controller.individualmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import kr.or.inair.notice.service.INoticeService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/noticeboard/")
public class IndividualMemberNoticeController {
	@Autowired
	private INoticeService noticeService;
	
	@Autowired
	private RolePagingUtile paging;
	
	//전체 공지사항
	@RequestMapping("noticeHome")
	public ModelAndView noticeHomeList(HttpSession session,
									   HttpServletRequest request,
									   ModelAndView andView,
									   String currentPage,
									   String search_keycode,
									   String search_keyword,
									   String paginationHTML,
									   Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = noticeService.totalCount(params);
		paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= paging.getPagingHtmls();
				
		List<NoticeVO> noticeList = this.noticeService.noticeList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("noticeList", noticeList);
		andView.setViewName("board/noticeboard/noticeHome");
		
		return andView;
		
	}
	
	//개인공지사항
	@ResponseBody
	@RequestMapping("idvdlList")
	public ModelAndView idvdlList(HttpSession session,
								  HttpServletRequest request,
								  ModelAndView andView,
								  String currentPage,
								  String search_keycode,
								  String search_keyword,
								  String paginationHTML,
								  Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = noticeService.indvdlCount(params);
		paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= paging.getPagingHtmls();
				
		List<NoticeVO> noticeList = this.noticeService.indvdlNoticeList(params);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("indvdlNoticeList", noticeList);
		andView.setViewName("jsonConvertView");
		
		return andView;
		
	}
	
	   //기업회원공지사항
		@ResponseBody
		@RequestMapping("COMList")
		public ModelAndView COMList(HttpSession session,
								    HttpServletRequest request,
									ModelAndView andView,
									String currentPage,
									String search_keycode,
									String search_keyword,
									String paginationHTML,
									Map<String,String> params) throws Exception{
			
			params = CryptoGenerator.getGeneratePairKey(session);
			
			currentPage = currentPage == null ? "1" : currentPage;
			
			params.put("currentPage", currentPage);
			params.put("search_keycode", search_keycode);
			params.put("search_keyword", search_keyword);
			
			String totalCount = noticeService.COMNoticeCount(params);
			paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
			String startCount = String.valueOf(paging.getStartCount());
			String endCount = String.valueOf(paging.getEndCount());
			
			params.put("startCount", startCount);
			params.put("endCount", endCount);
			
			paginationHTML= paging.getPagingHtmls();
					
			List<NoticeVO> noticeList = this.noticeService.COMNoticeList(params);
			
			andView.addObject("search_keyword", search_keyword);
			andView.addObject("search_keycode", search_keycode);
			andView.addObject("publicKeyMap", params);
			andView.addObject("paginationHTML", paginationHTML);
			andView.addObject("COMNoticeList", noticeList);
			andView.setViewName("jsonConvertView");
			
			return andView;
			
		}
		
		//view로 이동하는 매서드 
		@RequestMapping("noticeboardTotalView")
		public ModelAndView noticeboardTotalView(String notice_num,
												 String search_keyword,
												 String search_keycode,
												 Map<String,String> params,
												 NoticeVO noticeTotalInfo,
												 ModelAndView andView) throws Exception{
			
			params.put("notice_num", notice_num);
			noticeTotalInfo  = this.noticeService.noticeInfo(params);
			andView.addObject("search_keycode", search_keycode);
			andView.addObject("search_keyword", search_keyword);
			andView.addObject("noticeTotalInfo",noticeTotalInfo);
			
			andView.setViewName("board/noticeboard/noticeboardView");
			return andView;
		}
		
		
	
	
	
	
	
}
