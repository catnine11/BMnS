package com.gd.bmss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.vo.StockVo;

@Controller
public class StockController {

	@Autowired
	private IStockDao dao;
	
	@RequestMapping(value = "/stocklist.do",method = RequestMethod.GET)
	public String stockList( HttpServletRequest req ,HttpSession session,Model model) {
		
	List<StockVo>list=	dao.getStocks();
	model.addAttribute("list",list);
	return "stock";
	}
	
	@PostMapping(value="/changePrice.do")
	@ResponseBody
	public String changePrice(String stockNum,String price,Model model){
		Map<String, String> map = new HashMap<String, String>();
		map.put("number", stockNum);
		map.put("price", price);
		 dao.priceChange(map);
		
		return "stock";
	}
	{
		
	}
	
	
}
