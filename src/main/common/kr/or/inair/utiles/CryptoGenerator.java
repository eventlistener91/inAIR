package kr.or.inair.utiles;


import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class CryptoGenerator {
	// 비대칭 암호화 기술의 RSA 암호화 알고리즘 적용
	// 1회용 공개키/비밀키 생성
	// 반환값 : 공개키(가수부, 지부수 별도 Map에 저장 활용)
	// 매개변수 : HttpSession 내 비밀키 저장 활용
	public static Map<String, String> getGeneratePairKey(HttpSession session){
		// 공개키, 비밀키 생성 자원
		KeyPairGenerator pairGenerator = null;
		// 생성된 공개키, 비밀키 쌍
		KeyPair keyPair = null;
		// 생성된 공개키
		PublicKey publicKey = null;
		// 생성된 비밀키
		PrivateKey privateKey = null;
		// 생성된 공개키를 가수부 + 지수부 변환
		KeyFactory keyFactory = null;
		
		Map<String, String> publicKeyMap = new HashMap<String, String>();

		try {
			// 공개키, 비밀키 생성시 적용될 암호화 알고리즘 설정
			pairGenerator = KeyPairGenerator.getInstance("RSA");
			// 공개키, 비밀키 생성시 사이즈 : byte 단위(짝수)
			pairGenerator.initialize(2048);
			// 공개키, 비밀키 취득
			keyPair = pairGenerator.generateKeyPair();
			// 공개키 취득
			publicKey = keyPair.getPublic();
			// 비밀키 취득
			privateKey = keyPair.getPrivate();
			
			session.setAttribute("privateKey", privateKey);
			
			
			// 공개키(Double Type) 4342.43847328478325783274832
			// float  type(32bit) 단정도 : 부호 1bit(양수0|음수1) + 지수부8bit(소숫점자리) + 가수23bit(실수표현)  
			// double type(64bit) 배정도 : 부호 1bit(양수0|음수1) + 지수부11bit(소숫점자리) + 가수52bit(실수표현)
			keyFactory = KeyFactory.getInstance("RSA");
			RSAPublicKeySpec publicKeySpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			
			// 공개키 가수부
			String publicModulus = publicKeySpec.getModulus().toString(16);
			// 공개키 지수부
			String publicExponent = publicKeySpec.getPublicExponent().toString(16);
			
			publicKeyMap.put("publicModulus", publicModulus);
			publicKeyMap.put("publicExponent", publicExponent);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return publicKeyMap;
	}
	
	// 암호문의 평문 변환
	// 반환값 : 평문
	public static String decryptRSA(PrivateKey privateKey, String secureValue){
		String returnValue = "";
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			
			byte[] targetByte = hexToByteArray(secureValue);
			
			byte[] beforeString = cipher.doFinal(targetByte);
			
			returnValue = new String(beforeString, "UTF-8");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return returnValue;
	}

	private static byte[] hexToByteArray(String secureValue) {
		if(secureValue == null || secureValue.length()%2 != 0){
			return new byte[]{};
		}
		byte[] bytes = new byte[secureValue.length()/2];
		
		for(int i=0; i<secureValue.length(); i+=2){
			byte value = (byte) Integer.parseInt(secureValue.substring(i, i+2), 16);
			bytes[(int)Math.floor(i/2)] = value;
		}
		return bytes;
	}
}





