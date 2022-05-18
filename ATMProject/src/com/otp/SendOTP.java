package com.otp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;



public class SendOTP {
	
	public static void sendOTP(String messege, String number, String apiKey) {
		
		try {
			
			String sendId = "TXTIND";
			String lang = "english";
			String route = "q";
			
			messege=URLEncoder.encode(messege,"UTF-8");
			
			String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization="+apiKey+"&sender_id="+sendId+"&message="+messege+"&route="+route+"&numbers="+number;
			URL url = new URL(myUrl);
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("cache-control", "no-cache");
			
			//System.out.println("Wait............................");
			int responseCode = con.getResponseCode();
			//System.out.println("response code:"+responseCode);
			
			
			StringBuffer response = new StringBuffer();
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			while(true) {
				String line=br.readLine();
//				System.out.println(line);
				if(line==null) {
					break;
				}
				response.append(line);
			}
//			JSONObject jsonObj = response.geJsonObject("return");
			System.out.println(response.substring(10, 14));
		
			
		}catch(Exception e) {
			System.out.println("Net On Kr Bhai");
		}
		
	}

	
	public static String OTPmsg(String number) {
		//System.out.println("Program Started..............");
		String otpMsg = genrateOTP(6);
		//System.out.println(otpMsg);
		
		String apiKey = "daPiEAuORpMfGgZN6Dnz4JjYsFqtIhw0yl3c7m8CLWeKV9xT2vVBbvTUs3WiJe4NcqG0hXkoD9jlCOpM";
		
		sendOTP("this msg is send by Deepak Gupta for account verification Your OTP is :"+otpMsg,number,apiKey);
		
		return otpMsg;
	}
	
	public static String genrateOTP(int otpLength) {
		Random rand = new Random();
		
		StringBuilder sb = new StringBuilder();
		
		for(int i=0;i<otpLength;i++) {
			sb.append(rand.nextInt(10));
		}
		
		String otp=sb.toString();
		System.out.println(otp);
		return otp;
	}

}
