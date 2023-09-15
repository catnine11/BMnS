package com.gd.bmss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
import com.gd.bmss.vo.ClientVo;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.URLVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class GoogleController {
	private URLVo uvo = new URLVo();
	private ClientVo cvo = new ClientVo();
	private ObjectMapper objmapper = new ObjectMapper();
	private SocialVo vo;
	@Autowired
	private IUserDao dao;
	
	@RequestMapping(value = "/callbackgoogle.do")
	public String googlCallBack(String code, String state,HttpSession session, Model model) {
		log.info("Welcome HomeController > googlCallBack");
	    log.info("Code : {}", code);
	    log.info("state : {}", state);
	    try {
			URL url = new URL(uvo.getGetGoogleTokenUrl()); 
			HttpURLConnection googleConn = (HttpURLConnection)url.openConnection();
			googleConn.setRequestMethod("POST");
			googleConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			googleConn.setDoOutput(true);
			
			String postData="grant_type=authorization_code"
	                + "&client_id=" + cvo.getGoogleClientID()
	                + "&redirect_uri=" + uvo.getGoogleRedirect()
	                + "&code=" + code
	                + "&state="+state
	                + "&client_secret=" + cvo.getGoogleSecretCode();
			 try (OutputStream os = googleConn.getOutputStream()) {
		            byte[] input = postData.getBytes("UTF-8");
		            os.write(input, 0, input.length);
		        }

		        int responseCode = googleConn.getResponseCode();
		        log.info("responseCode : {}", responseCode);
		        BufferedReader br;
			      if (responseCode == 200) { 
			        br = new BufferedReader(new InputStreamReader(googleConn.getInputStream(),"UTF-8"));
			      } else {  
			        br = new BufferedReader(new InputStreamReader(googleConn.getErrorStream(),"UTF-8"));
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
			    	  JsonNode info = getGoogleInfo(accToken);
			    	  if(info !=null) {
			    		  log.info("전발 받은 회원 정보 :{} ",info);
				    		 //값을 추출하기
				    		 String email = info.get("email").asText();
				    		 String name = info.get("name").asText();
				    		 String nickname = info.get("name").asText();
				    		 String gubun = "google";
				    		 log.info("추출한 값 : Email : {} / name : {}  / nickname : {} ",email,name,nickname);
				    		 SocialVo sVo = new SocialVo();
				    		 sVo.setSocial_email(email);
				    		 sVo.setSocial_name(name);
				    		 sVo.setSocial_phone("NO PHONE");
				    		 sVo.setSocial_token(accToken);
				    		 sVo.setSocial_gubun(gubun);
				    		 int n = dao.checkEmail(sVo);
				    		 if(n!=0) {
				    			 UserVo loginVo = new UserVo();
				    			 int id = dao.getSId(sVo);
				    			 loginVo = dao.detailUser(id);
				    			 log.info("!@#!@#!@#!@#!@#!@#loginVo == [{}]!@#!@#!@#!@#!@#!@#",loginVo);
				    			 session.setAttribute("loginVo", loginVo);
				    			 session.setAttribute("info", vo);
				    			 return "redirect:/";
				    		 }else {
				    			 dao.joinSocial(sVo);
				    			 int id = dao.getSId(sVo);
					    			UserVo loginVo = dao.detailUser(id);
					    			log.info("!@#!@#!@#!@#!@#!@#loginVo == [{}]!@#!@#!@#!@#!@#!@#",loginVo);
					    			session.setAttribute("loginVo", loginVo);
				    			session.setAttribute("info", vo);
				    			 return "redirect:/";
				    		 }
				    			 
			    	  	}
			    	 }
			      googleConn.disconnect();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public JsonNode getGoogleInfo(String accToken) {
		try {
			URL url = new URL(uvo.getGetGoogleInfo());
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
                //JSON 파싱
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
