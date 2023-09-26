package com.test.bmss;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IPayDao;
import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.mapper.UserDaoImpl;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PayModel_JUnitTest {

	@Autowired
	private SqlSessionTemplate sql;
	
	private IamportClient api;
	
	@Autowired
	private IPayDao dao;
	
//	@Test
	public void test() {
		assertNotNull(sql);
	}
	
//	@Test
	public void UserTest() {
		PayVo pVo = new PayVo();
		UserVo uVo = new UserVo();
//		vo.setPay_seq(1);
//		vo.setPay_method("card");
//		vo.setPay_money(105000);
//		int n =dao.insertPayInfo(pVo);
		uVo.setUser_id(2);
		int n = dao.payStatusChange(uVo);
		
		
		assertEquals(1, n);
//		assertNotNull(n);
	}
	public PayModel_JUnitTest(){		
		this.api = new IamportClient("6118522243253633","kYNTXLxk9cL9zBUHjfA44tronZqY8II1YsUmbDDQvY7pnPOAtMdPYcc43fQtw34ud6LP4yP4qn6kY27v");
	}
	@Test
	public void getToken() {
		try {
			IamportResponse<AccessToken> auth_response = api.getAuth();
			assertNotNull(auth_response.getResponse());
			assertNotNull(auth_response.getResponse().getToken());
			
			System.out.println("토큰값#########: " + auth_response.getResponse().getToken());
			
		}catch(IamportResponseException e){
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 : System.out.println("401");break;
			case 500 : System.out.println("500");break;
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
