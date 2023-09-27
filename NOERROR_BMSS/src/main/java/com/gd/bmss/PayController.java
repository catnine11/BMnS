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
import com.gd.bmss.vo.PayStatusVo;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
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
	public String insertPayInfoTrans(@RequestParam("amount") String amount,@RequestParam("pay_method") String pay_method,@RequestParam("imp_uid") String imp_uid, HttpSession session, Model model) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ insertPayInfoTrans 실행 @@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		UserVo uVo = (UserVo) session.getAttribute("loginVo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_money", Integer.parseInt(amount));
		map.put("pay_method", pay_method);
		map.put("imp_uid", imp_uid);
		log.info("@@@@@@@@@@@@@@@@@@@@@@전달받은 값 : [{}],[{}]@@@@@@@@@@@@@@@@@@@@@", uVo, map);
		int n = service.insertPayInfoTrans(map, uVo);
		log.info("@@@@@@@@@@@@@@@@@@@@@@서비스 결과값 : {}@@@@@@@@@@@@@@@@@@@@@", n);
		PayVo infoVo = service.selectPayInfo(n);
		log.info("@@@@@@@@@@infoVo : {}@@@@@@@@@@@@@@@@@@@@", infoVo);
		if (n == 0) {
			return "";
		} else {
			return infoVo+"";
		}
	}
	
	/*
	 * 결제정보조회리스트
	 */
	@RequestMapping(value = "/payInfo.do")
	public String payInfo(HttpSession session, Model model) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@ 결제정보(리스트)조회 이동 payInfo @@@@@@@@@@@@@@@@@@@@@@");
		UserVo loginVo = (UserVo) session.getAttribute("loginVo");
		List<PayVo> payVo = (List<PayVo>)service.getAllPay(loginVo.getUser_id());
		System.out.println(payVo);
		for(int i= 0; i<payVo.size(); i++) {
			int a = payVo.get(i).getPay_seq();
			model.addAttribute("psVo",service.getPayStatus(a));
		}
		model.addAttribute("lists",payVo);
		return "payInfo";
	}
	
	/*
	 * 결제상세조회
	 */
	@RequestMapping(value = "/detailPay.do")
	public String detailPay(Model model, @RequestParam("pay_seq")String pay_seq,HttpSession session) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@ 결제정보상세조회 이동 detailPay @@@@@@@@@@@@@@@@@@@@@@");
		String seq = pay_seq;
		UserVo id = (UserVo)session.getAttribute("loginVo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_seq", seq);
		map.put("user_id", id.getUser_id());
		service.detailPay(map);
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@상세조회값 : {} @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",service.detailPay(map));
		model.addAttribute("detailPay",service.detailPay(map));
		session.setAttribute("pSeq", pay_seq);
		return "detailPay";
	}
	/*
	 * 결제취소
	 */
	@RequestMapping(value = "/canclePay.do")
	public String canclePay() {
		log.info("@@@@@@@@@@@@@@@@@@@@@@ 결제취소문의 이동 canclePay @@@@@@@@@@@@@@@@@@@@@@");
		return "writeAskBoard";
	}
	
	@RequestMapping(value = "/canclePayInfo.do", method = RequestMethod.POST)
	public String testCancelPaymentAlreadyCancelledImpUid(HttpSession session, String pay_seq) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@ 결제환불기능 testCancelPaymentAlreadyCancelledImpUid @@@@@@@@@@@@@@@@@@@@@@");
		String seq = pay_seq;
		String imp_uid = service.findImpUID(seq);
        String test_already_cancelled_imp_uid = imp_uid;
        CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
        log.info("@@@@@@@@@@@@@환불완료.@@@@@@@@@@@@@@@ {}", cancel_data);
        service.okPayStatusChange(seq);
        try {
            IamportResponse<Payment> payment_response = api.cancelPaymentByImpUid(cancel_data);
           
            if(payment_response.getResponse() == null) {
            	log.info("@@@@@@@@@@@@@이미 처리된 환불.@@@@@@@@@@@@@@@");
            }
//            assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    break;
                case 500:
                    break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "payInfo";
    }

}
