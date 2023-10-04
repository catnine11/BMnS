package com.gd.bmss;


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
import com.gd.bmss.vo.Paging_Vo;
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
		public String getSellableStock(Model model ,@RequestParam (name="page",required =false,defaultValue = "1") int selectPage
				) {
		
			System.out.println(selectPage+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			
			
			
	List<BookInfoVo>	list=	sdao.getSellableStock();
			model.addAttribute("saleList",list);
			
			Paging_Vo p = new Paging_Vo();
			//총개시물의 갯수
			p.setTotalCount(list.size());
			//출력될 게시물의개수
			p.setCountList(3);
			//화면에 몇개의 페이지를 보여줄지
			p.setCountPage(3);
			//총페이지 개수 이미 countList를 4로 설정 해줬으니까 totalcount(12)만 
			//설정해주면 토탈페이지는 정해지는데 토탈 카운트도 위에서 설정 해줬으니 get으로 가져올 수 있음
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
		List<BookInfoVo> lists	=sdao.sellStockPaging(map);
			
		model.addAttribute("lists",lists);
		model.addAttribute("page",p);
			//
			
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
		public int addOrder(@RequestParam (value="chkArray[]",required = false)List<String> chkArray ,HttpSession session) {
			System.out.println(chkArray);
			if(chkArray==null) {
				return -2;
			}
			
			int n=0;
			UserVo  id	=	(UserVo)session.getAttribute("loginVo");
			OrderVo vo = new OrderVo();	

			
			session.setMaxInactiveInterval(1800);


				
			System.out.println(id);
//				vo.setUser_id(id.getUser_id());
		List<OrderVo>	oderListU	=odao.getOrderUser(String.valueOf(id.getUser_id()));
				
//현재 주문목록에 동일한 stocknumber를 가진 주문이 있다면 등록하지않고 alert 띄우기		
		vo.setUser_id(id.getUser_id());
		if(oderListU.size()!=0) {
		for (OrderVo orderVo : oderListU) {
			int orderStockNumber = orderVo.getStock_number();
		    boolean stNumIsc = true;
		    
		    System.out.println(orderStockNumber);
		    
		    for (String string : chkArray) {
		        if (orderStockNumber == Integer.parseInt(string)) {
		        	stNumIsc = false;
		            break; 
		        
		        }
		    }

		    if (stNumIsc) {
		    	  vo.setStock_number(orderStockNumber);
			        n = odao.addOrder(vo);
			        n++;
			        System.out.println(n+"stnumisc 부분");
		    } 
		}
		}else {
				for (String string : chkArray) {
					System.out.println(chkArray);
					vo.setStock_number(Integer.parseInt(string));
				n=	odao.addOrder(vo);
				n++;
				 System.out.println(n+"else문 for문");
				}
		}
		System.out.println(n+"@@@@@@@@@@@@@@@@@@@@@@@@@");
		return n;
		
		}	
}
