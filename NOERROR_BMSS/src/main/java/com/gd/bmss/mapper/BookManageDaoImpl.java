package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.BookInfoVo;

import lombok.extern.slf4j.Slf4j;

@Repository
public class BookManageDaoImpl implements IBookManageDao {

	private final String NS = "com.gd.bmss.mapper.BookManageDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<BookInfoVo> getAllBookUser() {
		return session.selectList(NS+"getAllBookUser");
	}

	@Override
	public List<BookInfoVo> getAllBookUserGenre(String genre_name) {
		return session.selectList(NS+"getAllBookUserGenre", genre_name);
	}
	
	@Override
	public List<BookInfoVo> getAllBookAdmin() {
		return session.selectList(NS+"getAllBookAdmin");
	}

	@Override
	public BookInfoVo getOneBook(String book_code) {
		return session.selectOne(NS+"getOneBook", book_code);
	}

	@Override
	public int changeGenre(Map<String, Object> map) {
		return session.update(NS+"changeGenre", map);
	}

	@Override
	public int changeBStatus(Map<String, Object> map) {
		return session.update(NS+"changeBStatus", map);
	}

	@Override
	public int updateBook(BookInfoVo infoVo) {
		return session.update(NS+"updateBook", infoVo);
	}

}
