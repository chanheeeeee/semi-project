package com.wdh.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncodingWrapper extends HttpServletRequestWrapper {
	public PasswordEncodingWrapper(HttpServletRequest request) {
		super(request);
	}
	
	
	//비밀번호 암호화 하기 위해선 재정의 해야한다!!
	@Override
	public String getParameter(String name) {
		if(name.contains("password") || name.contains("newPw") || name.contains("pass") || name.contains("password_new")) {//이름이 password 혹은 newPw로 된 모든것들 암호화!
//			String ori = super.getParameter(member_id);
//			System.out.println("암호화 전 : " + ori);
//			String encrpt = getSHA512(super.getParameter(name));
//			System.out.println("암호화 후 : " + encrpt);
		return getSHA512(super.getParameter(name));
	}
	return super.getParameter(name);
	}
	
	private String getSHA512(String oriVal) {
		//단방향 암호화하기
		
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] oriDataByte = oriVal.getBytes();
		md.update(oriDataByte);
		byte[] encrypData = md.digest();
		//Base64인코덜ㄹ 이용해서 byte로 출력되 내용을 String으로 변환
		return Base64.getEncoder().encodeToString(encrypData);
	}
}



