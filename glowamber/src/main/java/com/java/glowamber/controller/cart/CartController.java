package com.java.glowamber.controller.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.service.cart.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService service;

	// 아이디 , 게스트아이디 장바구니 불러오기
	@PostMapping("guestCartSelect")
	@ResponseBody
	public List<HashMap<String,Object>> guestCartSelect(CartDTO dto) {
		System.out.println(service.selectCartID(dto).toString());
		return service.selectCartID(dto);
	}
	// 카트 수량 변경 통신
	@PostMapping("cartCounter")
	@ResponseBody
	public Integer cartCounter(CartDTO dto) {
		return service.updateCartCount(dto);
	}
	// 카트 상품 삭제
	@PostMapping("deleteCartProduct")
	@ResponseBody
	public Integer deleteCartProduct(CartDTO dto) {
		return service.deleteCartProduct(dto);
	}
}
