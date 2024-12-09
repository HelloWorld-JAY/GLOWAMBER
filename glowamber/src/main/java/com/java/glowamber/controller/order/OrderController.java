package com.java.glowamber.controller.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.OrderDTO;
import com.java.glowamber.model.dto.OrderDetailDTO;
import com.java.glowamber.service.order.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderservice;
	
	@PostMapping("selectOrderList")
	@ResponseBody
	public List<OrderDetailDTO> selectOrderList(OrderDetailDTO dto) {
		List<OrderDetailDTO> result =	orderservice.selectOrderList(dto);
		return result;
	}
	
	@PostMapping("selectOrderDetail")
	@ResponseBody
	public OrderDetailDTO selectOrderDetail(OrderDetailDTO dto) {
		OrderDetailDTO result =	orderservice.selectOrderDetail(dto);
		return result;
	}
	
	@PostMapping("updateOrderStatus")
	@ResponseBody
	public void updateOrderStatus(OrderDetailDTO dto, @RequestParam(value="allCheckedItemVal[]")int[] allCheckedItemVal ) {
		for(int i=0; i<allCheckedItemVal.length;i++) {
			dto.setOrderDetailNum(allCheckedItemVal[i]);
			orderservice.updateOrderStatus(dto);
		}
	}
}
