package kr.or.inair.controller.individualmember;

import java.net.URLEncoder;
import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.inair.comcrtfckey.service.IComCrtfcKeyService;
import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.individualmember.individualmember.service.IINDVDLMEMService;
import kr.or.inair.individualmember.joboffer.service.IJobOfferService;
import kr.or.inair.individualmember.lowindustry.service.ILowIndustryService;
import kr.or.inair.individualmember.lowpro.service.ILowPROService;
import kr.or.inair.individualmember.upindustry.service.IUpIndustryService;
import kr.or.inair.individualmember.uppro.service.IUpPROService;
import kr.or.inair.listener.SessionManager;
import kr.or.inair.news.service.INewsService;
import kr.or.inair.newskeyword.service.INewsKeyWordService;
import kr.or.inair.utiles.CompanyInfoCrawler;
import kr.or.inair.utiles.CryptoGenerator;
import kr.or.inair.vo.Com_CrtfcKeyVO;
import kr.or.inair.vo.CompanyVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.NewsKeyWordVO;
import kr.or.inair.vo.NewsVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/individualMember/")
public class IndividualMemberMainViewController {
	
	@Autowired
	private IINDVDLMEMService iNDVDLMEMservice;
	@Autowired
	private INewsKeyWordService newsKeyWordService;
	@Autowired
	private INewsService newsService;
	@Autowired
	private IJobOfferService jobOfferService;
	@Autowired
	private IUpPROService upProService;
	@Autowired
	private ILowPROService lowProService;
	@Autowired
	private IUpIndustryService upIndustryservice;
	@Autowired
	private ILowIndustryService lowIndustryService;
	@Autowired
	private IComCrtfcKeyService comCrtfcKeyService;
	@Autowired
	private CompanyInfoCrawler companyinfoCrawler;
	@Autowired
	private ObjectMapper mapper;
	
	// 개인회원 메인화면
	@RequestMapping("mainView")
	public ModelAndView mainView(ModelAndView andView, Map<String, String> params) throws Exception{
		String clickKeyWord = "";
		List<NewsVO> newsContentList = new ArrayList<NewsVO>();
		List<NewsKeyWordVO> newsKeyWordList = newsKeyWordService.getNewsKeyWordList();
		List<NewsVO> newsList = newsService.getNewsList(clickKeyWord);
		List<UpProVO> upPROList = this.upProService.getUpPROList();
		List<LowProVO> lowPROList = this.lowProService.getLowProfession();
		List<UpIndustryVO> upIndustryList = this.upIndustryservice.getUpIndustryList();
		List<LowIndustryVO> lowIndustryList = this.lowIndustryService.getLowIndustry();
		
		for (int i = 0; i < newsList.size(); i++){
			if(newsKeyWordList.get(0).getKeyword_num().equals(newsList.get(i).getKeyword_num())){
				NewsVO newsInfo = new NewsVO();
				
				newsInfo.setNews_cn(newsList.get(i).getNews_cn());
				newsInfo.setNews_link(newsList.get(i).getNews_link());
				newsInfo.setNews_sj(newsList.get(i).getNews_sj());
				newsInfo.setKeyword_cn(newsKeyWordList.get(0).getKeyword_cn());
				newsInfo.setNews_rgsde(newsList.get(i).getNews_rgsde());
				
				newsContentList.add(newsInfo);
			}
		}
		
		andView.addObject("indvdlMemCount", iNDVDLMEMservice.getIndvdlMemCount());
		andView.addObject("jobOfferCount", jobOfferService.getJobListCount());
		andView.addObject("connectCount", SessionManager.getConnectCount());
		andView.addObject("newsKeyWordList", newsKeyWordList);
		andView.addObject("newsContentList", newsContentList);
		andView.addObject("upPROList", upPROList);
		andView.addObject("lowPROList", lowPROList);
		andView.addObject("upIndustryList", upIndustryList);
		andView.addObject("lowIndustryList", lowIndustryList);
		
		andView.setViewName("indvdlMember/mainView");
		
		return andView;
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		
		String message =URLEncoder.encode("로그아웃되었습니다.","UTF-8" );
		session.invalidate();
		return "redirect:/individualMember/mainView.do?message="+message;
		
	}
	
	//뉴스리셋
	@ResponseBody
	@RequestMapping("resetNews")
	public String resetNews(String clickKeyWord) throws Exception{
		List<NewsVO> newsList = newsService.getNewsList(clickKeyWord);
		List<Map<String, String>> beforeJasonNewsList = new ArrayList<Map<String,String>>(); 
		
		for(int i = 0; i < newsList.size(); i++){
			Map<String, String> tmp = new HashMap<String, String>();
			
			tmp.put("news_sj", newsList.get(i).getNews_sj());
			tmp.put("news_cn", newsList.get(i).getNews_cn());
			tmp.put("news_link", newsList.get(i).getNews_link());
			tmp.put("news_rgsde", newsList.get(i).getNews_rgsde());
			tmp.put("clickKeyWord", clickKeyWord);
			
			beforeJasonNewsList.add(tmp);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(beforeJasonNewsList);
		
		return jsonData;
	}
	
	// 기업검색
	@ResponseBody
	@RequestMapping("searchCompany")
	public String searchCompany(String corp_name, Map<String, String> resultDataMap) throws Exception {
		
		List<Map<String, String>> listMap = new ArrayList<Map<String,String>>();
		List<Com_CrtfcKeyVO> corp_list= comCrtfcKeyService.getComNameList(corp_name);
		
		if(corp_list.size() != 0) {
			resultDataMap.put("resultFlag", "true");
			listMap.add(resultDataMap);
			for(int i = 0; i < corp_list.size(); i++) {
				Map<String, String> tempMap = new HashMap<String, String>();
				tempMap.put("corp_name", corp_list.get(i).getCorp_name());
				tempMap.put("corp_code", corp_list.get(i).getCorp_code());
				
				listMap.add(tempMap);
			}
		} else {
			resultDataMap.put("resultFlag", "false");
			listMap.add(resultDataMap);
		}
		
		String jsonData = mapper.writeValueAsString(listMap);
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("getCompanyInfo")
	public String getCompanyInfo(String corp_code) throws Exception {
		return companyinfoCrawler.getCompanyInfo(corp_code);
	}
	
}
