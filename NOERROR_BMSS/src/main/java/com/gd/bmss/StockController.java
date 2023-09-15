package com.gd.bmss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {

	
	@RequestMapping(value = "/stocklist.do",method = RequestMethod.GET)
	public String stockList( HttpServletRequest req ,HttpSession session) {
		
		return null;
	}
}
