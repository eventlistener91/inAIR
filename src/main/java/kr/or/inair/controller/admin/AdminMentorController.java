package kr.or.inair.controller.admin;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.mentor.service.IMentorService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.MentorVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/mentorboard/")
public class AdminMentorController {
	@Autowired
	private IMentorService noticeService;
	
	@Autowired
	private RolePagingUtile rolePagingUtile;
	
	@RequestMapping("adminMentorboardHome")
	public ModelAndView adminMentorboardHome(HttpSession session
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
		
		String totalCount = noticeService.totalCount(params);
		rolePagingUtile.adminBoardPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(rolePagingUtile.getStartCount());
		String endCount = String.valueOf(rolePagingUtile.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = rolePagingUtile.getPagingHtmls();
		
		List<MentorVO> mentorboardList = this.noticeService.mentorList(params);
		andView.addObject("search_keyword",search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("mentorboardList", mentorboardList);
		
		andView.setViewName("admin/mentorboard/adminMentorboardHome");
		return andView;
		
	}
	
	@RequestMapping("adminMentorboardview")
	public ModelAndView adminMentorboardView(String mentor_num
											,String search_keycode
											,String search_keyword
											,String mentor_group
											,ModelAndView andView
											,MentorVO mentorInfo
											,Map<String,String> params) throws Exception{
		params.put("mentor_num", mentor_num);
		params.put("mentor_group", mentor_group);
		String mentorgroup=this.noticeService.totalComment(params);
		params.put("mentor_comment", mentorgroup);
		mentorInfo = this.noticeService.mentorboardInfo(params);
		
		mentorInfo.setMentor_comment(mentorgroup);
		andView.addObject("mentorInfo", mentorInfo);
		andView.setViewName("admin/mentorboard/adminMentorboardView");
		return andView;
	}
	
	@RequestMapping("adminDeleteboard")
	public String adminDeleteboardView(String mentor_num
									,Map<String,String> params) throws Exception{

		params.put("mentor_num", mentor_num);
		this.noticeService.deleteMentorboard(params);
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/admin/mentorboard/adminMentorboardHome.do?message="+encodingMessage;
	}
	
	@ResponseBody
	@RequestMapping("adminDeleteComment")
	public void adminDeleteComment(String mentor_num
									,Map<String, String> params) throws Exception{
		
		params.put("mentor_num", mentor_num);
		this.noticeService.deleteMentorboard(params);
	}
	
	
	
	
	
	
	
	

}
