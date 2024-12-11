package com.java.glowamber.dao.dashboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.StoreDTO;

@Repository
public class DashBoardDAOImpl implements DashBoardDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<StoreDTO> getChartData() {
		List<StoreDTO> list = mybatis.selectList("StoreDAO.selectStoreList");
		System.out.println(list.toString());
		return list;
	}
}
