package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.freeboard.service.IFreeBoardService;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.FreeboardVO;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/freeboard/")
public class IndividualMemberFreeBoardController {
	@Autowired
	private IFreeBoardService freeBoardService;
	
	@Autowired
	private RolePagingUtile paging;
	
	
	@RequestMapping("freeboardHome")
	public ModelAndView freeboardList(HttpSession session,
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
		paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML= paging.getPagingHtmls();
		
		
		List<FreeboardVO> freeboardList = this.freeBoardService.freeboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("freeboardList", freeboardList);
		andView.setViewName("board/freeboard/freeboardHome");
		/**
		 * 
		 */
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
									  Map<String,String> commentparams)throws Exception{
		
		params.put("freeboard_num", freeboard_num);
		freeboardInfo = this.freeBoardService.freeboardInfo(params);	
		commentparams.put("freeboard_group", freeboard_group);
		List<FreeboardVO> freeboardComList = this.freeBoardService.freeboardComment(commentparams);
		
		
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("freeboardInfo", freeboardInfo);
		andView.addObject("freeboardComList", freeboardComList);
		
		andView.setViewName("board/freeboard/freeboardView");
		
		return andView;
		
	}
	
	@RequestMapping("freeboardUpdateForm")
	public ModelAndView freeboardUpdateForm(ModelAndView andView,
											FreeboardVO freeboardInfo) throws Exception{
	
		andView.addObject("freeboardInfo", freeboardInfo);
		andView.setViewName("board/freeboard/freeboardUpdateForm");
		
		return andView;
		
	}
	@RequestMapping("updateFreeboard")
	public String freeboardUpdate(FreeboardVO freeboardInfo,
								  RedirectAttributes redirectAttributes) throws Exception{
		
		this.freeBoardService.updateFreeboardInfo(freeboardInfo);	
		String unEncodingMessage = URLEncoder.encode("수정이 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	   
	    return "redirect:/freeboard/freeboardHome.do?message=" + encodingMessage;
		
		
	}
	
	@RequestMapping("deleteFreeboard")
	public String deleteFreeboard(String freeboard_num,
								  Map<String,String> params) throws Exception{
		
		params.put("freeboard_num", freeboard_num);
		this.freeBoardService.deleteFreeboardInfo(params);
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    
	    return "redirect:/freeboard/freeboardHome.do?message=" + encodingMessage;
		
	}
	
	@ResponseBody
	@RequestMapping("deleteFreeboardComment")
	public void deleteFreeboardComment(String freeboard_num,
									   Map<String, String> params) throws Exception{
		
		params.put("freeboard_num", freeboard_num);
		this.freeBoardService.deleteFreeboardInfo(params);

	}
	
	
	
	
	@RequestMapping("freeboardForm")
	public ModelAndView freeboardForm(ModelAndView andView){
		andView.setViewName("board/freeboard/freeboardForm");	
		
		return andView;
	}
	
	@RequestMapping("insertFreeboard")
	public String insertFreeboard(FreeboardVO freeboardInfo,
								  @RequestParam("files") MultipartFile[] items,
								  String freeboard_num) throws Exception{
		this.freeBoardService.insertFreeboardInfo(freeboardInfo, items);
		
		String unEncodingMessage = URLEncoder.encode("추가가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
		return "redirect:/freeboard/freeboardHome.do?message="+encodingMessage;
	}
	
	@RequestMapping("freeboardDownload")
	public ModelAndView freeboardDownload(String fileSaveName,
										  String fileName,
									      ModelAndView andView) throws Exception{
		andView.addObject("targetFileName", fileSaveName);
		andView.addObject("fileName", fileName);
		andView.setViewName("fileDownloadView");
		
		return andView;
		
	}

	
	@ResponseBody
	@RequestMapping("insertFreeboardReply")
	public void insertFreeboardReply(FreeboardVO freeboardInfo,
								     String freeboard_num,
								     String indvdl_id) throws Exception{

		this.freeBoardService.insertFreeboardReply(freeboardInfo);

	}
	
	@ResponseBody
	@RequestMapping("updateFreeboardComment")
	public void updateFreeboardComment(FreeboardVO freeboardInfo,
								       String freeboard_num) throws Exception{

		this.freeBoardService.updateComment(freeboardInfo);

	}

	@ResponseBody
	@RequestMapping("commentlist")
	public String commentlist(String freeboard_num,
						      String indvdl_id,
						      String freeboard_group,
							  Map<String, String> tmpMap) throws Exception{

		tmpMap.put("freeboard_group",freeboard_group);
		
		List<FreeboardVO> freeboardList = freeBoardService.freeboardComment(tmpMap);

		List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
		
		for (int i = 0; i < freeboardList.size(); i++) {
			Map<String, String> params = new HashMap<String, String>();
			params.put("indvdl_id", freeboardList.get(i).getIndvdl_id());
			params.put("freeboard_num", freeboardList.get(i).getFreeboard_num());
			params.put("rnum",freeboardList.get(i).getRnum());
			params.put("freeboard_cn", freeboardList.get(i).getFreeboard_cn());
			params.put("freeboard_depth", freeboardList.get(i).getFreeboard_depth());
			params.put("freeboard_group", freeboardList.get(i).getFreeboard_group());
			params.put("freeboard_sn", freeboardList.get(i).getFreeboard_sn());
			
			listMap.add(params);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(listMap);
		
		return jsonData;
	}
	
	




	
	
	
}