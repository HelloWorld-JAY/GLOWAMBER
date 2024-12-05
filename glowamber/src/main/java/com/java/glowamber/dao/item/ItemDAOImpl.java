package com.java.glowamber.dao.item;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.StoreDTO;

@Repository
public class ItemDAOImpl implements ItemDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void iteminsert(ItemDTO dto) {
		mybatis.insert("ItemDAO.ItemInsert",dto);
	}

	@Override
	public List<ItemDTO> SelectItem(ItemDTO dto) {
		return mybatis.selectList("ItemDAO.SelectItem",dto);
	}

	@Override
	public ItemDTO SelectItemOne(ItemDTO dto) {
		return mybatis.selectOne("ItemDAO.SelectItemOne",dto);
	}

	@Override
	public void itemStore(StoreDTO dto) {
		mybatis.insert("ItemDAO.itemStore",dto);
	}

	@Override
	public void itemUpdate(ItemDTO dto) {
		mybatis.update("ItemDAO.itemUpdate",dto);
	}

}
