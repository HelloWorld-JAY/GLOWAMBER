package com.java.glowamber.controller.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.service.item.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemservice;
	
	@RequestMapping("iteminsert")
	@ResponseBody
	public void iteminsert(ItemDTO dto) {
		itemservice.iteminsert(dto);
	}
	
	@RequestMapping("selectitem")
	@ResponseBody
	public List<ItemDTO> SelectItem(){
		return itemservice.SelectItem();
	}
}
