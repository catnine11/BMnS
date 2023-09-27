package com.gd.bmss;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.OrderVo;
import com.gd.bmss.vo.StockVo;
import com.gd.bmss.vo.UserVo;


@Controller
public class OrderController {
	@Autowired
	private IOrderDao odao;
	
	@Autowired
	private IStockDao sdao;
	
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
		public Map<String, Integer> delOrder(@RequestParam(value = "checkedOrder[]",required = false) List<String> delCheck) {
			Map<String, Integer> map =new HashMap<String, Integer>();
			System.out.println(delCheck);	
			int n =0;
			if(delCheck!=null) {
				
				n =		odao.delOrders(delCheck);
			}
			
			
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
		
		//유저 자신의 주문리스트가 있는 페이지로 이동
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
		//판매 가능한 도서를 유저가 조회하는 메소드
		@RequestMapping(value="/getSellableStock.do")
		public String getSellableStock(Model model) {
			
	List<BookInfoVo>	list=	sdao.getSellableStock();
			model.addAttribute("saleList",list);
			return"saleList";
			
		}
		
		
		
		//판매 가능한 도서의 상세를 유저가 조회하는기능
		@RequestMapping(value="/salesDetail.do",method = RequestMethod.GET)
		public String salesDetail(Model model,String book_code) {
			List<BookInfoVo>	list=	sdao.getSalesDetail(book_code);
						model.addAttribute("salesDetail",list);
			
				return "salesDetail";
		}
		
		@PostMapping("/addOrder.do")
		@ResponseBody
		public int addOrder(@RequestParam ("chkArray[]")List<String> chkArray ,HttpSession session) {
			System.out.println(chkArray);
			
			OrderVo vo = new OrderVo();	
			int n=0;
			UserVo  id	=	(UserVo)session.getAttribute("loginVo");
				
			System.out.println(id);
				vo.setUser_id(id.getUser_id());
//			
			for (String string : chkArray) {
				vo.setStock_number(Integer.parseInt(string));
				 n =	odao.addOrder(vo);
				 n++;
			}
				System.out.println(n);
			
			return n;
			
		}
		
		
}
