package com.hitokuse.mappers;

import java.util.List;

import com.hitokuse.domains.AnalyticsVo;

public interface AnalyticsMapper {
	public void insertPv(AnalyticsVo vo) throws Exception;
	public AnalyticsVo getTotalPv(AnalyticsVo vo) throws Exception;
	public List<AnalyticsVo> getChart1(AnalyticsVo vo) throws Exception;
	public List<AnalyticsVo> getChart2(AnalyticsVo vo) throws Exception;
}
