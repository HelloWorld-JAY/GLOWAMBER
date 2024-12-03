package com.java.glowamber.dao.cate;

import java.util.List;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

public interface CateDAO {

	public List<BigCateDTO> selectBigCate(); 
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto);
	
}
