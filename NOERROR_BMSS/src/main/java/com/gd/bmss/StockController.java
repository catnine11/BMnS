package com.gd.bmss;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.service.IStockService;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

@Controller
public class StockController {

	
	@Autowired
	private IStockService service;
	

	@Autowired
	private IStockDao dao;
	
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
	
	@PostMapping(value="/changeStatus.do")
	@ResponseBody
	public Map<String, Object> sellAble(String status ,int num) {
		System.out.println(status);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num",num);
		map.put("status", status);
		service.sellAble(map);
		
		return map;
		
	}
	
	
	@PostMapping(value="/chageBookStatus.do")
	@ResponseBody
	public Book_StatusVo normalToStock(Book_StatusVo vo ) {
	
		dao.normalToStock(vo);
		
		
		return vo;
		
	}
	
	@PostMapping(value="/selectStockable.do")
	public String selectStockable() {
		
		return"selectStockableList";
	}
	
	@RequestMapping(value="/booksDetail.do",method =RequestMethod.POST)
	public String booksDetail() {
	
		return"";
	}
		
	
	
	
	@PostMapping("/stocksDel.do")
	public String stocksDel(String[] delChk,HttpServletResponse resp) throws IOException {
		System.out.println("stocksDel.do");
		System.out.println(delChk.length);
			Map<String, String[]> map =new HashMap<String, String[]>();
		
		
//		if(delChk!=null && delChk.length()>1) {
//			String [] nums =delChk.split(",");
//			map.put("nums", nums);
//			System.out.println(map);
//		dao.stocksDel(map);
//		return "redirect:/stocklist.do";
//		}else if(delChk.length()==0) {
//			
//			String [] nums = {delChk};
//			map.put("nums", nums);
//			dao.stocksDel(map);
//			
//			return "redirect:/stocklist.do";
//		}
//		return "redirect:/stocklist.do";
//		}
	return "";
	
//			
	
		
//			else if(delChk==null) {
//			resp.setCharacterEncoding("UTF-8");
//			resp.setContentType("text/html;charset=UTF-8;");
//
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('재고를 선택해주세요');</script>");
//			out.close();
//			return"redirect:/stocklist.do";
//		}

	}
		
	
	}

	
	

