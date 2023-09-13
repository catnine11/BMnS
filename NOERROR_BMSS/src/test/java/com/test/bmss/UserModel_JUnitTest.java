package com.test.bmss;

import static org.junit.Assert.*;

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
		UserVo vo = new UserVo(1, "신입유저입니다", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123");
//		SocialVo vo = new SocialVo(1, "123123", "123123", "123123", "123123", "123123", "123123");
		int n = dao.joinUser(vo);
//		int n = dao.joinSocial(vo);
		assertEquals(1, n);
	}
	
	
}
