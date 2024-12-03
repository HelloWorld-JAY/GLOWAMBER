package com.java.glowamber.dao.item;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.ItemDTO;

@Repository
public class ItemDAOImpl implements ItemDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void iteminsert(ItemDTO dto) {
		mybatis.insert("ItemDAO.ItemInsert",dto);
	}

	@Override
	public List<ItemDTO> SelectItem() {
		return mybatis.selectList("ItemDAO.SelectItem");
	}

}
