package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class StoreDTO {
	private Integer storeCount;		// 입고수량
	private Integer itemNum;		// 상품번호
	private Integer storePrice;		// 입고가
	private String storeExpirDate;	// 유통기한
}
