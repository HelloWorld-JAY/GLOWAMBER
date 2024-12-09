package com.java.glowamber.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<ItemDTO> selectProducts() {
	
		return mybatis.selectList("ProductDAO.SelectAllProduct");
	}

	@Override
	public ItemDTO selectDetail(ItemDTO dto) {
		return mybatis.selectOne("ProductDAO.SelectDetail",dto);
	}

	@Override
	public Integer insertCart(CartDTO dto) {
		return mybatis.insert("ProductDAO.InsertCart",dto);
	}

	@Override
	public CartDTO selectCart(CartDTO dto) {
		return mybatis.selectOne("ProductDAO.SelectCartOne",dto);
	}

	@Override
	public Integer updateCart(CartDTO dto) {
		return mybatis.update("ProductDAO.UpdateCart",dto);
	}

	@Override
	public List<ItemDTO> selectProductList(Map<String, Object> pageMap) {
		return mybatis.selectList("ProductDAO.SelectProductList",pageMap);
	}

	@Override
	public List<HashMap> selectCate(ItemDTO dto) {
		return mybatis.selectList("ProductDAO.SelectCate",dto);
	}
	// 상품수 조회
	@Override
	public Integer selectProductCount(ItemDTO dto) {
		return mybatis.selectOne("ProductDAO.SelectProductPage",dto);
	}


}
