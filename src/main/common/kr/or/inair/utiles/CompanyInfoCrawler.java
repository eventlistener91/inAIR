package kr.or.inair.utiles;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import kr.or.inair.company.servie.ICompanyService;
import kr.or.inair.companyinfo.service.ICompanyInfoService;
import kr.or.inair.golbal.GlobalConstant;
import kr.or.inair.vo.CompanyInfoVO;
import kr.or.inair.vo.CompanyVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CompanyInfoCrawler {
	
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ICompanyInfoService companyInfoService;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private CompanyInfoDBInserter companyInfoDBInserter;
	
	public String getCompanyInfo(String corp_code) throws Exception {
		
		Map<String, String> basicInfoResult = getCompanyBasicInfo(corp_code);
		
		CompanyVO comBasicInfoCheck = companyService.getCompanyInfo(corp_code);
		
		if (comBasicInfoCheck == null) {
			companyInfoDBInserter.insertBasicCompanyInfo(basicInfoResult);
		}
		
		List<CompanyInfoVO> comDetailInfoCheck = companyInfoService.getCompanyInfo(corp_code); // corp_code에 해당하는 기업정보가 들어있는지 검사
		
		// corp_code에 해당하는 기업정보가 존재하지 않는다면
		if (comDetailInfoCheck.size() == 0) {
			Calendar cal = Calendar.getInstance(); // 올해를 구합니다.
			int year = cal.get(cal.YEAR);
			
			for(int i = year; i > 2014; i--){ // 올해년도에서 2015까지 1씩빼가면서 반복문
				Map<String, Object> jsonMap = getCompanyDetailInfo(corp_code, String.valueOf(year)); // api에게 요청을 보냅니다.
				
				if((jsonMap.get("status").equals("000"))){ // 요청 결과가 000이다 == 값이 존재한다.
					
					List<Map<String, String>> mapList = (List<Map<String, String>>) jsonMap.get("list"); // 값이 존재하니 회사정보에 접근합니다.
					
					for(int j = 0; j < mapList.size(); j++){ // 데이터베이스에 저장합니다.
						companyInfoDBInserter.insertDetailCompanyInfo(mapList.get(j));
					}
					break;
				} else { // 요청결과가 존재하지 않습니다.
					basicInfoResult.put("isExistDetailInfo", "false"); // 존재하지 않으니 false를 반환
				}
			}
		} else {
			// 존재한다면 true를 보냅니다.
			basicInfoResult.put("isExistDetailInfo", "true");
		}
		
		String jsonData  = mapper.writeValueAsString(basicInfoResult);
		return jsonData;
		
	}
	
	public Map<String, String> getCompanyBasicInfo(String corp_code) throws Exception {
		String url = "https://opendart.fss.or.kr/api/company.json?crtfc_key=" + GlobalConstant.OPENDARTKEY + "&corp_code=" + corp_code;
		
		Document doc = Jsoup.connect(url).ignoreContentType(true).get();
		String jsonDoc = doc.text();
		
		Map<String, String> json2map = mapper.readValue(jsonDoc, Map.class);
		if(!json2map.get("phn_no").equals("")){
			if(json2map.get("phn_no").contains(")")){
				json2map.put("phn_no", json2map.get("phn_no").replace(")", "-"));
			}
		}
		
		if(!json2map.get("bizr_no").equals("")){
			if(json2map.get("bizr_no").length() <= 9){
				json2map.put("bizr_no", "");
			} else if(json2map.get("bizr_no").length() >= 10 && !json2map.get("bizr_no").contains("-")){
				String bizr_no1 = json2map.get("bizr_no").substring(0, 3);
				String bizr_no2 = json2map.get("bizr_no").substring(3, 5);
				String bizr_no3 = json2map.get("bizr_no").substring(5, 10);
				json2map.put("bizr_no", bizr_no1 + "-" + bizr_no2 + "-" + bizr_no3);
			}
		}
			
		return json2map;
	}
	
	public Map<String, Object> getCompanyDetailInfo(String corp_code, String year) throws Exception {
		String url = "https://opendart.fss.or.kr/api/empSttus.json?crtfc_key=" + GlobalConstant.OPENDARTKEY + "&corp_code=" + corp_code + "&bsns_year=" + year + "&reprt_code=11011";
		
		Document doc = Jsoup.connect(url).ignoreContentType(true).get();
		String jsonDoc = doc.text();
		
		Map<String, Object> json2map = mapper.readValue(jsonDoc, Map.class);
		
		return json2map;
	}
	
}