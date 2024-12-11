package com.java.glowamber.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// 장바구니 담기 회원 있을시 게스트id 삭제 
	public Integer updateCart(CartDTO dto);
	// 대분류&소분류에 따른 상품불러오기 + 페이징
	public Map<String,Object> selectProductList(ItemDTO dto, Integer pageNum,String arr);
	// 상품 카테고리 불러오기
	public List<HashMap> selectCate(ItemDTO dto);
	// 베스트상품 top100개 불러오기 페이지출력용
	public Map<String,Object> bestProductList(Integer pageNum);
	// 베스트상품 top100개 불러오기 에이젝스용
	public List<ItemDTO> bestProductList();
	// 신상품 불러오기 페이지출력용
	public Map<String,Object>newProductList(Integer pageNum);
	// 신상품 top100개 불러오기 에이젝스용
	public List<ItemDTO> newProductList();
}
