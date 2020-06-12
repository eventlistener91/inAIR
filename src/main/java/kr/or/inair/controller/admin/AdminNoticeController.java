package kr.or.inair.controller.admin;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.notice.service.INoticeService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.MentorVO;
import kr.or.inair.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/noticeboard/")
public class AdminNoticeController {
	@Autowired
	private INoticeService noticeBoardService;
	
	@Autowired
	private RolePagingUtile rolePagingUtile;
	
	@RequestMapping("adminNoticeboardHome")
	public ModelAndView adminNoticeboardHome(HttpSession session,
											 HttpServletRequest request,
											 ModelAndView andView,
											 String currentPage,
											 String search_keycode,
											 String search_keyword,
											 String search_group,
											 String paginationHTML,
											 Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		if(search_group != null){
		String searchgroup = search_group.replace(",","");
		params.put("search_group",searchgroup);
		}
		String adminTotalCount = noticeBoardService.totalNoticeCount(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(adminTotalCount), Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= rolePagingUtile.getPagingHtmls();
		
		List<NoticeVO> noticeboardList = this.noticeBoardService.noticeboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_group", search_group);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("noticeboardList", noticeboardList);
		
		andView.setViewName("admin/noticeboard/adminNoticeboardHome");
		return andView;
	}
	
	@RequestMapping("adminNoticeboardForm")
	public ModelAndView adminNoticeboardForm(ModelAndView andView) throws Exception{

		andView.setViewName("admin/noticeboard/adminNoticeboardForm");
		return andView;
	}
	
	@RequestMapping("insertNoticeboard")
	public String insertNotceboard(String group_select
								  ,String kind_select
								  ,NoticeVO noticeInsertInfo
								  ,ModelAndView andView) throws Exception{
		
		noticeInsertInfo.setNotice_group(group_select);
		noticeInsertInfo.setNotice_kind(kind_select);
		this.noticeBoardService.insertNoticeInfo(noticeInsertInfo);
	
			
		String unEncodingMessage = URLEncoder.encode("추가가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/admin/noticeboard/adminNoticeboardHome.do?message="+encodingMessage;
	}
	
	@RequestMapping("noticeboardView")
	public ModelAndView noticeBoardView(String notice_num
								       ,String rnum
								       ,String search_keycode
								       ,String search_keyword
								       ,ModelAndView andView
								       ,Map<String, String> params
								       ,NoticeVO noticeTotalInfo) throws Exception{
		
		params.put("notice_num", notice_num);
		noticeTotalInfo  = this.noticeBoardService.noticeInfo(params);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("noticeTotalInfo",noticeTotalInfo);
		
		
		andView.setViewName("admin/noticeboard/adminNoticeboardView");
		return andView;
		
	}
	@RequestMapping("noticeUpdateForm")
	public ModelAndView noticeUpdateForm(NoticeVO noticeTotalInfo
										,String notice_num
										,ModelAndView andView
										,Map<String,String> params
										) throws Exception{
		
		params.put("notice_num", notice_num);
		noticeTotalInfo = this.noticeBoardService.noticeInfo(params);
		andView.addObject("noticeTotalInfo", noticeTotalInfo);
		andView.setViewName("admin/noticeboard/adminNoticeboardUpdateform");
		return andView;
	}
	

	@RequestMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeUPdateInfo
							   ,String group_select
							   ,String kind_select) throws Exception{
		noticeUPdateInfo.setNotice_group(group_select);
		noticeUPdateInfo.setNotice_kind(kind_select);
		
		this.noticeBoardService.updateNoticeInfo(noticeUPdateInfo);
		
		String unEncodingMessage = URLEncoder.encode("수정이 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/admin/noticeboard/adminNoticeboardHome.do?message="+encodingMessage;
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(String notice_num
							  ,Map<String,String> params) throws Exception{
		params.put("notice_num", notice_num);
		this.noticeBoardService.deleteNotice(params);
		
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    return "redirect:/admin/noticeboard/adminNoticeboardHome.do?message="+encodingMessage;
		
	}
	



}
