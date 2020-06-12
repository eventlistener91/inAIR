package kr.or.inair.utiles;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import kr.or.inair.golbal.GlobalConstant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CaptchaImageGenerator {

	@Autowired
	private CaptchaRegistForm captchaRegiStForm;
	private String captcharKey;
	
	public String getImageName() throws Exception {
		String clientId = "GX08wtzZlLcOFbOW9aUO";
		String clientSecret = "zrKAjBLesd";
		captcharKey = captchaRegiStForm.getKey();
		String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + captcharKey;

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		
		return responseBody;
	}
	
	public String getKey() throws Exception {
		return captcharKey;
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
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return getImage(con.getInputStream());
			} else { // 에러 발생
				return error(con.getErrorStream());
			}
		} finally {
			con.disconnect();
		}
	}

	private HttpURLConnection connect(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		return (HttpURLConnection) url.openConnection();
	}

	private String getImage(InputStream is) throws Exception {
		int read;
		byte[] bytes = new byte[1024];

		String filename = Long.valueOf(new Date().getTime()).toString();
		File f = new File(GlobalConstant.CAPTCHA_IMG_DIR +  filename + ".jpg");
		OutputStream outputStream = new FileOutputStream(f);

		f.createNewFile();
		while ((read = is.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		return filename + ".jpg";
	}

	private String error(InputStream body) throws Exception {
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
