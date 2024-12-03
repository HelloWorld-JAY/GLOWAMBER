package com.java.glowamber.service.cate;

import java.util.List;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

public interface CateService {
	
	public List<BigCateDTO> selectBigCate(); 
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto);
}
