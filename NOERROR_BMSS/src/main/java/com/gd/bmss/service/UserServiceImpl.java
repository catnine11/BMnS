package com.gd.bmss.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.model.Message;

@Service
@Slf4j
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao dao;
	
	@Override
	public int joinUser(UserVo vo) {
		log.info("@@@@@@@@@@@@@Service###일반회원가입 joinUser@@@@@@@@@@@@@@@");
		return dao.joinUser(vo);
	}

	@Override
	public int joinSocial(SocialVo vo) {
		log.info("@@@@@@@@@@@@@@@@@Service###소셜회원가입 joinSocial@@@@@@@@@@@@@@@@@");
		return dao.joinSocial(vo);
	}

	@Override
	public UserVo login(Map<String, Object> map) {
	    log.info("@@@@@@@@@@@@@Service###로그인 login@@@@@@@@@@@@@@@");
	    return dao.login( map);
	}

	@Override
	public int getSId(SocialVo vo) {
		log.info("@@@@@@@@@@@@@@회원 고유번호 찾기 getSId @@@@@@@@@@@@@@@@");
		return dao.getSId(vo);
	}
	
	@Override
	public int updateRetoken(SocialVo vo) {
		log.info("@@@@@@@@@@@@@@ 토큰 업데이트 updateRetoken @@@@@@@@@@@@@@@@");
		return dao.updateRetoken(vo);
	}

	@Override
	public int emailCheck(String email) {
		log.info("@@@@@@@@@@@@@@ 중복회원검사 emailCheck @@@@@@@@@@@@@@@@");
		return dao.emailCheck(email);
	}

	@Override
	public String findEmail(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@@@ 이메일찾기 findEmail@@@@@@@@@@@@@@@@");
		return dao.findEmail(map);
	}

	@Override
	public int updatePwd(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@@@ 비밀번호초기화 updatePwd@@@@@@@@@@@@@@@@");
		return dao.updatePwd(map);
	}

	@Override
	public String findPassword(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@@@ 비밀번호찾기 updatePwd@@@@@@@@@@@@@@@@");
		return dao.findPassword(map);
	}
	

}
