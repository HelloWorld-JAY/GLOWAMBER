package com.java.glowamber.dao.dashboard;

import java.util.List;

import com.java.glowamber.model.dto.StoreDTO;

public interface DashBoardDAO {
	public List<StoreDTO> getChartData();
}
