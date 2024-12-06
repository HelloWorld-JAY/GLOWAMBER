package com.java.glowamber.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.order.OrderDAO;
import com.java.glowamber.model.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderdao;
	
	@Override
	public List<OrderDetailDTO> selectOrderList(OrderDetailDTO dto) {
		return orderdao.selectOrderList(dto);
	}

	@Override
	public OrderDetailDTO selectOrderDetail(OrderDetailDTO dto) {
		return orderdao.selectOrderDetail(dto);
	}

}
