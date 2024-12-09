package com.java.glowamber.service.store;

import java.util.List;

import com.java.glowamber.model.dto.StoreDTO;

public interface StoreService {
	public List<StoreDTO> selectStoreList(StoreDTO dto);
}
