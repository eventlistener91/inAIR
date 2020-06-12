package kr.or.inair.utiles;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kr.or.inair.golbal.GlobalConstant;

import org.springframework.stereotype.Component;

@Component
public class MailSender {
	
	public void mailSender(String reipient, String subject, String body) throws Exception{
		Properties props = System.getProperties();
		props.put("mail.smtp.host", GlobalConstant.MAIL_HOST);//이용할 이메일의 호스트주소(네이버와 네이버끼리만 메일이 가능하다)
		props.put("mail.smtp.port", GlobalConstant.MAIL_PORT);//포트번호
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", GlobalConstant.MAIL_HOST);
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//입력한 아이디와 비밀번호가 맞는지 확인
				return new PasswordAuthentication(GlobalConstant.MAIL_ID, GlobalConstant.MAIL_PASS);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(GlobalConstant.MAIL_ID));//보내는 사람의 주소
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(reipient));//받는 사람의 주소
		mimeMessage.setSubject(subject);//메일의 제목을 set
		mimeMessage.setText(body);//메일의 내용을 set
		
		Transport.send(mimeMessage);//Transport클래스를 이용하여 메시지를 입력한 mimeMessage를 인자값으로 넘겨서 메일을 전송한다.
	}
	
}