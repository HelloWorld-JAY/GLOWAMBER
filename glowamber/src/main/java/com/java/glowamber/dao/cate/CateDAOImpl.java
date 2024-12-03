package com.java.glowamber.dao.cate;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

@Repository
public class CateDAOImpl implements CateDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<BigCateDTO> selectBigCate() {
	
		return mybatis.selectList("CateDAO.SelectBigCate");
	}

	@Override
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto) {
		return mybatis.selectList("CateDAO.SelectSmallCate",dto);
	}

}
