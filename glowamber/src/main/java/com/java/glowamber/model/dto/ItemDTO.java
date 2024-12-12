package com.java.glowamber.model.dto;

import org.springframework.web.multipart.MultipartFile;

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
	private String	itemSupplier;
	private	String	itemThumnail;
	private String	itemDetail;
	private String  itemDetailSub;
	private String  bigCateName;
	private String  smallCateName;
	private String	selectKeyword; // 사용자 검색 키워드(상품명만 가능)
	private MultipartFile file;
	private String path;
	private String realFileName;
	private String afteritemThumnail;
	private String afterFilename;
}
