package com.wdh.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.wdh.member.service.RandomStringUtilService;

public class EmailSendModule {//메일을 보내기 위한 자바 소스
	   public static String gmailSend(String gmailAddress) {
	        String user = "wdh.gd56@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String password = "rynqtropwbtpvgbr"; // 패스워드

	        // SMTP 서버 정보를 설정한다.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "587");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
           
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {//그냥 외우는 로직 이해불가
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        //인증번호 6자리 랜덤 생성하는 로직
	        String crtfcNo = RandomStringUtilService.randomNumeric(6);
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(gmailAddress)); 

	            // Subject
	            message.setSubject("[운동행] 본인인증"); //메일 제목을 입력

	            // Text
	            message.setText("귀하의 이메일 인증번호는 " + crtfcNo + " 입니다.\n인증번호를 복사하여 입력해주세요."); //메일 내용을 입력

	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("인증번호가 전송되었습니다.");
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return crtfcNo;
	    }
}
