package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IBookManageDao;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookManageServiceImpl implements IBookManageService {

	@Autowired
	IBookManageDao dao;

	@Override
	public List<BookInfoVo> getAllBookUser() {
		log.info("@@@@@@@@@@@BookManageServiceImpl getAllBookAdmin 회원의 장르별 전체 조회");
		return dao.getAllBookUser();
	}

	@Override
	public List<BookInfoVo> getAllBookUserGenre(String genre_name) {
		log.info("@@@@@@@@@@@BookManageServiceImpl getAllBookAdmin 회원의 장르별 조회 {}",  genre_name);
		return dao.getAllBookUserGenre(genre_name);
	}
	
	@Override
	public List<BookInfoVo> getAllBookAdmin() {
		log.info("@@@@@@@@@@@BookManageServiceImpl getAllBookAdmin 관리자의 장르별 전체 조회");
		return dao.getAllBookAdmin();
	}

	@Override
	public BookInfoVo getOneBook(String book_code) {
		log.info("@@@@@@@@@@@BookManageServiceImpl getOneBook 상세조회 {}", book_code);
		return dao.getOneBook(book_code);
	}
	@Override
//	public List<Book_StatusVo> getOneBookStatus(String book_code) {
	public BookInfoVo getOneBookStatus(String book_code) {
		log.info("@@@@@@@@@@@BookManageServiceImpl getOneBookStatus 상세조회 {}", book_code);
		return dao.getOneBookStatus(book_code);
	}

	@Override
	public int changeGenre(Map<String, Object> map) {
		log.info("@@@@@@@@@@@BookManageServiceImpl changeGenre 장르변경 {}", map);
		return dao.changeGenre(map);
	}

	@Override
	public int changeBStatus(Map<String, Object> map) {
		log.info("@@@@@@@@@@@BookManageServiceImpl changeBStatus 상태변경 {}", map);
		return dao.changeBStatus(map);
	}

	@Override
	public int updateBook(BookInfoVo infoVo) {
		log.info("@@@@@@@@@@@BookManageServiceImpl updateBook 크롤링으로 등록업뎃", infoVo);
		return dao.updateBook(infoVo);
	}

	
	
}
