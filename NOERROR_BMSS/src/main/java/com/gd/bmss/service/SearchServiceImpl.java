package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.ISearchDao;
import com.gd.bmss.vo.BookDto;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SearchServiceImpl implements ISearchService {
	@Autowired
	private ISearchDao dao;
	
	@Override
	public List<BookInfoVo> BookCount(Map<String, Object> map) {
		log.info("검색 조건에 맞는 도서의 총개수 페이징의 전체 게시물 개수(totalcount)로 사용됨 BookCount");
		return dao.BookCount(map);
	}
	@Override
	public List<BookInfoVo> searchPagingB(Map<String, Object> map) {
		log.info("유저가 제목,저자,ISBN 키워드로 도서를 검색하는 메소드+페이징 searchPagingB ");
		return dao.searchPagingB(map);
	}

	@Override
	public List<UserVo> searchUser(Map<String, Object> map) {
		log.info("관리자가 유저의 이메일을 키워드로 유저 정보를 조회하는 메소드 searchUser");

		return dao.searchUser(map);
	}

	@Override
	public boolean saveBook(BookDto dto) {
		log.info("카카오 API를 이용하여 도서등록 더미를 등록하는 메소드 saveBook");
		return dao.saveBook(dto);
	}


}
