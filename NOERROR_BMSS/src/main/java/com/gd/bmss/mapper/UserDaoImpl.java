package com.gd.bmss.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

@Repository
public class UserDaoImpl implements IUserDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int joinUser(UserVo vo) {
		return sql.insert("com.gd.bmss.mapper.UserDaoImpl.joinUser",vo);
	}

	@Override
	public int joinSocial(SocialVo vo) {
		return sql.insert("com.gd.bmss.mapper.UserDaoImpl.joinSocial",vo);
	}

}
