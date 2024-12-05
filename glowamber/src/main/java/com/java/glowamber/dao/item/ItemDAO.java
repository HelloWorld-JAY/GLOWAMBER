package com.java.glowamber.dao.item;

import java.util.List;

import com.java.glowamber.model.dto.ItemDTO;

public interface ItemDAO {
	public void iteminsert(ItemDTO dto);
	public List<ItemDTO> SelectItem(ItemDTO dto);
	public ItemDTO SelectItemOne(ItemDTO dto);
}
