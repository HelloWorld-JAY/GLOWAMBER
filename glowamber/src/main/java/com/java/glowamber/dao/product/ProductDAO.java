package com.java.glowamber.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

public interface ProductDAO {
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
	public List<ItemDTO> selectProductList(Map<String, Object> pageMap);
	// 상품 카테고리 불러오기
	public List<HashMap> selectCate(ItemDTO dto);
	// 상품수 조회
	public Integer selectProductCount(ItemDTO dto);
	// 베스트상품 갯수조회
	public Integer selectBestCount();
	// 베스트 상품 조회
	public List<ItemDTO> selectBestList(Map<String, Object> pageMap);
	// 베스트상품 top100개 불러오기 에이젝스용
	public List<ItemDTO> selectBestList();
	// 신상품 갯수조회
	public Integer selectNewCount();
	// 신상품 상품 조회
	public List<ItemDTO> selectNewList(Map<String, Object> pageMap);
	// 신상품 top100개 불러오기 에이젝스용
	public List<ItemDTO> selectNewList();
}
