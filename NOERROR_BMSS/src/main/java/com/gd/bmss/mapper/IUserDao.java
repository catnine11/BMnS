package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

public interface IUserDao {

	//회원가입
		public int joinUser(UserVo vo);
		
		public int joinSocial(SocialVo vo);
		
	//로그인
		public UserVo login(Map<String, Object> map);
		
	//중복회원검사
		public int emailCheck(String email);
		
	//정보수정
		public int updateUser(UserVo vo);
		
	//관리자 소셜조회
		public List<SocialVo> selectSocial();
		
	//상세조회
		public SocialVo detailSocial(String id);
		
	//회원리스트조회
		public List<UserVo> selectUser();
		
	//회원상세조회
		public UserVo detailUser(String id);
		
	//Email찾기
		public String findEmail(Map<String, Object> map);
		
	//비밀번호찾기
		public String findPassword(Map<String,Object> map);
		
}
