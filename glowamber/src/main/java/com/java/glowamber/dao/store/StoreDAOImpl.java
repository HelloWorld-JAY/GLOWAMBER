package com.java.glowamber.dao.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.StoreDTO;

@Repository
public class StoreDAOImpl implements StoreDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<StoreDTO> selectStoreList(StoreDTO dto) {
		return mybatis.selectList("StoreDAO.selectStoreList",dto);
	}
}
