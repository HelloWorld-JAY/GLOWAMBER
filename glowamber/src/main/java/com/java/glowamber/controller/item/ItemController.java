package com.java.glowamber.controller.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.StoreDTO;
import com.java.glowamber.service.item.ItemService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemservice;
	
	/* 상품등록 */
	@RequestMapping("iteminsert")
	public String iteminsert(ItemDTO dto) {
		System.out.println(dto.toString());
		itemservice.iteminsert(dto);
		return "redirect:/AdminPage/ItemList";
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
		m.addAttribute("item", result);
		return "/AdminPage/ItemUpdate";
	}
	
	/* 상품 입고 */
	@PostMapping("itemStore")
	@ResponseBody
	public void itemStore(StoreDTO dto) {
		System.out.println(dto);
		itemservice.itemStore(dto);
	}
	
	/* 상품 수정 */
	@PostMapping("itemupdate")
	public String itemUpdate(ItemDTO dto) {
		System.out.println(dto.toString());
		itemservice.itemUpdate(dto);
		return "redirect:/AdminPage/ItemList";
	}
	
}
