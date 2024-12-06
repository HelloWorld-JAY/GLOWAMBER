package com.java.glowamber.controller.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
		for(OrderDetailDTO dt : result) {
			System.out.println(dt.toString());
		}
		return result;
	}
}
