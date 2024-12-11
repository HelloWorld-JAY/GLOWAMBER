package com.java.glowamber.dao.item;

import java.util.List;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.StoreDTO;

public interface ItemDAO {
	public void iteminsert(ItemDTO dto);
	public List<ItemDTO> SelectItem(ItemDTO dto);
	public ItemDTO SelectItemOne(ItemDTO dto);
	public void itemStore(StoreDTO dto);
	public void itemUpdate(ItemDTO dto);
	public List<StoreDTO> SelectStoreCount(StoreDTO dto);
}
