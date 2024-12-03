package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class ItemDTO {
	private Integer itemNum;
	private Integer smallCateNum;
	private Integer bigCateNum;
	private String 	itemName;
	private String 	itemUnit;
	private String 	itemOrigin;
	private String 	itemVolume;
	private String 	itemAllErgyinfo;
	private Integer itemCost;
	private Integer itemPrice;
	private String	itemDate;
	private String	ItemSupplier;
	private	String	itemThumnail;
	private String	itemDetail;
}
