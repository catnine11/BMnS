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
	
	/**
	 * 관리자가 볼 수 있는 모든 유저들의 주문목록
	 * @param model
	 * @return
	 */
		@GetMapping("/orderlist.do")
		public String orderPage(Model model) {
			
		List<OrderVo> oderList	=odao.getAllOrder();
			model.addAttribute("oderList",oderList);
		return"orderUser";
		}
		
		
		
		/**
		 * 주문 목록삭제 현재 admin에 있음
		 * @param model
		 * @return
		 */
		@PostMapping("/delOrder.do")
		@ResponseBody
		public Map<String, Integer> delOrder(@RequestParam(value = "checkedOrder[]") List<String> delCheck) {
			Map<String, Integer> map =new HashMap<String, Integer>();
			System.out.println(delCheck);	
			int n =		odao.delOrders(delCheck);
			
			map.put("orderdel", n);
			
			return map;
		}
		
		
		/**
		 * 주문 목록 상세 팝업창 현재 admin
		 * @param model
		 * @return
		 */
		
		@RequestMapping(value = "/orderDetail.do",method =RequestMethod.GET )
		public String getDetailOrder(String id,Model model) {
		List<OrderVo> list=	odao.getDetailOrder(id);
		model.addAttribute("detail",list);	
		return"orderDetail";
		}
		
		/**
		 * 회원의 자기 주문내역(장바구니) 조회
		 * @param user  유저번호 
		 * @param model 
		 * @return
		 */
		
		//현재 user의 값을 2로 고정 해 놓았슴 그래서 값을 ${}로바꿔줘야하암 main에서 
		@RequestMapping(value="/oderListUser.do",method = RequestMethod.GET)
		public String getOrderUser(String user,Model model) {
			System.out.println(user+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		List<OrderVo>	list=odao.getOrderUser(user);
		model.addAttribute("orderListUser",list);	
		
		return"orderListUser";
					
		}
		
//		@RequestMapping(value="./oderListUser",method = RequestMethod.GET)
//		public String getOrderUser(String user) {
//			odao.getOrderUser(getOrderUser());
//			return "orderUser";
//		}
}
