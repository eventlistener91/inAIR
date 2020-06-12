package kr.or.inair.utiles;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import kr.or.inair.golbal.GlobalConstant;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Component;

@Component
public class SMSSender {
	
	public JSONObject send(Map<String, String> params) throws Exception{
		Properties properties = System.getProperties();
		JSONObject response = new JSONObject();
		
		params.put("api_key", GlobalConstant.COOLSMS_APIKEY);
		params.put("api_secret", GlobalConstant.COOLSMS_SECRET);
		params.put("os_platform", properties.getProperty("os_name"));
		params.put("dev_lang", "JAVA " + properties.getProperty("java.version"));
		params.put("sdk_version", "JAVA SDK 1.1");
		
		response = postRequest(GlobalConstant.COOLSMS_SMS_URL + "send", params);
		
		return response;
	}
	
	private JSONObject postRequest(String url_string, Map<String, String> params) throws Exception {
		JSONObject obj = new JSONObject();
		
		obj.put("status", false);
		
		String salt = salt();
		String timestamp = getTimeStamp();
		String signature = getSignature(salt, timestamp);
		String boundary = salt + timestamp;
		String delimiter = "\r\n--" + boundary + "\r\n";
		
		params.put("salt", salt);
		params.put("signature", signature);
		params.put("timestamp", timestamp);
		
		StringBuffer postDataBuilder = new StringBuffer();
		postDataBuilder.append(delimiter);
		
		String image = null;
		String image_path = null;
		for (Entry<String, String> entry : params.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			
			if (key == "image") {
				image = value;
				continue;
			}
			
			if(key == "image_path") {
				image_path = value;
				continue;
			}
			
			postDataBuilder = setPostData(postDataBuilder, key, value, delimiter);
			if(postDataBuilder == null) {
				obj.put("message", "postRequest data build fail");
				return obj;
			}
		}
		
		URL url = new URL(url_string);
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setDoInput(true);
		connection.setDoOutput(true);
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Connenction", "Keep-Alive");
		connection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
		connection.setUseCaches(false);
		DataOutputStream outputStream = new DataOutputStream(new BufferedOutputStream(connection.getOutputStream()));
		
		if(image != null) {
			if(image_path == null) {
				image_path = "./";
			}
			
			postDataBuilder.append(setFile("image", image));
			postDataBuilder.append("\r\n");
			FileInputStream fileStream = new FileInputStream(image_path + image);
			outputStream.writeUTF(postDataBuilder.toString());
			
			int maxBufferSize = 1024;
			int bufferSize = Math.min(fileStream.available(), maxBufferSize);
			byte[] buffer = new byte[bufferSize];
			int byteRead = fileStream.read(buffer, 0, bufferSize);
			
			while (byteRead > 0) {
				outputStream.write(buffer);
				bufferSize = Math.min(fileStream.available(), maxBufferSize);
				byteRead = fileStream.read(buffer, 0, bufferSize);
			}
			fileStream.close();
		} else {
			outputStream.writeUTF(postDataBuilder.toString());
		}
		
		outputStream.writeBytes(delimiter); 
		outputStream.flush();
		outputStream.close();
		
		String response = null;
		String inputLine; 
		int response_code = connection.getResponseCode();
		BufferedReader in = null;
		
		if (response_code != 200) {
			in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
		} else {
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		}

		while ((inputLine = in.readLine()) != null) {					
			response = inputLine;
		}

		if (response != null) {
			obj = (JSONObject) JSONValue.parse(response);
			obj.put("status", true);
			if (obj.get("code") != null) {
				obj.put("status", false);
			}
		} else {
			obj.put("status", false);
			obj.put("message", "response is empty");
		}
		
		return obj;
	}
	
	private String setFile(String key, String fileName) throws Exception {
		return "Content-Disposition: form-data; name=\"" + key + "\";filename=\"" + fileName + "\"\r\nContent-type: image/jpeg;\r\n";
	}
	
	private String salt() throws Exception {
		String uniqId = "";
		Random randomGenerator = new Random();
		
		for(int length = 1; length <= 10; ++length) {
			int randomInt = randomGenerator.nextInt(10);
			uniqId += randomInt + "";
		}
		
		return uniqId;
	}
	
	private StringBuffer setPostData(StringBuffer builder, String key, String value, String delimiter) throws Exception {
		builder.append(setValue(key, value));
		builder.append(delimiter);
		
		return builder;
	}
	
	private String setValue(String key, String value) throws Exception{
		return "Content-Disposition: form-data; name=\"" + key + "\"\r\n\r\n" + value;
	}
	
	private String getSignature(String salt, String timestamp) throws Exception {
		String signature = "";
		
		String temp = timestamp + salt;
		SecretKeySpec keySpec = new SecretKeySpec(GlobalConstant.COOLSMS_SECRET.getBytes(), "HmacMD5");
		Mac mac = Mac.getInstance("HmacMD5");
		mac.init(keySpec);
		
		byte[] result = mac.doFinal(temp.getBytes());
		char[] hexArray = "0123456789ABCDEF".toCharArray();
		char[] hexChars = new char[result.length * 2];
		
		for(int i = 0; i < result.length; i++){
			int positive = result[i] & 0xff;
			hexChars[i * 2] = hexArray[positive >>> 4];
			hexChars[i * 2 + 1] = hexArray[positive & 0x0F];
		}
		
		signature = new String(hexChars);
		
		return signature;
	}
	
	private String getTimeStamp() throws Exception {
		long timestamp_long = System.currentTimeMillis() / 1000;
		String timestamp = Long.toString(timestamp_long);
		return timestamp;
	}
	
}