package com.java.glowamber.controller.dashboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.StoreDTO;
import com.java.glowamber.service.dashboard.DashBoardService;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService dashboardservice;
	
	@PostMapping("getChartData")
	@ResponseBody
	public List<StoreDTO> getChartData(StoreDTO dto){
		return dashboardservice.getChartData(dto);
	}
	
	@PostMapping("getSaleChartData")
	@ResponseBody
	public List<StoreDTO> getSaleChartData(StoreDTO dto){
		return dashboardservice.getSaleChartData(dto);
	}
}
