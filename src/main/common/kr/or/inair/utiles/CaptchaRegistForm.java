package kr.or.inair.utiles;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class CaptchaRegistForm {

	public String getKey() throws Exception {
		String clientId = "GX08wtzZlLcOFbOW9aUO";
		String clientSecret = "zrKAjBLesd";

		String code = "0";
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		ObjectMapper mapper = new ObjectMapper();
		Map<String , String> keyMap = new ObjectMapper().readValue(responseBody, Map.class);
		
		return keyMap.get("key");
	}

	private String get(String apiUrl, Map<String, String> requestHeaders)
			throws Exception {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}
		} finally {
			con.disconnect();
		}
	}

	private HttpURLConnection connect(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		return (HttpURLConnection) url.openConnection();
	}

	private String readBody(InputStream body) throws Exception {
		InputStreamReader streamReader = new InputStreamReader(body);
		BufferedReader lineReader = new BufferedReader(streamReader);
		StringBuilder responseBody = new StringBuilder();

		String line;

		while ((line = lineReader.readLine()) != null) {
			responseBody.append(line);
		}

		return responseBody.toString();
	}
}
