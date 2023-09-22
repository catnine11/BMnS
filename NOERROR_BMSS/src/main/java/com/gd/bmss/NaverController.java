package com.gd.bmss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.URLVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NaverController {

	private URLVo uvo = new URLVo();
	
	@Autowired
	private IUserDao dao;

	private ObjectMapper objmapper = new ObjectMapper();


	@RequestMapping(value = "/callBackNaverLogin.do")
	public String naverCallBack(String code, String state,HttpSession session, Model model) {
		
		log.info("@@@@@@@@@@@@@@ naverCallBack 응답 @@@@@@@@@@@@@@");
		String tokenUrl = uvo.getGetNaverTokenUrl(code, state);
		try {
			URL url = new URL(tokenUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");

			int responseCode = con.getResponseCode();
			log.info("@@@@@@@@@@@@@@응답 받은 코드값 : [{}]@@@@@@@@@@@@@@",responseCode);
			
			BufferedReader br;
			if (responseCode == 200) { 
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { 
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuilder res = new StringBuilder();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			 br.close();
			 if (responseCode == 200) {
		    	 JsonNode jnode = objmapper.readTree(res.toString());
		    	 String accToken = jnode.get("access_token").asText();
		    	 String refreshToken = jnode.get("refresh_token").asText();
		    	 JsonNode info = getInfo(accToken);
		    	 if(info!=null) {
		    		 log.info("@@@@@@@@@@@@@@@@전달 받은 회원 정보 :{}@@@@@@@@@@@@@@@@@@@@@ ",info);
		    		 String email = info.path("response").path("email").asText();
		    		 String name = info.path("response").path("name").asText();
		    		 String phone = info.path("response").path("mobile").asText();
		    		 String gubun = "naver";
		    		 log.info("@@@@@@@@@@@@@@@@추출할 필요 값 : email : {} | name : {}  | phone : {} @@@@@@@@@@@@@@@@@@@@",email,name,phone);
		    		 SocialVo sVo = new SocialVo();
		    		 sVo.setSocial_email(email);
		    		 sVo.setSocial_name(name);
		    		 sVo.setSocial_phone(phone);
		    		 sVo.setSocial_token(refreshToken);
		    		 sVo.setSocial_gubun(gubun);
		    		 int n = dao.checkEmail(sVo);
		    		 if(n!=0) {
//		    			 dao.updateRetoken(sVo);
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
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public JsonNode getInfo(String accessToken) {
		log.info("@@@@@@@@@@@@@@@ getInfo로 이동 @@@@@@@@@@@@@@@@");
		try {
			URL url = new URL(uvo.getGetNaverInfo());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
            int responseCode = conn.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                JsonNode info = objmapper.readTree(response.toString());
                return info;
            } else {
                System.out.println("Error: Response code " + responseCode);
                return null;
            }
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
