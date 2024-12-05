package com.java.glowamber.controller.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.service.item.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemservice;
	
	/* 상품등록 */
	@RequestMapping("iteminsert")
	@ResponseBody
	public void iteminsert(ItemDTO dto) {
		itemservice.iteminsert(dto);
	}
	
	/* 상품검색 */
	@RequestMapping("selectitem")
	@ResponseBody
	public List<ItemDTO> SelectItem(ItemDTO dto){
		List<ItemDTO> result = itemservice.SelectItem(dto);
		return result;
	}
	
	/* 상품수정페이지로 이동 */
	
	@GetMapping("itemUpdate") 
	public String updatePage(ItemDTO dto, Model m) {
		ItemDTO result = itemservice.SelectItemOne(dto);
		System.out.println(result.toString());
		m.addAttribute("item", result);
		return "/AdminPage/ItemUpdate";
	}
	
	
}
