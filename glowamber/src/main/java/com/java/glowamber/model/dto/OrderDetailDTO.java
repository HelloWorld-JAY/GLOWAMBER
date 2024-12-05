package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private Integer orderdetailnum;
	private Integer ordernum;
	private String membername;
	private String orderdate;
	private String itemname;
	private Integer orderdetailcount;
	private Integer orderdetailprice;
	private String orderdetailstatus;
	
	


	
}
