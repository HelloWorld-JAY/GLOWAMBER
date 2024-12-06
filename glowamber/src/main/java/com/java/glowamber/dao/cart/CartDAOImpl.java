package com.java.glowamber.dao.cart;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 아이디 , 게스트아이디 장바구니 불러오기
	@Override
	public List<HashMap<String,Object>> selectCartID(CartDTO dto) {
		return mybatis.selectList("CartDAO.SelectCartID",dto);
	}
	//카트 수량 변경
	@Override
	public Integer updateCartCount(CartDTO dto) {
		return mybatis.update("CartDAO.CartUpdateCount",dto);
	}
	@Override
	public Integer deleteCartProduct(CartDTO dto) {
		return mybatis.delete("CartDAO.deleteCartProduct",dto);
	}

}
