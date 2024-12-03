package com.java.glowamber.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.SmallCateDTO;
import com.java.glowamber.service.product.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;

	// 걍 상품정보 전부 가져오기 추후 삭제 or 변경필요
	@PostMapping("/productAll")
	@ResponseBody()
	public List<ItemDTO> selectAllProducts() {

		return service.selectProducts();
	}
	//상품상세페이지 상품정보 불러오기
	@GetMapping("selectProductDetail")
	public String selectProductDetail(ItemDTO dto,Model m) {
		m.addAttribute("itemDTO", service.selectDetail(dto));
		return "products/ProductDetail";
	}
	//장바구니로 디비저장(비회원) 추후 회원있는지 비교해서 회원가입시 장바구니 통합필요
	@PostMapping("non_member_cart_add")
	@ResponseBody
	public Integer nonMemberCartAdd(CartDTO dto) {
		System.out.println(dto.toString());
		CartDTO cart = service.selectCart(dto);
		
		if(cart != null) {
			return 10;
		}else {
			return service.insertCart(dto);
		}
	}
	//헤더 대분류 카테고리 눌러서 들어갔을때 리스트 띄우기
	@GetMapping("bigProductList")
	public String bigProductList(ItemDTO dto,Model m) {
		m.addAttribute("cate",service.selectCate(dto));
		m.addAttribute("item",service.selectProductList(dto));
		System.out.println(service.selectProductList(dto).toString());
		return "products/ProductList";
	}
	//헤더 소분류 카테고리 눌러서 들어갔을때 리스트 띄우기
	@GetMapping("smallProductList")
	public String smallProductList(ItemDTO dto,Model m) {
		m.addAttribute("cate",service.selectCate(dto));
		m.addAttribute("item",service.selectProductList(dto));
		System.out.println(service.selectProductList(dto).toString());
		return "products/ProductList";
	}
	@PostMapping("smallProductList")
	@ResponseBody
	public List<ItemDTO> smallProductList(ItemDTO dto) {
		return service.selectProductList(dto);
	}
}
