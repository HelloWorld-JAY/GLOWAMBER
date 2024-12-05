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
	
	//대분류 카테고리 입력
	@PostMapping("bigcateinsert")
	@ResponseBody()
	public void BigCateInsert(BigCateDTO dto) {
		 CateService.insertBigCate(dto);
	}
	
	//소분류 카테고리 입력
	@PostMapping("smallcateinsert")
	@ResponseBody()
	public void SmallCateInsert(SmallCateDTO dto) {
		 CateService.insertSmallCate(dto);
	}
	
	//대분류 카테고리 수정
	@PostMapping("bigcateupdate")
	@ResponseBody()
	public void bigcateupdate(BigCateDTO dto) {
		 CateService.bigcateupdate(dto);
	}
	
	//소분류 카테고리 수정
	@PostMapping("smallcateupdate")
	@ResponseBody()
	public void smallcateupdate(SmallCateDTO dto) {
		 CateService.smallcateupdate(dto);
	}
	
	//대분류 카테고리 삭제
	@PostMapping("bigcatedelete")
	@ResponseBody()
	public void bigcatedelete(BigCateDTO dto) {
		 CateService.bigcatedelete(dto);
	}
	
	//소분류 카테고리 삭제
	@PostMapping("Smallcatedelete")
	@ResponseBody()
	public void Smallcatedelete(SmallCateDTO dto) {
		 CateService.Smallcatedelete(dto);
	}
}
