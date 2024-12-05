package com.java.glowamber.dao.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.CartDTO;

public interface CartDAO {

	// 아이디 , 게스트아이디 장바구니 불러오기
	public List<HashMap<String,Object>> selectCartID(CartDTO dto);
	// 카트 수량변경
	public Integer updateCartCount(CartDTO dto);
	// 카트수량 0일때 삭제
	public Integer deleteCartProduct(CartDTO dto);
}
