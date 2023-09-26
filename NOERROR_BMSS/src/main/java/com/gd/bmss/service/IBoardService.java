package com.gd.bmss.service;

import java.util.Map;

import com.gd.bmss.vo.AskBoardVo;

public interface IBoardService {

	public int insertAskBoard(Map<String, Object> map);
	
	public AskBoardVo detailAskBoard(String seq);
	
	public int updateAskBoard(AskBoardVo vo);
}
