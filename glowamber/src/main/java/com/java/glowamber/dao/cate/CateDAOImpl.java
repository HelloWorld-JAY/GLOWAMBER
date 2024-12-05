package com.java.glowamber.dao.cate;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.BigCateDTO;
import com.java.glowamber.model.dto.SmallCateDTO;

@Repository
public class CateDAOImpl implements CateDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<BigCateDTO> selectBigCate() {
	
		return mybatis.selectList("CateDAO.SelectBigCate");
	}

	@Override
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto) {
		return mybatis.selectList("CateDAO.SelectSmallCate",dto);
	}
	@Override
	public void insertBigCate(BigCateDTO dto) {
		mybatis.insert("CateDAO.InsertBigCate",dto);
	}

	@Override
	public void insertSmallCate(SmallCateDTO dto) {
		mybatis.insert("CateDAO.InsertSmallCate",dto);
	}

	@Override
	public void bigcateupdate(BigCateDTO dto) {
		mybatis.update("CateDAO.UpdateBigCate",dto);
	}

	@Override
	public void smallcateupdate(SmallCateDTO dto) {
		mybatis.update("CateDAO.UpdateSmallCate",dto);
	}

	@Override
	public void bigcatedelete(BigCateDTO dto) {
		mybatis.delete("CateDAO.bigcatedelete",dto);
	}

	@Override
	public void Smallcatedelete(SmallCateDTO dto) {
		mybatis.delete("CateDAO.Smallcatedelete",dto);
		
	}

}
