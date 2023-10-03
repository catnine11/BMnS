package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.AskBoardVo;
import com.gd.bmss.vo.UserVo;

public interface IBoardDao {

	//문의게시판작성
	public int insertAskBoard(Map<String, Object> map);
	
	//maxseq가져오기
	public int getSeq();
	
	//문의게시판상세보기
	public AskBoardVo detailAskBoard(String seq);
	
	//문의게시판 수정	
	public int updateAskBoard(AskBoardVo vo);
	
	//결제취소신청시 상태변경
	public int updatePayStatus(String seq);
	
	//문의게시판 상세보기
	public List<AskBoardVo> askBoardList(Map<String,Object> map);
	public int countAskBoard();
	
}
