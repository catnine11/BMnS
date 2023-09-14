package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookInfoVo;

public interface IBookManageDao {

	//장르별 전체조회 /회원
	public List<BookInfoVo> getAllBookUser();
	//장르별 전체조회 /관리자
	public List<BookInfoVo> getAllBookAdmin();
	//상세조회
	public BookInfoVo getOneBook(String book_code);
	//장르변경
	public int changeGenre(Map<String, Object> map);
	//상태변경
	public int changeBStatus(Map<String, Object> map);
	//크롤링으로 도서등록
	public int updateBook(BookInfoVo infoVo);
	
	
}
