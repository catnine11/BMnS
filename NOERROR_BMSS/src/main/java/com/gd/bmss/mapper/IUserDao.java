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
		
	//리프레시토큰 최신화
		public int updateRetoken(SocialVo vo);
		
	//중복회원검사
		public int emailCheck(String email);
		
		public int checkEmail(SocialVo vo);
		
	//정보수정
		public int updateUser(UserVo vo);
		
	//비밀번호초기화
		public int updatePwd(Map<String, Object> map);
		
	//관리자 소셜조회
		public List<SocialVo> selectSocial();
		
	//상세조회
		public SocialVo detailSocial(int id);
		
	//회원리스트조회
		public List<UserVo> selectUser();
		
	//회원상세조회
		public UserVo detailUser(int id);
		
	//Email찾기
		public String findEmail(Map<String, Object> map);
		
	//비밀번호찾기
		public String findPassword(Map<String,Object> map);
		
	//소셜고유번호찾기
		public int getSId(SocialVo vo);
		
}
