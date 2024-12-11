package com.java.glowamber.service.dashboard;

import java.util.List;

import com.java.glowamber.model.dto.StoreDTO;

public interface DashBoardService {
	public List<StoreDTO> getChartData(StoreDTO dto);
	public List<StoreDTO> getSaleChartData(StoreDTO dto);
}
