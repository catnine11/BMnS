package com.gd.bmss;



import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.bmss.service.ISearchService;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Paging_Vo;
import com.gd.bmss.vo.UserVo;


@Controller
public class SearchBookController {

	@Autowired
	private ISearchService service;
	
	@GetMapping(value ="/searchBooks.do")
	public String  searchBooks(String selectOpt,String inputVal, Model model
			,@RequestParam(name="page",required = false,defaultValue = "1")int selectPage
			) {
		System.out.println(selectOpt+"@@@@@@@@@@@@");
		System.out.println(inputVal +"@@@@@@@@@@@@");
		Paging_Vo p= new Paging_Vo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(selectOpt != null && selectOpt.equalsIgnoreCase("TITLE")) {
			map.put("column",selectOpt);
			map.put("title", inputVal);
		List<BookInfoVo> bookCount=service.BookCount(map);
		p.setTotalCount(bookCount.size());
		p.setCountList(4);
		p.setCountPage(3);
		p.setTotalPage(p.getTotalCount());
		p.setPage(selectPage);
		p.setStartPage(selectPage);
		p.setEndPage(p.getCountPage());
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("column",selectOpt);
		maps.put("title", inputVal);
		maps.put("first",p.getPage()*p.getCountList()-(p.getCountList()-1));
		maps.put("last", p.getPage()*p.getCountList());
		List<BookInfoVo >lists=service.searchPagingB(maps);
		model.addAttribute("lists",lists);
		model.addAttribute("page",p);
		model.addAttribute("selectOpt",selectOpt);
		model.addAttribute("inputVal",inputVal);
		return"searchBooks";
		}else if( selectOpt != null && selectOpt.equalsIgnoreCase("AUTHOR")) {
			map.put("column",selectOpt);
			map.put("author", inputVal);
			List<BookInfoVo> bookCount=service.BookCount(map);
			
			p.setTotalCount(bookCount.size());
			p.setCountList(4);
			p.setCountPage(3);
			p.setTotalPage(p.getTotalCount());
			p.setPage(selectPage);
			p.setStartPage(selectPage);
			p.setEndPage(p.getCountPage());
			
			Map<String, Object> maps = new HashMap<String, Object>();
			maps.put("column",selectOpt);
			maps.put("author", inputVal);
			maps.put("first",p.getPage()*p.getCountList()-(p.getCountList()-1));
			maps.put("last", p.getPage()*p.getCountList());
			List<BookInfoVo>lists=service.searchPagingB(maps);
			model.addAttribute("lists",lists);
			model.addAttribute("page",p);
			model.addAttribute("selectOpt",selectOpt);
			model.addAttribute("inputVal",inputVal);
			
			return"searchBooks";
		}else if(selectOpt != null && selectOpt.equalsIgnoreCase("ISBN")) {
			map.put("column",selectOpt);
			map.put("isbn", inputVal);
			List<BookInfoVo> bookCount=service.BookCount(map);
			p.setTotalCount(bookCount.size());
			p.setCountList(4);
			p.setCountPage(3);
			p.setTotalPage(p.getTotalCount());
			p.setPage(selectPage);
			p.setStartPage(selectPage);
			p.setEndPage(p.getCountPage());
			Map<String, Object> maps = new HashMap<String, Object>();
			maps.put("column",selectOpt);
			maps.put("isbn", inputVal);
			maps.put("first",p.getPage()*p.getCountList()-(p.getCountList()-1));
			maps.put("last", p.getPage()*p.getCountList());
			List<BookInfoVo >lists=service.searchPagingB(maps);
			
			model.addAttribute("lists",lists);
			model.addAttribute("page",p);
			model.addAttribute("selectOpt",selectOpt);
			model.addAttribute("inputVal",inputVal);
			
			return"searchBooks";
		}
		
		
		return"searchBooks";
		
	}
	
	
	@GetMapping("/searchUsers.do")
	public String searchUsers(  String inputVal, Model model) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("user_email", inputVal);
		
	List<UserVo>	list=service.searchUser(map);
	model.addAttribute("searchUsers",list);
	return "searchUsers";
	}
		
	}
