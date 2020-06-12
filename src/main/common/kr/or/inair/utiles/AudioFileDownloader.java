package kr.or.inair.utiles;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.UUID;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

import kr.or.inair.golbal.FileGlobalConstant;
import kr.or.inair.golbal.GlobalConstant;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

@Component
public class AudioFileDownloader {
	
	// base64데이터를 wav파일로 저장
	public String audioFileDownloader(String base64data) throws Exception {
		String[] data = base64data.split(",");
		String dataPart = data[1];
		
		String saveFileName = UUID.randomUUID().toString().replace("-", "");
		byte[] byteData = Base64.getDecoder().decode(dataPart);
		
		FileOutputStream fos = new FileOutputStream(new File(FileGlobalConstant.AIIMT_AUDIO_UNCONVERT + saveFileName + ".wav"));
		fos.write(byteData);
		fos.close();
		
		String result = converter(saveFileName);
		return result;
	}
	
	// 저장한 base64의 sample-rate를 11025로 수정후 다시 저장
	private String converter(String fileName) throws Exception {
		File beforFile = new File(FileGlobalConstant.AIIMT_AUDIO_UNCONVERT + fileName + ".wav");
		File afterFile = new File(FileGlobalConstant.AIIMT_AUDIO_CONVERT + fileName + ".wav");
		
		AudioInputStream ais = AudioSystem.getAudioInputStream(beforFile);
		AudioFormat beforFormat = ais.getFormat();
		AudioFormat afterFormat = new AudioFormat(
				ais.getFormat().getEncoding(),
				11025,
				ais.getFormat().getSampleSizeInBits(),
				ais.getFormat().getChannels(),
				ais.getFormat().getFrameSize(),
				11025,
				ais.getFormat().isBigEndian());
		
		ais = AudioSystem.getAudioInputStream(afterFormat, ais);
		
		int b = 0;
		
		b = AudioSystem.write(ais, AudioFileFormat.Type.WAVE, afterFile);
		
		String result = voiceAnalysis(fileName);
		return result;
	}
	
	// sample-rate가 11025인 파일을 empath로 보내고 결과를 받아옴
	private String voiceAnalysis (String fileName) throws Exception {
		MultipartEntityBuilder builder = MultipartEntityBuilder
				.create()
				.setContentType(ContentType.MULTIPART_FORM_DATA)
				.setMode(HttpMultipartMode.STRICT)
				.addTextBody("apikey", GlobalConstant.EMPATH_KEY)
				.addBinaryBody("wav", new File(FileGlobalConstant.AIIMT_AUDIO_CONVERT + fileName + ".wav"));
		
		HttpPost httpPost = new HttpPost("https://api.webempath.net/v2/analyzeWav");
		httpPost.setEntity(builder.build());
		
		CloseableHttpClient client = HttpClients.createDefault();
		CloseableHttpResponse resp = client.execute(httpPost);
		
		String result = EntityUtils.toString(resp.getEntity());
		
		client.close();
		resp.close();
		
		return result;
		
	}
	
}