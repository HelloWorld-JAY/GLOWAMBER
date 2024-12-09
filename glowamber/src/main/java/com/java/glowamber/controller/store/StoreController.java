package com.java.glowamber.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.StoreDTO;
import com.java.glowamber.service.store.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeservice;
	
	@PostMapping("selectStoreList")
	@ResponseBody
	public List<StoreDTO> selectStoreList(StoreDTO dto) {
		System.out.println(dto);
		List<StoreDTO> list = storeservice.selectStoreList(dto);
		System.out.println(list.toString());
		return list;
	}
}
