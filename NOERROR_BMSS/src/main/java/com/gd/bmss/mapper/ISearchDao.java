package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.UserVo;
import com.gd.bmss.vo.BookDto;

public interface ISearchDao {

	public List<BookInfoVo>BookCount(Map<String, Object>map);
	public List<UserVo>searchUser(Map<String, Object>map);
	public boolean saveBook(BookDto dto);
	public List<BookInfoVo>searchPagingB(Map<String, Object>map);
}
