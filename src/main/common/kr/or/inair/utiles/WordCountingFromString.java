package kr.or.inair.utiles;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import kr.or.inair.golbal.GlobalConstant;

import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 세션에는 10초동안 면접자가 말한 문장을 <단어, 사용횟수>형태로 "AIIMT_WORD_LIST"라는 키로 저장
 * 그리고 <단어, 스트링타입의 사용횟수>로 사용횟수가 3이상이것들을 반환함
 * @author 우영래
 * @since 2020-05-29
 *
 */
@Component
public class WordCountingFromString {
	
	@Autowired
	ObjectMapper mapper;
	
	public Map<String, String> wordCountingFromString(String clientSentences, HttpSession session) throws Exception{
		Map<String, Integer> words = wordExtractor(clientSentences);
		
		Map<String, Integer> sessionData = (Map<String, Integer>) session.getAttribute("AIIMT_WORD_LIST");
		Map<String, String> returnData = new HashMap<String, String>();
		
		// 세션에 없을경우
		if(sessionData == null) {
			session.setAttribute("AIIMT_WORD_LIST", words);
			
			Set<String> wordsKeySet = words.keySet();
			Iterator<String> wordsIt = wordsKeySet.iterator();
			
			while(wordsIt.hasNext()) {
				String key = wordsIt.next();
				
				int count = words.get(key);
				
				if(count > 2) {
					returnData.put(key, String.valueOf(words.get(key)));
				}
			}
			
		} else {
			Set<String> wordsSet = words.keySet();
			Iterator<String> it = wordsSet.iterator();
			
			// 10초동안 면접자가 말한 문장에 단어를 추출하고 <단어, 횟수>를 이터레이터를 이용해서 단어들만 추출 다음 단어가 존재할경우
			while(it.hasNext()) {
				// 그단어를 String 타입 key에 초기화
				String key = it.next();
				// 만약 session에 담긴 데이터에 key가 이미 존재한다면
				if(sessionData.containsKey(key)){
					// 세션데이터에 해당키로 해당키의 횟수 + 면접자가 말한 해당 키  횟수로 저장
					sessionData.put(key, sessionData.get(key) + words.get(key));
				} else {
					// 그냥 해당키 저장
					sessionData.put(key, words.get(key));
				}
			}
			
			session.setAttribute("AIIMT_WORD_LIST", sessionData);
			
			Set<String> sessionDataKeySet = sessionData.keySet();
			Iterator<String> sessionDataIt = sessionDataKeySet.iterator();
			
			while(sessionDataIt.hasNext()) {
				String key = sessionDataIt.next();
				
				int count = sessionData.get(key);
				
				if(count > 1) {
					returnData.put(key, String.valueOf(sessionData.get(key)));
				}
			}
		}
		
		return returnData;
	}
	
	// adams.ai에 문장들을 보내어 단어들을 추출하고 List<Map<String, Integer)형태로 <단어, 횟수>을 반환한다.
	private Map<String, Integer> wordExtractor(String clientSentences) throws Exception {
		String utfSentences = URLEncoder.encode(clientSentences, "UTF-8");
		
		String url = "http://api.adams.ai/datamixiApi/tms?analysis=pos&lang=kor&key=" + GlobalConstant.ADAMS_KEY + "&query=" + utfSentences;
		
		Document doc = Jsoup.connect(url).get();
		String docData = doc.text();
		
		Map<String, Object> docMap = mapper.readValue(docData, Map.class);
		Map<String, Object> returnObjectMap = (Map<String, Object>) docMap.get("return_object");
		
		List<Map<String, Object>> sentenceList = (List<Map<String, Object>>) returnObjectMap.get("sentence");
		List<Map<String, String>> morpList = (List<Map<String, String>>) sentenceList.get(0).get("morp");
		
		Map<String, Integer> returnData = new HashMap<String, Integer>();
		
		for (int i = 0; i < morpList.size(); i++) {
			if (morpList.get(i).get("type").equals("NNG")) {
				if (returnData.size() == 0) {
					returnData.put(morpList.get(i).get("lemma"), 1);
				} else {
					String key = morpList.get(i).get("lemma");
					
					if (returnData.containsKey(key)) {;
						returnData.put(key, returnData.get(key) + 1);
					} else {
						returnData.put(key, 1);
					}
				}
			}
		}
		
		return returnData;
	}
	
}