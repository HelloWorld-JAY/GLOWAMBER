package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private Integer orderDetailNum;
	private Integer orderNum;
	private String memberName;
	private String orderDate;
	private String itemName;
	private Integer orderDetailCount;		   // 상품수량
	private Integer orderDetailPrice;
	private String orderDetailStatus;
	private Integer orderItemCount;            // 주문한상품갯수
	
	


	
}
