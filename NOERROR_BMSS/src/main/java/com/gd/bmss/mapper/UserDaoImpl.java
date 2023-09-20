package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

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

	@Override
	public UserVo login(Map<String, Object> map) {
	    return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.login", map);
	}

	@Override
	public int emailCheck(String email) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.emailCheck",email);
	}

	@Override
	public int updateUser(UserVo vo) {
		return sql.update("com.gd.bmss.mapper.UserDaoImpl.updateUser",vo);
	}

	@Override
	public List<SocialVo> selectSocial() {
		return sql.selectList("com.gd.bmss.mapper.UserDaoImpl.selectSocial");
	}

	@Override
	public SocialVo detailSocial(int id) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.detailSocial",id);
	}

	@Override
	public List<UserVo> selectUser() {
		return sql.selectList("com.gd.bmss.mapper.UserDaoImpl.selectUser");
	}

	@Override
	public UserVo detailUser(int id) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.detailUser",id);
	}

	@Override
	public String findEmail(Map<String, Object> map) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.findEmail",map);
	}

	@Override
	public String findPassword(Map<String, Object> map) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.findPassword",map);
	}

	@Override
	public int checkEmail(SocialVo vo) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.checkEmail",vo);
	}

	@Override
	public int getSId(SocialVo vo) {
		return sql.selectOne("com.gd.bmss.mapper.UserDaoImpl.getSId",vo);
	}
	
	@Override
	public int updateRetoken(SocialVo vo) {
		return sql.update("com.gd.bmss.mapper.UserDaoImpl.updateRetoken",vo);
	}

	@Override
	public int updatePwd(Map<String, Object> map) {
		return sql.update("com.gd.bmss.mapper.UserDaoImpl.updatePwd",map);
	}
}
