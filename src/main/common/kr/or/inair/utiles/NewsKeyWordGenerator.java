package kr.or.inair.utiles;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.vo.NewsKeyWordVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Component;

@Component
public class NewsKeyWordGenerator {
	
	public List<NewsKeyWordVO> getNewsKeyWordList() throws Exception {
		final String keyword1 = URLEncoder.encode("취업", "UTF-8");
		final String keyword2 = URLEncoder.encode("직장", "UTF-8");
		final String keyword3 = URLEncoder.encode("직업", "UTF-8");

		String[] mainKeyWord = {
				"http://api.adams.ai/datamixiApi/deeptopicrankTrend?target=news&keyword=" + keyword1 + "&max=10&from=&until=&level=1&key=" + GlobalConstant.ADAMS_KEY,
				"http://api.adams.ai/datamixiApi/deeptopicrankTrend?target=news&keyword=" + keyword2 + "&max=10&from=&until=&level=1&key=" + GlobalConstant.ADAMS_KEY,
				"http://api.adams.ai/datamixiApi/deeptopicrankTrend?target=news&keyword=" + keyword3 + "&max=10&from=&until=&level=1&key=" + GlobalConstant.ADAMS_KEY };

		Set<String> setMainKeyWord = new HashSet<String>();

		for (int i = 0; i < mainKeyWord.length; i++) {
			Document doc = Jsoup.connect(mainKeyWord[i]).get();
			String jsonData = doc.text();

			Map<String, Object> params1 = new ObjectMapper().readValue(jsonData, Map.class);
			Map<String, Object> params2 = (Map<String, Object>) params1.get("return_object");
			List<Map<String, Object>> list = (List<Map<String, Object>>) params2.get("trends");

			for (int j = 0; j < list.size(); j++) {
				List<Map<String, Object>> listMap = (List<Map<String, Object>>) list.get(j).get("nodes");
				for (int k = 0; k < listMap.size(); k++) {
					setMainKeyWord.add((String) listMap.get(k).get("name"));
				}
			}
		}
		
		List<String> keywordList = new ArrayList<String>(setMainKeyWord);
		for(int i = 0; i < keywordList.size(); i++){
			for(int j = 0; j < keywordList.size(); j++){
				if(keywordList.get(i).contains(keywordList.get(j))){
					keywordList.remove(i);
				}
			}
		}

		List<NewsKeyWordVO> newsKeyWordList = new ArrayList<NewsKeyWordVO>();

		for (int i = 0; i < keywordList.size(); i++) {
			NewsKeyWordVO keyInfo = new NewsKeyWordVO();
			keyInfo.setKeyword_cn(keywordList.get(i));

			newsKeyWordList.add(keyInfo);
		}
		
		return newsKeyWordList;
	}

}
