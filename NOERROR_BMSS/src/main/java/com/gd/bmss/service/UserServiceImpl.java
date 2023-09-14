package com.gd.bmss.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IUserDao;
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
	public int joinSocial(UserVo vo) {
		return 0;
	}

	@Override
	public UserVo login(Map<String, Object> map) {
	    log.info("@@@@@@@@@@@@@Service###로그인 login@@@@@@@@@@@@@@@");
	    return dao.login( map);
	}

}
