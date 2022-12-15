package com.wdh.member.gmail.util;

import java.net.Authenticator;
import java.net.PasswordAuthentication;

public class Gmail extends Authenticator {

	// SMTP에서 인증을 위한 부분
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("wdh.gd56@gmail.com", "dnsehdgod56");
	}
	

}
