package com.java.glowamber.dao.order;

import java.util.List;

import com.java.glowamber.model.dto.OrderDetailDTO;

public interface OrderDAO {
	public List<OrderDetailDTO> selectOrderList(OrderDetailDTO dto);
	public OrderDetailDTO selectOrderDetail(OrderDetailDTO dto);
}
