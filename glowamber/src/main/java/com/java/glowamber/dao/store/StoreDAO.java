package com.java.glowamber.dao.store;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.StoreDTO;

@Repository
public interface StoreDAO {
	public List<StoreDTO> selectStoreList(StoreDTO dto);
}
