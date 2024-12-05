package com.java.glowamber.dao.cate;

import java.util.List;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

public interface CateDAO {

	public List<BigCateDTO> selectBigCate(); 
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto);
	public void insertBigCate(BigCateDTO dto);
	public void insertSmallCate(SmallCateDTO dto);
	public void bigcateupdate(BigCateDTO dto);
	public void smallcateupdate(SmallCateDTO dto);
	public void bigcatedelete(BigCateDTO dto);
	public void Smallcatedelete(SmallCateDTO dto);
}
