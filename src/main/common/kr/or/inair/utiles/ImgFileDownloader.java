package kr.or.inair.utiles;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.Base64;
import java.util.UUID;

import javax.imageio.ImageIO;

import kr.or.inair.golbal.FileGlobalConstant;
import kr.or.inair.golbal.GlobalConstant;

import org.springframework.stereotype.Component;

// ai면접에서 캡처한 이미지를 받아 서버 특정 폴더에 저장하는 친구
@Component
public class ImgFileDownloader {
	
	public String imgDownloader(String strImg) throws Exception{
		String[] strParts = strImg.split(",");
		String rstStrImg = strParts[1];
		
		String saveFileName = UUID.randomUUID().toString().replace("-", "");
		BufferedImage image = null;
		byte[] byteImg;
		
		byteImg = Base64.getDecoder().decode(rstStrImg);
		
		ByteArrayInputStream bis = new ByteArrayInputStream(byteImg);
		image = ImageIO.read(bis);
		
		bis.close();
		
		File saveDir = new File(FileGlobalConstant.AIIMT_FACES_DIR + saveFileName + ".png");
		ImageIO.write(image, "png", saveDir);
		
		return saveFileName + ".png";
	}
	
}