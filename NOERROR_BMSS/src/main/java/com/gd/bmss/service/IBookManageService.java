package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;

public interface IBookManageService {

	//장르별 전체조회 /회원
	public List<BookInfoVo> getAllBookUser();
	public List<BookInfoVo> getAllBookUserGenre(String genre_name);

	public List<BookInfoVo> getAllBookUserPaging(Map<String, Object> map);
	public List<BookInfoVo> getAllBookUserGenrePaging(Map<String, Object> map);
	
	//장르별 전체조회 /관리자
	public List<BookInfoVo> getAllBookAdmin();
	public List<BookInfoVo> getAllBookAdminPaging(Map<String, Object> map);
	//상세조회
	public BookInfoVo getOneBook(String book_code);
	//상세조회-상태
//	public List<Book_StatusVo> getOneBookStatus(String book_code);
	public BookInfoVo getOneBookStatus(String book_code);
	//장르변경
	public int changeGenre(Map<String, Object> map);
	//상태변경
	public int changeBStatus(Map<String, Object> map);
	
	//크롤링으로 도서등록
	public int updateBook(BookInfoVo infoVo);
		
	
	public int countBook();
	public int countGenreBook(int genre_code);
	
}
