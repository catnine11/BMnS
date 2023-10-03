package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.AskBoardVo;
import com.gd.bmss.vo.UserVo;

public interface IBoardService {

	public int insertAskBoard(Map<String, Object> map);
	
	public AskBoardVo detailAskBoard(String seq);
	
	public int updateAskBoard(AskBoardVo vo);
	
	public int updatePayStatus(String seq);
	
	public List<AskBoardVo> askBoardList(Map<String,Object> map);
	public int countAskBoard();
}
