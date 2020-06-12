package kr.or.inair.utiles;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import kr.or.inair.newskeyword.service.INewsKeyWordService;
import kr.or.inair.vo.NewsKeyWordVO;
import kr.or.inair.vo.NewsVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NewsContentGenerator {
	
	@Autowired
	private INewsKeyWordService iNewsKeyWordService;
	
	public List<NewsVO> getNewsGenerator() throws Exception {
		List<NewsKeyWordVO> newsKeyWordList = iNewsKeyWordService.getNewsKeyWordList();
		
		Iterator<Element> li = null;
		List<Element> liList = new ArrayList<Element>();
		List<NewsVO> newsList = new ArrayList<NewsVO>();
		
		for(int i = 0; i < newsKeyWordList.size(); i++){
			String searchURL = "https://search.naver.com/search.naver?where=news&query=" + newsKeyWordList.get(i).getKeyword_cn() + "%2B%EC%B7%A8%EC%97%85" + "&sm=tab_srt&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so%3Add%2Cp%3Aall%2Ca%3Aall&mynews=0&refresh_start=0&related=0";
			Document doc = Jsoup.connect(searchURL).get();
			Elements ele = doc.select("ul.type01");
			
			li = ele.select("li").iterator();
			while(li.hasNext()){
				liList.add(li.next());
			}
			
			for(int j = 0; j < liList.size(); j++){
				NewsVO newsInfo = new NewsVO();
				newsInfo.setNews_sj(liList.get(j).children().select("a._sp_each_title").text());
				newsInfo.setNews_cn(liList.get(j).children().select("dd:not(.txt_inline)").text());
				newsInfo.setNews_link(liList.get(j).children().select("a._sp_each_title").attr("href"));
				newsInfo.setKeyword_num(newsKeyWordList.get(i).getKeyword_num());
				
				newsList.add(newsInfo);
			}
			
			liList.clear();
		}
		
		return newsList;
	}
}
