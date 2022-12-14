package com.wdh.member.gmail.util;

import java.security.MessageDigest;

public class SHA256 {

	
	public static String getSHA256(String input) {
		//  위 소스코드를 보시면 솔트(Salt) 부분이 들어가있는 것을 알 수 있습니다. 
		//해시 데이터를 생성할 때 악의적인 목적을 가진 공격자가 원래의 데이터를 
		//파악하기 더욱 어렵게 만들어 줄 수 있다.
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[]salt = "안녕세요! 운동행사이트 입니다.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[]chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0 ; i<chars.length ; i++) {
				String hex = Integer.toHexString(0xff  & chars[i]);
				if(hex.length() == 1) result.append('0');
				result.append(hex);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}
