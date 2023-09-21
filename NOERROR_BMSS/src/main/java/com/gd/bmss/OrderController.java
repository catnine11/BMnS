package com.gd.bmss;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.mapper.IOrderDao;
import com.gd.bmss.vo.OrderVo;

import retrofit2.http.GET;

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
		@ResponseBody
		public Map<String, Integer> delOrder(@RequestParam(value = "checkedOrder[]") List<String> delCheck) {
			Map<String, Integer> map =new HashMap<String, Integer>();
			System.out.println(delCheck);	
			int n =		odao.delOrders(delCheck);
			
			map.put("orderdel", n);
			
			return map;
		}
		@RequestMapping(value = "/orderDetail.do",method =RequestMethod.GET )
		public String getDetailOrder(String id,Model model) {
		List<OrderVo> list=	odao.getDetailOrder(id);
		model.addAttribute("detail",list);
			
		return"orderDetail";
		}
		
		@RequestMapping(value="/getOrderUser.do",method = RequestMethod.GET)
		public String getOrderUser(String user,Model model) {
			System.out.println(user+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		List<OrderVo>	list=odao.getOrderUser(user);
		model.addAttribute("oderUser",list);	
		
		return"oderUser";
					
		}
		
		
	
}
