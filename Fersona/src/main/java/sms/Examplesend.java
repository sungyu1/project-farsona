package sms;

import java.util.HashMap;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Examplesend {
	
	//public String sms_key(String user_num) {
	//public static void main(String[] args) {
	//public String aa() {
	//public void certifiedPhoneNumber(String user_num, String key) {
		public void certifiedPhoneNumber(String user_num, String key) {
		String api_key = "NCS17A2YB1EP4DOI";
		String api_secret = "LFE9QFSFKAVOLFLMAVSRQWDAZ6ATSCIA";
		Message coolsms = new Message(api_key, api_secret);

		// 랜덤숫자6자리 선정
		/*
		 * Random rd = new Random(); String key = ""; // 인증키 생성 for (int i = 0; i < 6;
		 * i++) { String num = Integer.toString(rd.nextInt(10)); key += num; }
		 * System.out.println("인증번호 생성완료 : " + key);
		 */

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", user_num); 
		// 최훈철 번호로 현재 발송중
		params.put("from", "01049023489"); // 발신번호 발신번호 사전등록제로 인해 등록된 발신번호로만 문자를 보내실 수 있음
		params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
		params.put("text", "[CATCH FACE] 본인확인을 위해 인증번호 [" + key + "]을 입력해주세요."); // 문자내용
		params.put("app_version", "JAVA SDK v1.2"); // application name and version
		params.put("mode", "test"); // 'test' 모드. 실제로 발송되지 않으며 전송내역에 60 오류코드로 뜹니다. 차감된 캐쉬는 다음날 새벽에 충전 됩니다.

		// Optional parameters for your own needs
		// params.put("image", "desert.jpg"); // image for MMS. type must be set as
		// "MMS"
		// params.put("image_encoding", "binary"); // image encoding binary(default),
		// base64
		// params.put("delay", "10"); // 0~20사이의 값으로 전송지연 시간을 줄 수 있습니다.
		// params.put("force_sms", "true"); // 푸시 및 알림톡 이용시에도 강제로 SMS로 발송되도록 할 수 있습니다.
		// params.put("refname", ""); // Reference name
		// params.put("country", "KR"); // Korea(KR) Japan(JP) America(USA) China(CN)
		// Default is Korea
		// params.put("sender_key", "5554025sa8e61072frrrd5d4cc2rrrr65e15bb64"); // 알림톡
		// 사용을 위해 필요합니다. 신청방법 : http://www.coolsms.co.kr/AboutAlimTalk
		// params.put("template_code", "C004"); // 알림톡 template code 입니다. 자세한 설명은
		// http://www.coolsms.co.kr/AboutAlimTalk을 참조해주세요.
		// params.put("datetime", "20140106153000"); // Format must be(YYYYMMDDHHMISS)
		// 2014 01 06 15 30 00 (2014 Jan 06th 3pm 30 00)
		// params.put("mid", "mymsgid01"); // set message id. Server creates
		// automatically if empty
		// params.put("gid", "mymsg_group_id01"); // set group id. Server creates
		// automatically if empty
		// params.put("subject", "Message Title"); // set msg title for LMS and MMS
		// params.put("charset", "euckr"); // For Korean language, set euckr or utf-8
		// params.put("app_version", "Purplebook 4.1") // 어플리케이션 버전

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		//return key;
		}
	
}
