package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;

@Repository
public class PayDaoImpl implements IPayDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int insertPayInfo(Map<String, Object> map) {
		return sql.insert("com.gd.bmss.mapper.PayDaoImpl.insertPayInfo",map);
	}

	@Override
	public int payStatusChange(UserVo id) {
		return sql.update("com.gd.bmss.mapper.PayDaoImpl.payStatusChange",id);
	}

	@Override
	public int okPayStatusChange(String id) {
		return sql.update("com.gd.bmss.mapper.PayDaoImpl.okPayStatusChange",id);
	}

	@Override
	public List<UserVo> selectStatusNum2(int seq) {
		return sql.selectList("com.gd.bmss.mapper.PayDaoImpl.selectStatusNum2",seq);
	}

}
