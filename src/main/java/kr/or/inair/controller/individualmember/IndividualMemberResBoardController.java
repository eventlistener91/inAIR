package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.inair.freeboard.service.IFreeBoardService;
import kr.or.inair.resboard.service.IRESBoardService;
import kr.or.inair.resboardfile.service.IRESBoardFileService;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.utiles.RolePagingUtile;
import kr.or.inair.vo.FreeboardVO;
import kr.or.inair.vo.ResboardVO;
import kr.or.inair.vo.Resboard_FileVO;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
@RequestMapping("/resboard/")
public class IndividualMemberResBoardController {
	@Autowired
	private IRESBoardService iRESBoardService;
	
	@Autowired
	private RolePagingUtile paging;
	
	@Autowired
	private IRESBoardFileService iRESFileService;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	@RequestMapping("resboardHome")
	public ModelAndView iresboardHome(HttpSession session,
									  HttpServletRequest request,
									  ModelAndView andView,
									  String currentPage,
									  String search_keycode,
									  String search_keyword,
									  String paginationHTML,
									  Map<String, String> params) throws Exception{
		
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = iRESBoardService.totalCount(params);
		paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = paging.getPagingHtmls();
		
		List<ResboardVO> resboardList = this.iRESBoardService.resboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("resboardList", resboardList);
	
		
		andView.setViewName("companyMember/resboard/resboardHome");
		return andView;
	}
	@RequestMapping("indvdlResboardHome")
	public ModelAndView indvdlResboardHome(HttpSession session,
											HttpServletRequest request,
											ModelAndView andView,
											String currentPage,
											String search_keycode,
											String search_keyword,
											String paginationHTML,
											Map<String, String> params) throws Exception{
										
		
		params = CryptoGenerator.getGeneratePairKey(session);
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		params.put("currentPage", currentPage);
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = iRESBoardService.totalCount(params);
		paging.makePagination(request, Integer.parseInt(totalCount),Integer.parseInt(currentPage), search_keyword, search_keycode);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		paginationHTML = paging.getPagingHtmls();
		
		List<ResboardVO> resboardList = this.iRESBoardService.resboardList(params);
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("publicKeyMap", params);
		andView.addObject("paginationHTML", paginationHTML);
		andView.addObject("resboardList", resboardList);
		
		
		andView.setViewName("board/resboard/resboardHome");
		return andView;
	}
	
	@RequestMapping("resboardView")
	public ModelAndView iresboardView(ModelAndView andView
									 ,String res_num
									 ,String rnum
									 ,String search_keyword
									 ,String search_keycode
									 ,String res_group
									 ,Map<String,String> params
									 ,ResboardVO resboardInfo)throws Exception{
		params.put("res_num", res_num);
		resboardInfo = this.iRESBoardService.resboardInfo(params);

		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("resboardInfo", resboardInfo);
		andView.setViewName("companyMember/resboard/resboardView");
		return andView;
	}
	@RequestMapping("indvdlResboardView")
	public ModelAndView indvdlResboardView(ModelAndView andView
											,String res_num
											,String rnum
											,String search_keyword
											,String search_keycode
											,String res_group
											,Map<String,String> params
											,ResboardVO resboardInfo)throws Exception{
		params.put("res_num", res_num);
		resboardInfo = this.iRESBoardService.resboardInfo(params);
		
		andView.addObject("search_keyword", search_keyword);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("resboardInfo", resboardInfo);
		andView.setViewName("board/resboard/resboardView");
		return andView;
	}
	
	@RequestMapping("resboardUpdateForm")
	public ModelAndView resboardUpdateForm(ModelAndView andView
										  ,ResboardVO resboardInfo
										  ,Map<String, String> params
										  ,ResboardVO resboardUpdateInfo) throws Exception{
		params.put("res_num", resboardInfo.getRes_num());
		resboardUpdateInfo = this.iRESBoardService.resboardInfo(params);
		andView.addObject("resboardInfo", resboardUpdateInfo);
		andView.setViewName("companyMember/resboard/resboardUpdateForm");
		return andView;
	}
	
