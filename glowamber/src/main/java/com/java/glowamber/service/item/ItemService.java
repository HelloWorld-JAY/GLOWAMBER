package com.java.glowamber.service.item;

import java.util.List;

import com.java.glowamber.model.dto.ItemDTO;

public interface ItemService {
	public void iteminsert(ItemDTO dto);
	public List<ItemDTO> SelectItem();
}
