package com.java.glowamber.service.product;

import java.util.HashMap;
import java.util.List;

import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

public interface ProductService {
	//상품전체검색
	public List<ItemDTO> selectProducts();
	//상품상세페이지 내용검색
	public ItemDTO selectDetail(ItemDTO dto);
	// 장바구니 추가
	public Integer insertCart(CartDTO dto);
	// 장바구니 상품있는지 검색
	public CartDTO selectCart(CartDTO dto);
	// 장바구니 상품 있을시 갯수
	public Integer updateCart(CartDTO dto);
	// 대분류&소분류에 따른 상품불러오기
	public List<ItemDTO> selectProductList(ItemDTO dto);
	// 상품 카테고리 불러오기
	public List<HashMap> selectCate(ItemDTO dto);
}
