package com.java.glowamber.controller.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;
import com.java.glowamber.service.cate.CateService;

@Controller
public class CateController {

	@Autowired
	private CateService CateService;
	
	//대분류 카테고리 불러오기
	@PostMapping("selectbigcate")
	@ResponseBody()
	public List<BigCateDTO> bigCate() {
		return CateService.selectBigCate();
	}
	//소분류 카테고리 불러오기
	@PostMapping("selectsmallcate")
	@ResponseBody()
	public List<SmallCateDTO> smallCate(SmallCateDTO dto) {
		return CateService.selectSmallCate(dto);
	}
	
}
