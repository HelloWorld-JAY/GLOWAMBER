package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class StoreDTO {
	private String storeStatus;		// 구분
	private String itemName;		// 상품이름
	private Integer storeCount;		// 입/출고량
	private Integer storePrice;		// 입/출고가
	private String storeDate;	// 입/출고일
}
