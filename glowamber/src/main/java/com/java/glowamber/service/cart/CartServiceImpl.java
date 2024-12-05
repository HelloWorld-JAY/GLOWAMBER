package com.java.glowamber.service.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.cart.CartDAO;
import com.java.glowamber.model.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;

	// 아이디 , 게스트아이디 장바구니 불러오기
	@Override
	public List<HashMap<String,Object>> selectCartID(CartDTO dto) {
		return dao.selectCartID(dto);
	}
	//카트 수량 변경
	@Override
	public Integer updateCartCount(CartDTO dto) {


		if(dto.getCartItemCount() == 0) {
			dao.deleteCartProduct(dto);
			if(dao.selectCartID(dto).isEmpty()) {
				return 20;
			}
			return 10;
		}else {

			return dao.updateCartCount(dto);		
		}
	}
	@Override
	public Integer deleteCartProduct(CartDTO dto) {
		dao.deleteCartProduct(dto);
		if(dao.selectCartID(dto).isEmpty()) {
			return 20;
		}else {
		return 1;
		}
	}

}
