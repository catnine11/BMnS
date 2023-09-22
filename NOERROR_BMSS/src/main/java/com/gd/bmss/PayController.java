package com.gd.bmss;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.service.IPayService;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PayController {

	@Autowired
	private IPayService service;
	
	private IamportClient api;

	/*
	 * 토큰발급
	 */
	public PayController(){		
		this.api = new IamportClient("6118522243253633","kYNTXLxk9cL9zBUHjfA44tronZqY8II1YsUmbDDQvY7pnPOAtMdPYcc43fQtw34ud6LP4yP4qn6kY27v");
	}
	@ResponseBody
	@RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
			return api.paymentByImpUid(imp_uid);
	}

	/*
	 * 결제정보입력
	 */
	@RequestMapping("/payForm.do")
	@ResponseBody
	public String insertPayInfoTrans(@RequestParam("amount") String amount,@RequestParam("pay_method") String pay_method, HttpSession session, Model model) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ insertPayInfoTrans 실행 @@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		UserVo uVo = (UserVo) session.getAttribute("loginVo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_money", Integer.parseInt(amount));
		map.put("pay_method", pay_method);
		log.info("@@@@@@@@@@@@@@@@@@@@@@전달받은 값 : [{}],[{}]@@@@@@@@@@@@@@@@@@@@@", uVo, map);
		int n = service.insertPayInfoTrans(map, uVo);
		log.info("@@@@@@@@@@@@@@@@@@@@@@서비스 결과값 : {}@@@@@@@@@@@@@@@@@@@@@", n);
		PayVo infoVo = service.selectPayInfo(n);
		log.info("@@@@@@@@@@infoVo : {}@@@@@@@@@@@@@@@@@@@@", infoVo);
		if (n == 0) {
			return "";
		} else {
			return infoVo.toString();
		}
	}
	
	/*
	 * 결제정보조회리스트
	 */
	@RequestMapping(value = "/payInfo.do")
	public String payInfo(HttpSession session, Model model) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@ 결제정보(리스트)조회 이동 payInfo @@@@@@@@@@@@@@@@@@@@@@");
		UserVo loginVo = (UserVo) session.getAttribute("loginVo");
		List<UserVo> payVo = (List<UserVo>)service.getAllPay(loginVo.getUser_id());
		System.out.println(payVo);
		model.addAttribute("lists",payVo);
		return "payInfo";
	}
}
