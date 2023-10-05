package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.BookDto;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.UserVo;

@Repository
public class SearchDaoImpl implements ISearchDao {

	@Autowired
	private SqlSessionTemplate sql;
	private final String NS="com.gd.bmss.mapper.SearchDaoImpl.";
	@Override
	public List<BookInfoVo> BookCount(Map<String, Object> map) {
			List<BookInfoVo> list	=sql.selectList(NS+"BookCount",map);
		return list;
	}
	@Override
	public List<UserVo> searchUser(Map<String, Object> map) {
			List<UserVo> list=	sql.selectList(NS+"searchUser",map);
		return list;
	}
	@Override
	public boolean saveBook(BookDto dto) {
	int n=	sql.insert(NS+"saveBook",dto);
		
		
		return n>0?true:false;
	}
	@Override
	public List<BookInfoVo> searchPagingB(Map<String, Object> map) {
	List<BookInfoVo>	list=sql.selectList(NS+"searchPagingB",map);
		return list;
	}
	

}
