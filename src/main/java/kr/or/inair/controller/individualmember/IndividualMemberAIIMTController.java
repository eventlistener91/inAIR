package kr.or.inair.controller.individualmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.utiles.AudioFileDownloader;
import kr.or.inair.utiles.ImgFileDownloader;
import kr.or.inair.utiles.WordCountingFromString;
import kr.or.inair.vo.AIIMTResultVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/AIIMT/")
@Controller
public class IndividualMemberAIIMTController {
	
	@Autowired
	private ImgFileDownloader imgFileDownloader;
	@Autowired
	private WordCountingFromString wordCountingFromString;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private AudioFileDownloader audioFileDownloader;
	
	@RequestMapping("AIIMTHome")
	public String AIIMTHome() throws Exception {
		return "indvdlMember/AIIMT/AIIMTHome";
	}
	
	@RequestMapping("AIIMTForm")
	public ModelAndView AIIMTPrepare(ModelAndView andView) throws Exception {
		andView.addObject("adams_key", GlobalConstant.ADAMS_KEY);
		andView.addObject("ms_azure_key", GlobalConstant.MS_AZURE_KEY);
		andView.setViewName("indvdlMember/AIIMTForm");
		
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("canvasDownload")
	public String canvasDownload(String strImg) throws Exception {
		return imgFileDownloader.imgDownloader(strImg);
	}
	
	@ResponseBody
	@RequestMapping("sttProcessor") 
	public String sttProcessor(String clientSentences, HttpSession session, Map<String, String> params) throws Exception {
		params = wordCountingFromString.wordCountingFromString(clientSentences, session);
		String jsonData;
		
		if (params == null){
			jsonData = "{\"flag\" : \"false\"}";
		} else {
			jsonData = "{\"flag\" : \"true\",";
			List<Map<String, String>> listMap = new ArrayList<Map<String,String>>();
			Set<String> keySet = params.keySet();
			Iterator<String> it = keySet.iterator();
			
			while(it.hasNext()) {
				String key = it.next();
				Map<String, String> tmp = new HashMap<String, String>();
				tmp.put("word", key);
				tmp.put("count", params.get(key));
				
				listMap.add(tmp);
			}
			
			jsonData += "\"result\" : ";
			jsonData += mapper.writeValueAsString(listMap);
			jsonData += "}";
		}
		
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("voiceDataTransfer")
	public String voiceDataTransfer(String base64data) throws Exception {
		return audioFileDownloader.audioFileDownloader(base64data);
	}
	
	@RequestMapping("resultAIIMT")
	public ModelAndView resultAIIMT(AIIMTResultVO aIIMTResultInfo, ModelAndView andView) throws Exception {
		String wordArrayResult = mapper.writeValueAsString(aIIMTResultInfo.getWordArrayResult());
		
		andView.addObject("wordArrayResult", wordArrayResult);
		andView.addObject("aIIMTResultInfo", aIIMTResultInfo);
		andView.setViewName("indvdlMember/AIIMTResult");
		return andView; 
	}
	
	@ResponseBody
	@RequestMapping("deleteWordArrayFromSession")
	public void deleteWordArrayFromSession(HttpSession session) throws Exception {
		session.removeAttribute("AIIMT_WORD_LIST");
	}
}
