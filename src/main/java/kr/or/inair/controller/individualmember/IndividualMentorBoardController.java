package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.freeboard.service.IFreeBoardService;
import kr.or.inair.mentor.service.IMentorService;
import kr.or.inair.resboard.service.IRESBoardService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.FreeboardVO;
import kr.or.inair.vo.MentorLowproVO;
import kr.or.inair.vo.MentorVO;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/mentorboard/")
public class IndividualMentorBoardController {
	
	@Autowired
	private IMentorService mentorService;
	
	@Autowired
	private RolePagingUtile paging;
	
	@RequestMapping("mentorboardHome")
	public ModelAndView mentorList(HttpSession session,
								   HttpServletRequest request,
								   ModelAndView andView,
								   String currentPage,
								   String search_keycode,
								   String search_keyword,
								   String paginationHTML,
							       Map<String,String> params) throws Exception{
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = (currentPage == null ? "1" : currentPage);
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		
		String totalCount = mentorService.totalCount(params);
		paging.makeimgPagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= paging.getPagingHtmls();
		
		List<MentorVO> popularityList = this.mentorService.mentorPopularity();
		andView.addObject("popularityList", popularityList);
		List<MentorVO> mentorList = this.mentorService.mentorList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("mentorList", mentorList);
		andView.setViewName("board/mentorboard/mentorboardHome");
		/**
		 * 
		 */
		return andView;
		
	}
	
	
	
	@RequestMapping("mentorboardView")
	public ModelAndView mentorboardView(String mentor_num,
										Map<String,String> params,
										MentorVO mentorboardInfo,
										String search_keycode,
										String search_keyword,
										String mentor_group,
										ModelAndView andView,
										String indvdl_id,
										Map<String,String> lowproParam)throws Exception{
		
		params.put("mentor_group",mentor_group);
		params.put("mentor_num", mentor_num);
		//mentor_group이랑 mentor_num을 받아서 전체 mentor_comment 갯수를 받아 mentor_commnent에 넣어주고
		//해당 게시글의 전체 댓글 갯수를 받아옴
		String mentor_comment = this.mentorService.totalComment(params);
		//전체 게시글의 댓글 갯수를 params에 넣어줌 
		params.put("mentor_comment",mentor_comment);
		//params를  매개변수로 넘겨줌 
		mentorboardInfo = this.mentorService.mentorboardInfo(params);
	
		mentorboardInfo.setMentor_comment(mentor_comment);
		lowproParam.put("indvdl_id", indvdl_id);
		
		List<MentorLowproVO> mentorLowproList = this.mentorService.mentorLowproList(lowproParam);
		String mentor_lowpro_name= "";
		for(int i=0;i<mentorLowproList.size();i++){
			mentor_lowpro_name += "#"+mentorLowproList.get(i).getLowpro_name();
		}
		
		andView.addObject("mentor_lowpro_name",mentor_lowpro_name);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("mentorboardInfo", mentorboardInfo);
		andView.addObject("mentor_comment", mentor_comment);
				
		andView.setViewName("board/mentorboard/mentorboardView");

		return andView;
	}
	
	@RequestMapping("mentorboardUpdateForm")
	public ModelAndView mentorboardUpdateForm(ModelAndView andView,
											  MentorVO mentorboardInfo) throws Exception{
	
		andView.addObject("mentorboardInfo", mentorboardInfo);
		andView.setViewName("board/mentorboard/mentorboardUpdateForm");
		return andView;
		
	}
	
	@RequestMapping("updateMentorboard")
	public String mentorboardUpdate(MentorVO mentorboardInfo,
									RedirectAttributes redirectAttributes) throws Exception{
		
		this.mentorService.updateMentorboard(mentorboardInfo);
		String unEncodingMessage = URLEncoder.encode("수정이 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    
	    return "redirect:/mentorboard/mentorboardHome.do?message=" + encodingMessage;
		
		
	}
	
	@RequestMapping("deleteMentorboard")
	public String mentorboardDelete(String mentor_num,
									Map<String,String> params) throws Exception{
		params.put("mentor_num", mentor_num);
		this.mentorService.deleteMentorboard(params);
		
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/mentorboard/mentorboardHome.do?message=" + encodingMessage;
	}
	
	@RequestMapping("mentorboardForm")
	public ModelAndView mentorboardForm(ModelAndView andView){
		
		andView.setViewName("board/mentorboard/mentorboardForm");
		return andView;
	}
	
	
	@RequestMapping("insertMentorboard")
	public String insertMentorboard(MentorVO mentorboardInfo,
								    @RequestParam("files") MultipartFile[] items,
								    String mentor_num) throws Exception{
        this.mentorService.insertMentorboard(mentorboardInfo, items);
		
		String unEncodingMessage = URLEncoder.encode("추가가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/mentorboard/mentorboardHome.do?message="+encodingMessage;
	}
	
	@RequestMapping("mentorboardDownload")
	public ModelAndView mentorboardDownload(String fileSaveName,
											String fileName,
											ModelAndView andView) throws Exception{
		andView.addObject("targetFileName", fileSaveName);
		andView.addObject("fileName", fileName);
		andView.setViewName("fileDownloadView");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("commentList")
	public ModelAndView commentList(String mentor_group,
							  		Map<String,String> params,
							  		ModelAndView andView) throws Exception{
		params.put("mentor_group", mentor_group);
		List<MentorVO> mentorList  = this.mentorService.mentorComment(params);
		
		andView.addObject("mentorList", mentorList);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("insertMentorboardReply")
	public void insertMentorboardReply(MentorVO mentorboardInfo,
								     	String mentor_num,
								     	String indvdl_id,
								     	Map<String,String> params) throws Exception{
		params.put("indvdl_id", indvdl_id);
		List<MentorLowproVO> mentorLowproList = this.mentorService.mentorLowproList(params);
		String mentor_lowpro_name= "";
		for(int i=0;i<mentorLowproList.size();i++){
			mentor_lowpro_name += "#"+mentorLowproList.get(i).getLowpro_name();
		}
		mentorboardInfo.setMentor_lowpro_name(mentor_lowpro_name);
		this.mentorService.insertMentorReply(mentorboardInfo);
	}
	
	
	@ResponseBody
	@RequestMapping("updateMentorboardComment")
	public void updateMentorboardComment(MentorVO mentorboardInfo,
									   String mentor_num) throws Exception{
		this.mentorService.updateComment(mentorboardInfo);
	}
	
	
	
	
	
	
	
	
	
}