package com.gd.bmss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.vo.ClientVo;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.URLVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KakaoController {
	private URLVo uvo = new URLVo();
	private ClientVo cvo = new ClientVo();
	@Autowired
	private IUserDao dao;
	
	private ObjectMapper objmapper = new ObjectMapper();
	
	@RequestMapping(value = "/callBackKAKAOLogin.do")
	public String kakaoCallBack(String code,String state,HttpSession session) {
	    log.info("@@@@@@@@@@@@@@@@ kakaocallback요청 @@@@@@@@@@@@@@@@@@@");
	    log.info("Code : {}", code);
	    log.info("state : {}", state);
	    
		ObjectMapper objmapper = new ObjectMapper();
	    try {
	        URL url = new URL(uvo.getGetKakaoTokenUrl());
	        HttpURLConnection kakaoConn = (HttpURLConnection) url.openConnection();
	        kakaoConn.setRequestMethod("POST");
	        kakaoConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        kakaoConn.setDoOutput(true);
	        
	        String postData = 
	        		"grant_type=authorization_code"
	                + "&client_id=" + cvo.getKakaoClientID()
	                + "&redirect_uri=" + uvo.getKakaoRedirect()
	                + "&code=" + code
	                + "&state=" + state
	                + "&client_secret=" + cvo.getKakaoSecretCode();

	        try (OutputStream os = kakaoConn.getOutputStream()) {
	            byte[] input = postData.getBytes("utf-8");
	            os.write(input, 0, input.length);
	        }

	        int responseCode = kakaoConn.getResponseCode();
	        log.info("@@@@@@@@@@@@@@@@@@@ 입력된 응답코드 : {} @@@@@@@@@@@@@@@@@@@@@@@@@@", responseCode);

	        BufferedReader br;
		      if (responseCode == 200) { 
		        br = new BufferedReader(new InputStreamReader(kakaoConn.getInputStream(),"UTF-8"));
		      } else {  
		        br = new BufferedReader(new InputStreamReader(kakaoConn.getErrorStream(),"UTF-8"));
		      }
		      String inputLine;
		      StringBuilder res = new StringBuilder();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if (responseCode == 200) {
		    	  JsonNode jnode = objmapper.readTree(res.toString());
		    	  String accToken = jnode.get("access_token").toString();
		    	  String refreshToken = jnode.get("refresh_token").toString();
		    	  JsonNode info = getkakaoInfo(accToken);
			    	 if(info!=null) {
			    		 log.info("@@@@@@@@@@@@@@@@전달 받은 회원 정보 :{}@@@@@@@@@@@@@@@@@@@@@@@@@@ ",info);
			    		 String email = info.get("kakao_account").get("email").asText();
			    		 String nickname = info.get("properties").get("nickname").asText();
			    		 String birth = info.path("kakao_account").path("birthyear").asText()+"-"
			    				 		+info.path("kakao_account").path("birthday").asText().substring(0,2)
			    				 		+"-"
			    				 		+info.path("kakao_account").path("birthday").asText().substring(2,4);
			    		 String gubun = "kakao";
			    		 log.info("@@@@@@@@@@@@@@@@@@@추출한 값 : Email : {} / nickname : {} / mobile {}  / birth {} @@@@@@@@@@@@@@@@@@@@@@",email,nickname,nickname,birth);
			    		 SocialVo sVo = new SocialVo();
			    		 sVo.setSocial_email(email);
			    		 sVo.setSocial_name(nickname);
			    		 sVo.setSocial_token(accToken);
			    		 sVo.setSocial_phone("NO PHONE");
			    		 sVo.setSocial_gubun(gubun);
			    		 int n = dao.checkEmail(sVo);
			    		 if(n!=0) {
//			    			 dao.updateRetoken(dao.detailSocial(id));
			    			 UserVo loginVo = new UserVo();
			    			 int id = dao.getSId(sVo);
			    			 loginVo = dao.detailUser(id);
			    			 log.info("!@#!@#!@#!@#!@#!@#loginVo == [{}]!@#!@#!@#!@#!@#!@#",loginVo);
			    			 session.setAttribute("loginVo", loginVo);
			    			 session.setAttribute("info", sVo);
			    			 return "redirect:/";
			    		 }else {
			    			 dao.joinSocial(sVo);
			    			 int id = dao.getSId(sVo);
			    			 UserVo loginVo = dao.detailUser(id);
			    			 log.info("!@#!@#!@#!@#!@#!@#loginVo == [{}]!@#!@#!@#!@#!@#!@#",loginVo);
			    			session.setAttribute("info", sVo);
			    			session.setAttribute("loginVo", loginVo);
			    			return "redirect:/";
			    		 }
			    	 }
		    	 }
	        kakaoConn.disconnect();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "";
	}	  
	public JsonNode getkakaoInfo(String accToken) {
		try {
			URL url = new URL(uvo.getGetKakaorInfo());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer "+accToken);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
                String inputLine;
                StringBuffer response = new StringBuffer();

                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                JsonNode info = objmapper.readTree(response.toString());
                return info;
            } else {
                System.out.println("Error: Response code " + responseCode);
            }
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
