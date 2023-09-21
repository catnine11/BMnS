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

import com.gd.bmss.mapper.IPayDao;
import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.mapper.UserDaoImpl;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PayModel_JUnitTest {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Autowired
	private IPayDao dao;
	
//	@Test
	public void test() {
		assertNotNull(sql);
	}
	
	@Test
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
	
	
}
