package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookDto;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.UserVo;

public interface ISearchService {
	
	public List<BookInfoVo>BookCount(Map<String, Object>map);
	public List<UserVo>searchUser(Map<String, Object>map);
	public boolean saveBook(BookDto dto);
	public List<BookInfoVo>searchPagingB(Map<String, Object>map);

}
