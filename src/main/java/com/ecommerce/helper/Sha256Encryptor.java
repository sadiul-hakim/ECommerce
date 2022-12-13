package com.ecommerce.helper;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class Sha256Encryptor implements Encryptor {

	public String encrypt(String password) {
		// TODO Auto-generated method stub
		String encryption=null;
		
		try {
			MessageDigest digest=MessageDigest.getInstance("sha-256");
			var bytes=digest.digest(password.getBytes(StandardCharsets.UTF_8));
			encryption=convertToHex(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return encryption;
	}
	
	private String convertToHex(byte[] arr) {
		StringBuilder sb=new StringBuilder();
		
		for(byte b:arr) {
			String hex=Integer.toHexString(0xff & b);
			if(hex.length()==1) {
				sb.append('0');
			}
			sb.append(hex);
		}
		return sb.toString();
	}

}
