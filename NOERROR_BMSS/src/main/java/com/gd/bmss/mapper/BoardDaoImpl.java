package com.gd.bmss.mapper;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.AskBoardVo;

@Repository
public class BoardDaoImpl implements IBoardDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int insertAskBoard(Map<String, Object> map) {
		return sql.insert("com.gd.bmss.mapper.BoardDaoImpl.insertAskBoard",map);
	}

	@Override
	public int getSeq() {
		return sql.selectOne("com.gd.bmss.mapper.BoardDaoImpl.getSeq");
	}

	@Override
	public AskBoardVo detailAskBoard(String seq) {
		return sql.selectOne("com.gd.bmss.mapper.BoardDaoImpl.detailAskBoard",seq);
	}

	@Override
	public int updateAskBoard(AskBoardVo vo) {
		return sql.update("com.gd.bmss.mapper.BoardDaoImpl.updateAskBoard",vo);
	}

}
