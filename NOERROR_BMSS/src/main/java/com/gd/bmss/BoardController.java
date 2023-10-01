package com.gd.bmss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.service.IBoardService;
import com.gd.bmss.vo.AskBoardVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Autowired
	private IBoardService service;

	/*
	 * 문의게시판
	 */
	@RequestMapping(value = "/writeAsk.do")
	public String writeAsk() {
		log.info("@@@@@@@@@@@@@@@문의게시판 작성화면 이동 writeAsk : @@@@@@@@@@@@@@@");
		return "writeAskBoard";
	}
	
	@RequestMapping(value = "/write.do")
	public String write(String content, String title, Model model,String seq, HttpSession session) {
		log.info("@@@@@@@@@@@@@@@새문의글 입력 write : {},{}@@@@@@@@@@@@@@@",content+"/",title); /* html이 아니라 마크다운 언어로 전달되면 플러그인에  markdown이 있는지 확인 */
		Map<String, Object>map = new HashMap<String, Object>();
		String escapedContent = org.apache.commons.text.StringEscapeUtils.escapeHtml4(content); /* html tag를 escape 처리함 : '<' -> '&lt;' , commons-lang에도 있지만 Deprecated 됨 */
		log.info("@@@@@@@@@@@@@@@RequestMapping.POST write escapedContent : {}@@@@@@@@@@@@@@@",escapedContent);
		UserVo loginVo = (UserVo)session.getAttribute("loginVo");
		int userId = loginVo.getUser_id();
		map.put("ask_contents", escapedContent);
		map.put("ask_title", title);
		map.put("user_id", userId);
		map.put("user_name", userId);
		int n = service.insertAskBoard(map);
		if(n>0) {
			int m = service.updatePayStatus((String)session.getAttribute("pSeq"));
			model.addAttribute("p_seq",seq);
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@ pSeq 값 : {}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",session.getAttribute("pSeq"));
//			if(m>0) {
//				session.removeAttribute("pSeq");
//			}
		}
		System.out.println("n 값 :" + n);
		return (n==0)?"canclePay":"redirect:/detailAskBoard.do?ask_seq="+n+"&ask_title="+title+"&pay_seq="+session.getAttribute("pSeq"); /* insert가 안됐으면(오류가 났으면) list.jsp 호출, 아니면 상세보기로 이동 */
	}
	
	/*
	 * 문의게시판상세조회
	 */
	@RequestMapping(value="/detailAskBoard.do")
	public String detail(String ask_seq, String ask_title,String pay_seq,Model model) {
		log.info("@@@@@@@@@@@@@@@상세보기로 이동 detail : {} @@@@@@@@@@@@@@@",ask_seq);
		System.out.printf("@@@@@@@@@@@@@@@@@@@@@@상세이동@@@@@@@@@@@@@@@@@@@@"+ask_seq+"@@@@@@"+pay_seq+"@@@@@@@@@@@@\n");
		AskBoardVo content = service.detailAskBoard(ask_seq);
		log.info("@@@@@@@@@@@@@@@상세보기 값 : {} @@@@@@@@@@@@@@@", content);
		String unescapedContent = org.apache.commons.text.StringEscapeUtils.unescapeHtml4(content+"");
		model.addAttribute("pay_seq",pay_seq);
		model.addAttribute("boardVo",content);
		model.addAttribute("ask_contents",unescapedContent);
		model.addAttribute("ask_seq",ask_seq); 
		model.addAttribute("ask_title",ask_title);
		return "detailAskBoard";
	}
	
	/* updateForm으로 이동 */
	@RequestMapping(value="/updateForm.do")
	public String updateForm(String ask_seq,String ask_title, Model model) {
		log.info("@@@@@@@@@@@@@@@문의게시판 수정 updateForm : {} / {} @@@@@@@@@@@@@@@",ask_seq,ask_title);
		model.addAttribute("ask_seq",ask_seq);		
		model.addAttribute("ask_title",ask_title);		
		return "updateAskBoard";
	}
	
	/* updateForm onload시 ajax로 수정할 data를 넘김 */
	@RequestMapping(value="/getContent.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getContent(String ask_seq) {
		log.info("@@@@@@@@@@@@@@@문의게시판 수정 에이젝스 getContent : {}@@@@@@@@@@@@@@@",ask_seq);
		AskBoardVo content = service.detailAskBoard(ask_seq);
		String unescapedContent = org.apache.commons.text.StringEscapeUtils.unescapeHtml4(content.toString());
		
		return unescapedContent;
	}
	
	/* update 쿼리 실행 후 detail 페이지로 이동 */
	@RequestMapping(value="/updateAskBoard.do", method = RequestMethod.POST)
	public String updateBoard(AskBoardVo vo,HttpSession session) {
		log.info("@@@@@@@@@@@@@@@수정후 상세보기 이동 updateBoard : {} / {}@@@@@@@@@@@@@@@",vo.getAsk_seq(),vo);
		service.updateAskBoard(vo);
		return "redirect:/detailAskBoard.do?ask_seq="+vo.getAsk_seq()+"&ask_title="+vo.getAsk_title()+"&pay_seq="+session.getAttribute("pSeq");
	}
	
	/*
	 * 게시판리스트페이지
	 */
	@RequestMapping(value = "/askBoardList.do")
	public String askBoardList(Model model) {
		List<AskBoardVo> lists = service.askBoardList();
		model.addAttribute("lists", lists);
		return "askBoardList";
	}
	
}

