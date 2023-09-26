package com.gd.bmss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.bmss.mapper.ISearchDao;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.UserVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class SearchBookController {

	@Autowired
	private ISearchDao sdao;
	
	@PostMapping(value ="/searchBooks.do")
	public String  searchBooks(String selectOpt,String inputVal, Model model) {
		System.out.println(selectOpt+"@@@@@@@@@@@@");
		System.out.println(inputVal +"@@@@@@@@@@@@");
		Map<String, Object> map = new HashMap<String, Object>();
		if(selectOpt.equals("TITLE")) {
			map.put("column",selectOpt);
			map.put("title", inputVal);
		List<BookInfoVo> bookList=sdao.searchBooks(map);
		model.addAttribute("bookList",bookList);
		return"searchBooks";
		}else if(selectOpt.equals("AUTHOR")) {
			map.put("column",selectOpt);
			map.put("author", inputVal);
			List<BookInfoVo> bookList=sdao.searchBooks(map);
			model.addAttribute("bookList",bookList);
			return"searchBooks";
		}else if(selectOpt.equals("ISBN")) {
			map.put("column",selectOpt);
			map.put("isbn", inputVal);
			List<BookInfoVo> bookList=	sdao.searchBooks(map);
			model.addAttribute("bookList",bookList);
			return"searchBooks";
		}
	    List<BookInfoVo> bookList = sdao.searchBooks(map);
	    model.addAttribute("bookList", bookList);
		return"searchBooks";
		
	}
	
	
	@PostMapping("/searchUsers.do")
	public String searchUsers(  String inputVal, Model model) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("user_email", inputVal);
		
	List<UserVo>	list=sdao.searchUser(map);
	model.addAttribute("searchUsers",list);
	return "searchUsers";
	}
	
	
	
	
	
	
}
