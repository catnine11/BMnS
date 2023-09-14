package com.test.bmss;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.mapper.UserDaoImpl;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserModel_JUnitTest {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Autowired
	private IUserDao dao;
	
//	@Test
	public void test() {
		assertNotNull(sql);
	}
	@Test
	public void UserTest() {
//		UserVo vo = new UserVo(1, "신입유저입니다", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123", null, null);
//		SocialVo vo = new SocialVo(1, "123123", "123123", "123123", "123123", "123123", "123123");
//		int n = dao.joinUser(vo);
//		int n = dao.joinSocial(vo);
		UserVo uVo = new UserVo();
		SocialVo sVo = new SocialVo();
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_email", "admin@naver.com");
//		map.put("user_password", "123123a!");
//		UserVo n =dao.login(map);
//				int n =dao.emailCheck("admin@naver.com");
//		uVo.setUser_address("어디사는지 몰라잉");;
//		uVo.setUser_password("qwe123!@#");
//		uVo.setUser_id(2);
//		int n = dao.updateUser(uVo);
//		List<SocialVo> n =dao.selectSocial();
//		SocialVo n = dao.detailSocial("15");
//		List<UserVo> n = dao.selectUser();
//		UserVo n = dao.detailUser("1");
//		map.put("user_name", "관리자");
//		map.put("user_phone", "123-456-7890");
//		String n = dao.findEmail(map);
		map.put("user_email", "admin@naver.com");
		map.put("user_phone", "123-456-7890");
		String n = dao.findPassword(map);
		
		
		
//		assertEquals(1, n);
		assertNotNull(n);
	}
	
	
}
