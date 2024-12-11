package com.java.glowamber.controller.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.OrderDTO;
import com.java.glowamber.model.dto.OrderDetailDTO;
import com.java.glowamber.service.cart.CartService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class CartController {

	@Autowired
	private CartService service;

	// 아이디 , 게스트아이디 장바구니 불러오기
	@PostMapping("guestCartSelect")
	@ResponseBody
	public List<HashMap<String,Object>> guestCartSelect(CartDTO dto) {
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
	//결제페이지로 이동 하기전 세션에 장바구니 선택한애들 추가
	@PostMapping("sessionCartNum")
	@ResponseBody
	public Integer sessionCartNum(String cartNum,HttpSession session) {
		System.out.println(cartNum);
		String[] cartNumArr = cartNum.split(",");

		session.setAttribute("cartNum", cartNumArr);
		return 1;
	}
	//결제페이지로 이동
	@GetMapping("payPage")
	public String payPage(CartDTO dto,Model m,HttpSession session) {
		dto.setCartNumArr((String[])session.getAttribute("cartNum"));
		m.addAttribute("cart",service.selectCartID(dto)); 
		return "products/Pay";
	}

	//결제완료후 주문 테이블에 넘기기
	@PostMapping("order")
	@ResponseBody
	public Integer order(OrderDTO dto) {
		System.out.println(dto.toString());
		return service.insertOrder(dto);
	}
	//결제완료후 주문상세 테이블에 넘기기
	@PostMapping("orderDetail")
	@ResponseBody
	public void orderDetail(OrderDetailDTO dto) {
		System.out.println(dto.toString());
		service.insertOrderDetail(dto);
	}
}
