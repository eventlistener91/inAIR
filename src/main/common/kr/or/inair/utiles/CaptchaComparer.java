package kr.or.inair.utiles;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.or.inair.golbal.GlobalConstant;

@Component
public class CaptchaComparer {
	
	public String getResponsBody(String key, String value) throws Exception{
		String code = "1";
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + value;
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", GlobalConstant.CAPTCHA_NAVER_ID);
		requestHeaders.put("X-Naver-Client-Secret", GlobalConstant.CAPTCHA_NAVER_SERET);
		
		String responseBody = get(apiURL, requestHeaders);
		
		return responseBody;
	}
	
	private String get(String apiUrl, Map<String, String> requestHeaders) throws Exception {
		HttpURLConnection con = connect(apiUrl);
		
		con.setRequestMethod("GET");
		for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
			con.setRequestProperty(header.getKey(), header.getValue());
		}
		
		int responseCode = con.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			String result = readBody(con.getInputStream());
			con.disconnect();
			return result;
		} else {
			String result = readBody(con.getErrorStream());
			con.disconnect();
			return result;
		}
	}
	
	private HttpURLConnection connect(String apiUrl) throws Exception{
		URL url = new URL(apiUrl);
		return (HttpURLConnection)url.openConnection();
	}
	
	private String readBody(InputStream body) throws Exception {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		BufferedReader lineReader = new BufferedReader(streamReader);
		
		StringBuilder responseBody = new StringBuilder();
		
		String line;
		while((line = lineReader.readLine()) != null) {
			responseBody.append(line);
		}
		
		return responseBody.toString();
	}
}
