package com.gd.bmss.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

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

}
