package com.java.glowamber.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.glowamber.dao.product.ProductDAO;
import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.PageMaker;
import com.java.glowamber.model.dto.SmallCateDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO dao;

	@Override
	public List<ItemDTO> selectProducts() {
		return dao.selectProducts();
	}

	@Override
	public ItemDTO selectDetail(ItemDTO dto) {

		return dao.selectDetail(dto);
	}

	@Override
	public Integer insertCart(CartDTO dto) {
		return dao.insertCart(dto);
	}

	@Override
	public CartDTO selectCart(CartDTO dto) {
		return dao.selectCart(dto);
	}

	@Override
	public Integer updateCart(CartDTO dto) {

		return dao.updateCart(dto);
	}
	// 대분류&소분류에 따른 상품불러오기 + 페이징
	@Override
	public Map<String,Object> selectProductList(ItemDTO dto, Integer pageNum,String arr) {

		// 전체 상품 갯수 조회 
		Integer totalBoard = dao.selectProductCount(dto);
		// 페이지 블럭 크기 설정 
		Integer blockSize = 5;
		// 페이지 상품 출력 개수
		Integer pageSize = 20;
		// 페이지메이커 생성자
		PageMaker pageMaker = new PageMaker(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> pageMap = new HashMap<String,Object>();
		pageMap.put("startRow", pageMaker.getStartRow());
		pageMap.put("endRow", pageMaker.getEndRow());
		pageMap.put("totalBoard", pageMaker.getTotalBoard());
		pageMap.put("selectKeyword", dto.getSelectKeyword());
		pageMap.put("bigCateNum", dto.getBigCateNum());
		pageMap.put("smallCateNum", dto.getSmallCateNum());
		pageMap.put("arr", arr);

		List<ItemDTO> itemList = dao.selectProductList(pageMap);

		Map<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("itemList", itemList);
		resultMap.put("pageMaker", pageMaker);

		return resultMap;
	}

	@Override
	public List<HashMap> selectCate(ItemDTO dto) {
		return dao.selectCate(dto);
	}
	// 베스트상품 top100개 불러오기
	@Override
	public Map<String,Object> bestProductList(Integer pageNum) {
		//베스트 찾는 쿼리 + 베스트 페이징 쿼리 만들어야함
		
		// 전체 상품 갯수 조회 
		Integer totalBoard = dao.selectBestCount();
		// 페이지 블럭 크기 설정 
		Integer blockSize = 5;
		// 페이지 상품 출력 개수
		Integer pageSize = 20;
		// 페이지메이커 생성자
		PageMaker pageMaker = new PageMaker(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String,Object>();
		pageMap.put("startRow", pageMaker.getStartRow());
		pageMap.put("endRow", pageMaker.getEndRow());
		pageMap.put("totalBoard", pageMaker.getTotalBoard());

		List<ItemDTO> itemList = dao.selectBestList(pageMap);

		Map<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("itemList", itemList);
		resultMap.put("pageMaker", pageMaker);

		return resultMap;
	}
	//베스트상품 에이젝스용
	@Override
	public List<ItemDTO> bestProductList() {
		return dao.selectBestList();
	}
	//신상품 페이지용
	@Override
	public Map<String, Object> newProductList(Integer pageNum) {
		// 전체 상품 갯수 조회 
				Integer totalBoard = dao.selectNewCount();
				// 페이지 블럭 크기 설정 
				Integer blockSize = 5;
				// 페이지 상품 출력 개수
				Integer pageSize = 20;
				// 페이지메이커 생성자
				PageMaker pageMaker = new PageMaker(pageNum, totalBoard, pageSize, blockSize);
				
				Map<String, Object> pageMap = new HashMap<String,Object>();
				pageMap.put("startRow", pageMaker.getStartRow());
				pageMap.put("endRow", pageMaker.getEndRow());
				pageMap.put("totalBoard", pageMaker.getTotalBoard());

				List<ItemDTO> itemList = dao.selectNewList(pageMap);

				Map<String, Object> resultMap = new HashMap<String,Object>();
				resultMap.put("itemList", itemList);
				resultMap.put("pageMaker", pageMaker);

				return resultMap;
	}

	@Override
	public List<ItemDTO> newProductList() {
		return dao.selectNewList();
	}


}
