package com.java.glowamber.service.sociallogin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.java.glowamber.dao.sociallogin.SocialLoginDAO;
import com.java.glowamber.model.dto.MemberDTO;

@Service
public class SocialLoginServiceImpl implements SocialLoginService{



	@Autowired
	public SocialLoginDAO socialLoginDAO;

	@Override
	public String getAccessToken (String authorize_code) {


		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=15fb9c3a60a3c244855ab9c513ece3ee"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/glowamber/member/kakaoLogin"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	@Override
	public MemberDTO getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			System.out.println("[JsonElement]" + element.toString());
			//JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String memberemail = kakao_account.getAsJsonObject().get("email").getAsString();
/*
 {
 	"id":3829824847
 	,"connected_at":"2024-12-11T08:31:44Z"
 	,"kakao_account":{"has_email":true
 						,"email_needs_agreement":false
 						,"is_email_valid":true
 						,"is_email_verified":true
 						,"email":"sungjae0211@naver.com"
 					 }
 }
 */
			userInfo.put("email", memberemail);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// catch 아래 코드 추가.
		MemberDTO result = socialLoginDAO.findkakao(userInfo);

		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("-----------------------> [MemberDTO result]:" + result);
		if(result==null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			socialLoginDAO.kakaoinsert(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return socialLoginDAO.findkakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}

	}
}



