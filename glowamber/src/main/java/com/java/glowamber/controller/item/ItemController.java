package com.java.glowamber.controller.item;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.StoreDTO;
import com.java.glowamber.service.item.ItemService;
import com.java.glowamber.service.store.StoreService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemservice;
	
	/* 상품등록 */
	@RequestMapping("iteminsert")
	public String iteminsert(ItemDTO dto) {
		System.out.println(dto.toString());
		String FileName ="";
		String realFileName = "";
		String path ="";
		String realPath = "";

		MultipartFile file = dto.getFile();
		if(!file.isEmpty()) {
			FileName = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			realFileName = uuid.toString() + "_" + FileName;
			
			path = dto.getPath();
			realPath = path + "resources" + File.separator + "itemThumnail" + File.separator;

			File f = new File(realPath + realFileName);
			
			if (!f.exists()){
	   			f.mkdirs();		
	   		}
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dto.setItemThumnail("/glowamber/resources/itemThumnail/"+realFileName);
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
	
	@PostMapping("itemUpdate") 
	public String updatePage(ItemDTO dto, Model m) {
		/* 재고수량 띄우기 */
		int storecount = 0;
		StoreDTO dto2 = new StoreDTO();
		dto2.setItemNum(dto.getItemNum());
		
		
		List<StoreDTO> result2 = itemservice.SelectStoreCount(dto2);
		
		for(StoreDTO sDto : result2) {
			if(sDto.getStoreStatus().equals("입고")) {
				storecount += sDto.getStoreCount();
			}else if(sDto.getStoreStatus().equals("출고")) {
				storecount -= sDto.getStoreCount();
			}
		}
		
		ItemDTO result = itemservice.SelectItemOne(dto);
		m.addAttribute("item", result);
		m.addAttribute("storecount",storecount);
		return "/AdminPage/ItemUpdate";
	}
	
	/* 상품 입고 */
	@PostMapping("itemStore")
	@ResponseBody
	public void itemStore(StoreDTO dto) {
		itemservice.itemStore(dto);
	}
	
	/* 상품 수정 */
	@PostMapping("itemupdate")
	public String itemUpdate(ItemDTO dto) {
		/* 이미지파일 업로드 */
		String FileName ="";
		String realFileName = "";
		String path ="";
		String realPath = "";

		MultipartFile file = dto.getFile();
		if(!file.isEmpty()) {
			FileName = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			realFileName = uuid.toString() + "_" + FileName;
			
			path = dto.getPath();
			realPath = path + "resources" + File.separator + "itemThumnail" + File.separator;

			File f = new File(realPath + realFileName);
			
			if (!f.exists()){
	   			f.mkdirs();		
	   		}
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dto.setItemThumnail("/glowamber/resources/itemThumnail/"+realFileName);
		itemservice.itemUpdate(dto);
		return "redirect:/AdminPage/ItemList";
	}

}
