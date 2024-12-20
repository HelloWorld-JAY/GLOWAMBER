package com.java.glowamber.dao.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<OrderDetailDTO> selectOrderList(OrderDetailDTO dto) {
		return mybatis.selectList("order.selectOrderList",dto);
	}

	@Override
	public OrderDetailDTO selectOrderDetail(OrderDetailDTO dto) {
		return mybatis.selectOne("order.selectOrderList",dto);
	}

	@Override
	public void updateOrderStatus(OrderDetailDTO dto) {
		mybatis.update("order.updateOrderStatus",dto);
		
	}

}
