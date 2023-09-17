package com.gd.bmss;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.bmss.mapper.IOrderDao;
import com.gd.bmss.vo.OrderVo;

@Controller
public class OrderController {
	@Autowired
	private IOrderDao odao;
		@GetMapping("/orderlist.do")
		public String orderPage(Model model) {
			
		List<OrderVo> oderList	=odao.getAllOrder();
			model.addAttribute("oderList",oderList);
		return"order";
		}
		
		@PostMapping("/delOrder.do")
		public String delOrder(String delCheck) {
			
			if(delCheck.length()>1) {
				String [] stockNum	=delCheck.split(",");
				
				System.out.println(stockNum+"@@@@@@@@@@@@@@@@@@@@@@@@@@");
				List<String> stokcList =Arrays.asList(stockNum);
				System.out.println(stokcList+"@@@@@@@@@@@@@@@@@@@@2");
				odao.delOrders(stokcList);
				return"redirect:/orderlist.do";
			}
			List<String> list = new ArrayList<>();
			list.add(delCheck);
//			List<String> stokcList =Arrays.asList(delCheck);
			odao.delOrders(list);
			
			return"redirect:/orderlist.do";
		}
	
}
