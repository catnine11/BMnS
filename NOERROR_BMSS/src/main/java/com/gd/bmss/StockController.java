package com.gd.bmss;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.service.IStockService;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.Paging_Vo;
import com.gd.bmss.vo.StockVo;

@Controller
public class StockController {

	
	@Autowired
	private IStockService service;
	

	
	@RequestMapping(value = "/stocklist.do",method = RequestMethod.GET)
	public String stockList( Model model) {
		
	List<StockVo>list=	service.getStocks();
	model.addAttribute("list",list);
	return "stock";
	}
	
	@PostMapping(value="/changePrice.do")
	@ResponseBody
	public Map<String, String> changePrice(String stockNum,String price){
		Map<String, String> map = new HashMap<String, String>();
		map.put("number", stockNum);
		map.put("price", price);
		 service.priceChange(map);
		
		return map;
	}
	
	
	
	@PostMapping(value="/chageBookStatus.do")
	@ResponseBody
	public Book_StatusVo normalToStock(Book_StatusVo vo ) {
	
		service.normalToStock(vo);
		return vo;
		
	}
	
	
	
	
	@PostMapping(value="/selectStockable.do")
	public String selectStockable() {
		
		return"selectStockableList";
	}
	
	@RequestMapping(value="/booksDetail.do",method =RequestMethod.POST)
	@ResponseBody
	public List<StockVo> booksDetail(Model model, String seq) {
		
	List<StockVo>	list=service.booksDetail(seq);
	
		model.addAttribute("detailList",list);
		return list;
	}

		
	
	
	
	@PostMapping("/stocksDel.do")
	@ResponseBody
	public Map<String, Integer> stocksDel( @RequestParam(value="checkedNums[]",required = false) List<String> checkedNums,HttpServletResponse resp){
		System.out.println("stocksDel.do");
		System.out.println((checkedNums));
		int n =0;
		if (checkedNums != null ) {
			n 	=service.stocksDel(checkedNums);
		}
		
		System.out.println(n);
		Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("result", n);
	return map ;
	

	}
	@RequestMapping(value="/inStock.do",method = RequestMethod.GET)
	public String cronStockList(Model model,@RequestParam (name="page",required =false,defaultValue = "1") int selectPage
			,HttpSession session) {
		
	List<StockVo>	list	=service.getInStock();
		
		model.addAttribute("getInStock",list);
		
		Paging_Vo p = new Paging_Vo();
		//총개시물의 갯수
		p.setTotalCount(list.size());
		//출력될 게시물의개수
		p.setCountList(7);
		//화면에 몇개의 페이지를 보여줄지
		p.setCountPage(3);
		//총페이지 개수 
		p.setTotalPage(p.getTotalCount());
		//현재 페이지번호
		p.setPage(selectPage);
		//시작 페이지번호
		p.setStartPage(selectPage);
		//끝페이지
		p.setEndPage(p.getCountPage());
		//보여지는 게시물의 첫번째와 마지막을 설정하는 것 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("first",p.getPage()*p.getCountList()-(p.getCountList()-1));//
		map.put("last", p.getPage()*p.getCountList());//현재페이지
		//출력(게시글,페이지객체)
	List<StockVo> lists	=service.inStockPaging(map);
		
	model.addAttribute("lists",lists);
	model.addAttribute("page",p);
		
		
		return "inStock";
		
	}
		
	
	}

	
	

