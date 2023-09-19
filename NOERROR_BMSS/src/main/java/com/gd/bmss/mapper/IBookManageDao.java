package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookInfoVo;
/**
 * 도서관리 인터페이스
 * @author 남가람
 * @since 2023.09.14.
 */
public interface IBookManageDao {

	//장르별 전체조회 /회원
	public List<BookInfoVo> getAllBookUser();
	public List<BookInfoVo> getAllBookUserGenre(String genre_name);
	
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
	
	//도서등록
	
	
}
