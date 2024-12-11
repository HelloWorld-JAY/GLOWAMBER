package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class OrderDTO {

	private Integer orderNum;
	private Integer memberNum;
	private String orderDate;
	private String refundReason;
	private String excahngeReason;
	private String orderName;
	private String orderAddr;
	private String orderAddrDetail;
	private String orderRequest;
}
