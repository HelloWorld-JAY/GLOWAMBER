package com.java.glowamber.service.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.cate.CateDAO;
import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

@Service
public class CateServiceImpl implements CateService {

	@Autowired
	private CateDAO cateDAO;
	
	@Override
	public List<BigCateDTO> selectBigCate() {
		return cateDAO.selectBigCate();
	}

	@Override
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto) {
		return cateDAO.selectSmallCate(dto);
	}

}
