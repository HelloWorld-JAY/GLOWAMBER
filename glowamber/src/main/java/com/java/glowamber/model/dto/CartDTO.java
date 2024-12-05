package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class CartDTO {
	private Integer cartNum;
	private String memberId;
	private String guestId;
	private Integer itemNum;
	private Integer cartItemCount;
	private String cartAddDate;
}
