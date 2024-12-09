package com.java.glowamber.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.store.StoreDAO;
import com.java.glowamber.model.dto.StoreDTO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storedao;

	@Override
	public List<StoreDTO> selectStoreList(StoreDTO dto) {
		return storedao.selectStoreList(dto);
	}
	
	
}
