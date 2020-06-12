package kr.or.inair.controller.companymember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.inair.comcrtfckey.service.IComCrtfcKeyService;
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
import kr.or.inair.vo.Com_CrtfcKeyVO;
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
@RequestMapping("/companyMember/")
public class CompanyMemberMainViewController {
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
	
	//기업회원 메인화면
	@RequestMapping("mainView")
	public ModelAndView mainView(ModelAndView modelAndView, 
								 Map<String, String> params) throws Exception{
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
		
		modelAndView.addObject("indvdlMemCount", iNDVDLMEMservice.getIndvdlMemCount());
		modelAndView.addObject("jobOfferCount", jobOfferService.getJobListCount());
		modelAndView.addObject("connectCount", SessionManager.getConnectCount());
		modelAndView.addObject("newsKeyWordList", newsKeyWordList);
		modelAndView.addObject("newsContentList", newsContentList);
		modelAndView.addObject("upPROList", upPROList);
		modelAndView.addObject("lowPROList", lowPROList);
		modelAndView.addObject("upIndustryList", upIndustryList);
		modelAndView.addObject("lowIndustryList", lowIndustryList);
		
		modelAndView.setViewName("companyMember/mainView");
		return modelAndView;
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
