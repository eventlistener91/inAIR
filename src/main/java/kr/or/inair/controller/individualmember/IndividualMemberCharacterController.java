package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.inair.characterdetail.service.ICHARDataService;
import kr.or.inair.characterlist.service.ICHARListService;
import kr.or.inair.characterquestion.service.ICHARQUESTService;
import kr.or.inair.characterresult.service.ICHARResultService;
import kr.or.inair.vo.CHAR_DETAVO;
import kr.or.inair.vo.CHAR_ListVO;
import kr.or.inair.vo.CHAR_QuestVO;
import kr.or.inair.vo.CHAR_ResultVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/character/")
public class IndividualMemberCharacterController {
	
	@Autowired
	private ICHARQUESTService questService;
	@Autowired
	private ICHARListService listService;
	@Autowired
	private ICHARResultService resultService;
	@Autowired
	private ICHARDataService detailService;

	// 인성역량검사 내역 리스트
	@RequestMapping("characterHome")
	public String charcterList(Model model, Map<String, String> params) throws Exception {
		List<CHAR_ListVO> charList = this.listService.char_List();
		model.addAttribute("charList", charList);
		
		return "indvdlMember/character/characterHome";
	}
	
	// 인성역량검사 질문지
	@RequestMapping("characterQuest")
	public ModelAndView characterView(ModelAndView modelAndView, Map<String, String> params) throws Exception {
		
		List<CHAR_QuestVO> charQuestList = this.questService.char_QuestList(); 
		
		modelAndView.addObject("charQuestList", charQuestList);
		
		modelAndView.setViewName("indvdlMember/character/characterQuest");
		
		return modelAndView;
	}
	
	// 인성역량검사 insert
	@RequestMapping("insertCharacterResult")
	public String insertCharacterResult(String indvdl_id,
										String char_detail_lev01,
										String char_detail_lev02,
										String char_detail_lev03,
										String char_detail_lev04,
										String char_detail_lev05,
										String char_detail_lev06,
										String char_score01,
										String char_score02,
										String char_score03,
										String char_score04,
										String char_score05,
										String char_score06) throws Exception {
		Map<String, String> params = new HashMap<String, String>(); 
		params.put("indvdl_id", indvdl_id);
		params.put("char_detail_lev01", char_detail_lev01);
		params.put("char_detail_lev02", char_detail_lev02);
		params.put("char_detail_lev03", char_detail_lev03);
		params.put("char_detail_lev04", char_detail_lev04);
		params.put("char_detail_lev05", char_detail_lev05);
		params.put("char_detail_lev06", char_detail_lev06);
		params.put("char_score01", char_score01);
		params.put("char_score02", char_score02);
		params.put("char_score03", char_score03);
		params.put("char_score04", char_score04);
		params.put("char_score05", char_score05);
		params.put("char_score06", char_score06);
		
		this.resultService.insertCharResult(params);
		
		return "redirect:/character/characterHome.do";
	}
	
	// 인성역량검사 세부사항
	@RequestMapping("characterDetail")
	public CHAR_DETAVO characterDetail(Map<String, String> params, CHAR_DETAVO characterDetail, String char_element_num, String char_detail_lev) throws Exception {
		
		List<CHAR_DETAVO> char_detaList = detailService.getCharDetaList();
		
		params.put("char_element_num", char_element_num);
		params.put("char_detail_lev", char_detail_lev);
		
		characterDetail = this.detailService.charDetailInfo(params);
		
		return characterDetail;
	}
	
	// 인성역량검사 결과 조회
	@RequestMapping("characterResultView")
	public ModelAndView characterResultView(ModelAndView andView, String char_num, Map<String, String> params, CHAR_ResultVO charResultInfo) throws Exception {
		
		params.put("char_num", char_num);
		
		List<CHAR_ResultVO> charResultList = this.resultService.selectCharResult(params);
		List<CHAR_ResultVO> charScoreAVG = this.resultService.charScoreChart();
		
		andView.addObject("charResultList", charResultList);
		andView.addObject("charScoreAVG", charScoreAVG);
		
		andView.setViewName("indvdlMember/character/characterResultView");
		
		return andView;
		
	}
	
	
	
	
}
