package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IBoardDao;
import com.gd.bmss.vo.AskBoardVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardDao dao;
	
	@Override
	public int insertAskBoard(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@@@@ 문의게시판 작성 insertAskBoard @@@@@@@@@@@@@@@");
		int n = dao.insertAskBoard(map);
		int m = (n>0)?dao.getSeq():0;
		return m;
	}

	@Override
	public AskBoardVo detailAskBoard(String seq) {
		log.info("@@@@@@@@@@@@@@@ 문의게시판상세보기 detailAskBoard @@@@@@@@@@@@@@@");
		return dao.detailAskBoard(seq);
	}

	@Override
	public int updateAskBoard(AskBoardVo vo) {
		log.info("@@@@@@@@@@@@@@@ 문의게시판수정 updateAskBoard @@@@@@@@@@@@@@@");
		return dao.updateAskBoard(vo);
	}
	
	@Override
	public int updatePayStatus(String seq) {
		log.info("@@@@@@@@@@@@@@@ 문의게시판입력시 상태변경 updatePayStatus @@@@@@@@@@@@@@@");
		return dao.updatePayStatus(seq);
	}
	
	@Override
	public List<AskBoardVo> askBoardList() {
		log.info("@@@@@@@@@@@@@@@ 문의게시판리스트보기 askBoardList @@@@@@@@@@@@@@@");
		return dao.askBoardList();
	}
}
