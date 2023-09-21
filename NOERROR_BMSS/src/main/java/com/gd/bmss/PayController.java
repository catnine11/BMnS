package com.gd.bmss;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.service.IPayService;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class PayController {


    @Autowired
    private IPayService service;

    /*
     * 결제정보입력 
     */
    @RequestMapping("/payForm.do")
    @ResponseBody
    public String insertPayInfoTrans(@RequestParam("amount")String amount,  @RequestParam("pay_method")String pay_method,HttpSession session) {
    	log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ insertPayInfoTrans 실행 @@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    	UserVo uVo = (UserVo) session.getAttribute("loginVo");
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pay_money", Integer.parseInt(amount)); //수정
    	map.put("pay_method", pay_method);
    	
    	log.info("@@@@@@@@@@@@@@@@@@@@@@전달받은 값 : [{}],[{}]@@@@@@@@@@@@@@@@@@@@@", uVo,map); 
        int n = service.insertPayInfoTrans(map, uVo);
        log.info("@@@@@@@@@@@@@@@@@@@@@@서비스 결과값 : {}@@@@@@@@@@@@@@@@@@@@@", n); 
        if(n == 0) {
        	return "";
        }else {
        	return "";
        }
    }
}
