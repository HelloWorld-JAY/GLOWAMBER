package com.java.glowamber.controller.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	//상품상세페이지 상품정보 불러오기
	@GetMapping("selectProductDetail")
	public String selectProductDetail(ItemDTO dto,Model m) {
		m.addAttribute("itemDTO", service.selectDetail(dto));
		return "products/ProductDetail";
	}
	//장바구니로 디비저장 세션에 아이디 값이 없어서 비회원으로 담기
	@PostMapping("nonMemberCartAdd")
	@ResponseBody
	public Integer nonMemberCartAdd(CartDTO dto) {
		System.out.println(dto.toString());
		CartDTO cart = service.selectCart(dto);

		if(cart != null) {
			service.updateCart(dto);
			return 10;
		}else {
			return service.insertCart(dto);
		}
	}
	//장바구니로 디비저장 비회원으로 담은적이 없어서 회원으로 저장
	@PostMapping("memberCartAdd")
	@ResponseBody
	public Integer memberCartAdd(CartDTO dto) {
		CartDTO cart = service.selectCart(dto);
		if(cart != null) {
			service.updateCart(dto);
			return 10;
		}else {
			return service.insertCart(dto);
		}
	}
	//로그인시 기존 카트에 담긴 게스트 아이디 지우고 로그인아이디로 변경
	@PostMapping("memberCartAddGuestDelete")
	@ResponseBody
	public void memberCartAddGuestDelete(CartDTO dto) {
		if(dto.getGuestId() != null) {
			service.updateCart(dto);
		}
	}
	//헤더 대분류 카테고리 눌러서 들어갔을때 리스트 띄우기
	@GetMapping("bigProductList")
	public String bigProductList(ItemDTO dto,Integer pageNum,String arr,Model m) {

		if(pageNum == null) {
			pageNum = 1;
		}

		m.addAttribute("cate",service.selectCate(dto));
		m.addAttribute("item",service.selectProductList(dto,pageNum,arr));
		m.addAttribute("nowBigCateNum",dto.getBigCateNum());
		m.addAttribute("selectKeyword",dto.getSelectKeyword());
		m.addAttribute("arr",arr);
		return "products/ProductList";
	}
	//헤더 소분류 카테고리 눌러서 들어갔을때 리스트 띄우기
	@GetMapping("smallProductList")
	public String smallProductList(ItemDTO dto,Integer pageNum,String arr,Model m) {

		if(pageNum == null) {
			pageNum = 1;
		}

		m.addAttribute("cate",service.selectCate(dto));
		m.addAttribute("item",service.selectProductList(dto,pageNum,arr));
		m.addAttribute("nowBigCateNum",dto.getBigCateNum());
		m.addAttribute("nowSmallCateNum",dto.getSmallCateNum());
		m.addAttribute("arr",arr);
		return "products/ProductList";
	}
	//베스트 상품 눌렀을때 베스트 가장많이 팔린 상품 
	@GetMapping("bestList")
	public String bestProductList(Model m,Integer pageNum) {
		if(pageNum == null) {
			pageNum = 1;
		}
		m.addAttribute("item",service.bestProductList(pageNum));
		m.addAttribute("best","best");	
		return "products/ProductList";
	}
	//베스트 상품 메인화면 출력하기
	@PostMapping("bestListAjax")
	@ResponseBody
	public List<ItemDTO> bestListAjax() {
		return service.bestProductList();
	}
	//신상품눌렀을때 
		@GetMapping("newList")
		public String newProductList(Model m,Integer pageNum) {
			if(pageNum == null) {
				pageNum = 1;
			}
			m.addAttribute("item",service.newProductList(pageNum));
			m.addAttribute("newList","newList");	
			return "products/ProductList";
		}
		//신상품 상품 메인화면 출력하기
		@PostMapping("newListAjax")
		@ResponseBody
		public List<ItemDTO> newListAjax() {
			return service.newProductList();
		}

}
