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

}
