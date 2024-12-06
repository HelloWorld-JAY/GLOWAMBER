package com.java.glowamber.service.order;

import java.util.List;

import com.java.glowamber.model.dto.OrderDetailDTO;

public interface OrderService {
	public List<OrderDetailDTO> selectOrderList(OrderDetailDTO dto);
}
