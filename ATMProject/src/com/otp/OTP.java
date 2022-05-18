package com.otp;

import java.util.Random;

public class OTP {
	
	public static String genrateOTP(int otpLength) {
		Random rand = new Random();
		
		StringBuilder sb = new StringBuilder();
		
		for(int i=0;i<otpLength;i++) {
			sb.append(rand.nextInt(10));
		}
		
		String otp=sb.toString();
		return otp;
	}

}