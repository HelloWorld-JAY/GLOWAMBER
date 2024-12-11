package com.java.glowamber.service.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.item.ItemDAO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.StoreDTO;

@Service
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDAO itemdao;
	
	@Override
	public void iteminsert(ItemDTO dto) {
		itemdao.iteminsert(dto);
	}

	@Override
	public List<ItemDTO> SelectItem(ItemDTO dto) {
		return itemdao.SelectItem(dto);
	}

	@Override
	public ItemDTO SelectItemOne(ItemDTO dto) {
		return itemdao.SelectItemOne(dto);
	}

	@Override
	public void itemStore(StoreDTO dto) {
		itemdao.itemStore(dto);
	}

	@Override
	public void itemUpdate(ItemDTO dto) {
		itemdao.itemUpdate(dto);
	}

	@Override
	public List<StoreDTO> SelectStoreCount(StoreDTO dto) {
		return itemdao.SelectStoreCount(dto);
	}

}
