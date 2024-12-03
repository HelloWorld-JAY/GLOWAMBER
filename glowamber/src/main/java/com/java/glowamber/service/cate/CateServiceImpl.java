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
	// 대분류 검색
	@Override
	public List<BigCateDTO> selectBigCate() {
		return cateDAO.selectBigCate();
	}
	// 소분류 검색
	@Override
	public List<SmallCateDTO> selectSmallCate(SmallCateDTO dto) {
		return cateDAO.selectSmallCate(dto);
	}
	
	// 대분류 입력
		@Override
		public void insertBigCate(BigCateDTO dto) {
			cateDAO.insertBigCate(dto);
		}

		//소분류 입력
		@Override
		public void insertSmallCate(SmallCateDTO dto) {
			cateDAO.insertSmallCate(dto);
		}

		@Override
		public void bigcateupdate(BigCateDTO dto) {
			cateDAO.bigcateupdate(dto);
		}

		@Override
		public void smallcateupdate(SmallCateDTO dto) {
			cateDAO.smallcateupdate(dto);
		}

		@Override
		public void bigcatedelete(BigCateDTO dto) {
			cateDAO.bigcatedelete(dto);
		}

		@Override
		public void Smallcatedelete(SmallCateDTO dto) {
			cateDAO.Smallcatedelete(dto);
			
		}


}
