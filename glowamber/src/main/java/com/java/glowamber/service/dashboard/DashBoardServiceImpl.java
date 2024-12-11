package com.java.glowamber.service.dashboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.dashboard.DashBoardDAO;
import com.java.glowamber.model.dto.StoreDTO;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private DashBoardDAO dashboarddao;

	@Override
	public List<StoreDTO> getChartData(StoreDTO dto) {
		return dashboarddao.getChartData(dto);
	}

	@Override
	public List<StoreDTO> getSaleChartData(StoreDTO dto) {
		return dashboarddao.getSaleChartData(dto);
	}
}
