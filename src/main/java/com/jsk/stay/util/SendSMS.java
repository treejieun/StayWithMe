package com.jsk.stay.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import com.jsk.stay.dto.SendInfoDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendSMS {
	public String sendCertificateNumber(String to) {
		boolean result=false;
		String certificateNumber=(""+Math.random()).substring(2,8);
		
		System.out.println(certificateNumber);
		SendInfoDto s = new SendInfoDto();
		
		Message coolsms = new Message(s.getApi_key(), s.getApi_secret());
		System.out.println(coolsms);
		
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);
	    params.put("from", "01025746706");
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 ["+certificateNumber+"]입니다");    
	    params.put("app_version", "test app 1.2"); // application name and version    
	    System.out.println(params);
	    
	    try {
	      JSONObject obj = (JSONObject)coolsms.send(params);
	      System.out.println(obj);
	      if(obj.get("success_count").toString().equals("1")){
	    	  result=true;
	      }
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    if(result)
	    	return certificateNumber;
	    else
	    	return "";
	}
}