	@RequestMapping("updateResboard")
	public String updateResboard(ResboardVO resboardInfo
								,RedirectAttributes redirectAttributes) throws Exception{
		
		this.iRESBoardService.updateResboard(resboardInfo);
		String unEncodingMessage = URLEncoder.encode("수정이 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    
	    return "redirect:/resboard/resboardHome.do?message="+encodingMessage;
		
		
	}
	
	@RequestMapping("deleteResboard")
	public String deleteResboard(String res_num
								,RedirectAttributes redirectAttributes
								,Map<String,String> params) throws Exception{
		
		params.put("res_num", res_num);
		this.iRESBoardService.deleteResboard(params);
		
		String unEncodingMessage = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    
	    return "redirect:/resboard/resboardHome.do?message="+encodingMessage;
	}
	
	@RequestMapping("resboardForm")
	public ModelAndView resboardForm(ModelAndView andView) throws Exception{
		
		andView.setViewName("companyMember/resboard/resboardForm");
		return andView;
	}
	
	@RequestMapping("insertResboard")
	public String insertResboard(ResboardVO resboardInfo
								,@RequestParam("files") MultipartFile[] items
								,RedirectAttributes redirectAttributes) throws Exception{
		
		this.iRESBoardService.insertResboardInfo(resboardInfo, items);
		String unEncodingMessage = URLEncoder.encode("추가가 완료되었습니다.", "UTF-8");
	    String encodingMessage = URLEncoder.encode(unEncodingMessage, "UTF-8");
	    return "redirect:/resboard/resboardHome.do?message="+encodingMessage;
		
		
	}
	
	@ResponseBody
	@RequestMapping("updateResboardFile")
	public ModelAndView updateResboardFile(@RequestParam("files") MultipartFile[] items,
								    Resboard_FileVO resFileInfo,		
									String res_num,
									ModelAndView andView) throws Exception{
		 List<Resboard_FileVO> resboardList = new ArrayList<Resboard_FileVO>();
		 for(int i=0;i<1;i++){
				resboardList= fileMapper.resmapper(items, res_num);
		        resFileInfo.setRes_file_delete(resboardList.get(i).getRes_file_delete());
		        resFileInfo.setRes_file_eventn(resboardList.get(i).getRes_file_eventn());
		        resFileInfo.setRes_file_num(resboardList.get(i).getRes_file_num());
		        resFileInfo.setRes_file_savename(resboardList.get(i).getRes_file_savename());
		        resFileInfo.setRes_file_size(resboardList.get(i).getRes_file_size());
		        resFileInfo.setRes_name(resboardList.get(i).getRes_name());
		        resFileInfo.setRes_num(resboardList.get(i).getRes_num());
		 }
		
		this.iRESFileService.updateFileitem(resFileInfo);
		andView.addObject("resFileInfo", resFileInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	
	}
	
	@RequestMapping("resboardDownload")
	public ModelAndView resboardDownload(String fileSaveName
										,String fileName
										,ModelAndView andView) throws Exception{
		
		andView.addObject("targetFileName", fileSaveName);
		andView.addObject("fileName", fileName);
		andView.setViewName("fileDownloadView");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("commentList")
	public ModelAndView commentList(String res_group,
									Map<String,String> params,
									ModelAndView andView) throws Exception{
		params.put("res_group", res_group);
		List<ResboardVO> resboardList = this.iRESBoardService.resCommentList(params);
		
		andView.addObject("resboardList", resboardList);
		andView.setViewName("jsonConvertView");
		
		return andView;
		
		
	}
	
	@ResponseBody
	@RequestMapping("insertResboarddReply")
	public void insertResboarddReply(ResboardVO resboardInfo) throws Exception{
		
		this.iRESBoardService.insertResboardReply(resboardInfo);
		
	}
	
	@ResponseBody
	@RequestMapping("updateFreeboardComment") 
	public void updateFreeboardComment(ResboardVO resboardInfo) throws Exception{
		
		this.iRESBoardService.updateCommentResboard(resboardInfo);
	}
	
	@ResponseBody
	@RequestMapping("deleteResboardComment")
	public void deleteResboardComment(String res_num
									  ,Map<String, String> params) throws Exception{
		params.put("res_num", res_num);
		this.iRESBoardService.deleteResboard(params);
		
	}
	
	@ResponseBody
	@RequestMapping("insertResboardReply")
	public void insertResboardReply(ResboardVO resboardInfo) throws Exception{
		
		this.iRESBoardService.insertResboardReply(resboardInfo);
	}
	
	
	
	
	
	
	
}