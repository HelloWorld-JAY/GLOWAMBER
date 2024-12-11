package com.java.glowamber.dao.cart;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.OrderDTO;
import com.java.glowamber.model.dto.OrderDetailDTO;
import com.java.glowamber.model.dto.StoreDTO;

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
	@Override
	public Integer insertOrder(OrderDTO dto) {
		dto.setOrderNum(mybatis.selectOne("CartDAO.CreateOrderNum"));
		mybatis.insert("CartDAO.InsertOrder",dto);
		return dto.getOrderNum(); 
	}
	@Override
	public Integer insertOrderDetail(OrderDetailDTO dto) {
		int rowNum = 1;
		dto.setRowNum(rowNum);
		//첫번째 확인
		StoreDTO store = mybatis.selectOne("CartDAO.SelectStoreRowNum",dto);
		System.out.println("입고수량"+store.getSaleCount());
		System.out.println("주문수량"+dto.getOrderDetailCount());
		while(store != null) {
			if(store.getSaleCount() < dto.getOrderDetailCount()) {
				rowNum++;
				System.out.println("로우넘버"+rowNum);
				dto.setRowNum(rowNum);
				store = mybatis.selectOne("CartDAO.SelectStoreRowNum",dto);
				System.out.println("입고수량"+store.getSaleCount());
				System.out.println("주문수량"+dto.getOrderDetailCount());
				continue;
			}else{
				dto.setStoreNum(store.getStoreNum()); 
				mybatis.update("CartDAO.UpdateSaleCount",dto);
				mybatis.delete("CartDAO.DeleteCart",dto);
				return mybatis.insert("CartDAO.InsertOrderDetail",dto);
			}
		}
		return 0;
	}

}
