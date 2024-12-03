package com.java.glowamber.service.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.product.ProductDAO;
import com.java.glowamber.model.dto.CartDTO;
import com.java.glowamber.model.dto.ItemDTO;
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

	@Override
	public List<ItemDTO> selectProductList(ItemDTO dto) {
		return dao.selectProductList(dto);
	}

	@Override
	public List<HashMap> selectCate(ItemDTO dto) {
		return dao.selectCate(dto);
	}

}
