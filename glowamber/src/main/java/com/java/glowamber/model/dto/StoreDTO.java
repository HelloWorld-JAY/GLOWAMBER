package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class StoreDTO {
	private String storeStatus;		// 구분
	private Integer itemNum;		// 상품 번호
	private String itemName;		// 상품이름
	private Integer storeCount;		// 최초 입/출고량
	private Integer storePrice;		// 입/출고가
	private String storeDate;		// 입/출고일
	private String storeExpirDate;	// 유통기한
	private Integer saleCount;  	// 현재/입출고량
	private Integer storeNum;	
	private String year;
	private String month;

}
