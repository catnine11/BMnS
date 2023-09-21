package com.gd.bmss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.bmss.mapper.ISearchDao;
import com.gd.bmss.vo.BookInfoVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class SearchBookController {

	@Autowired
	private ISearchDao sdao;
	
	@PostMapping(value ="/searchBooks.do")
	public String  searchBooks(String selectOpt,String inputVal, Model model) {
		System.out.println(selectOpt+"@@@@@@@@@@@@");
		System.out.println(inputVal +"@@@@@@@@@@@@");
		if(selectOpt=="TITLE") {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("column",selectOpt);
			map.put("title", inputVal);
		List<BookInfoVo> bookList=sdao.searchBooks(map);
		model.addAttribute("bookList",bookList);
		return"searchBooks";
		}else if(selectOpt=="AUTHOR") {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("column",selectOpt);
			map.put("author", inputVal);
			List<BookInfoVo> bookList=sdao.searchBooks(map);
			model.addAttribute("bookList",bookList);
			return"searchBooks";
		}else if(selectOpt=="ISBN") {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("column",selectOpt);
			map.put("isbn", inputVal);
			List<BookInfoVo> bookList=	sdao.searchBooks(map);
			model.addAttribute("bookList",bookList);
			return"searchBooks";
		}

		return"searchBooks";
		
	}
	
	
}
