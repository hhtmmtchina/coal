package com.szcwdhy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.szcwdhy.model.Coal;
import com.szcwdhy.model.CoalParam;
import com.szcwdhy.util.dialect.Pagination;
import com.szcwdhy.utils.DateUtil;

@Repository
public class CoalDao extends SqlSessionDaoSupport {

	public Integer saveCoal(Coal coal){
		return this.getSqlSession().insert("coal.insertCoal", coal);
	}
	
	public List<Coal> getCoalList(CoalParam cParam, Pagination pagination, String exportType){
		RowBounds rowBounds = null;
		if("allPage".equalsIgnoreCase(exportType)){
			rowBounds = new RowBounds(0, getCoalCount(cParam));
		}else{
			rowBounds = new RowBounds(pagination.getOffset(), pagination.getLimit());
		}
		Map<String, Object> map = ConvertBeanToMap(cParam);
		return this.getSqlSession().selectList("coal.queryCoalList", map, rowBounds);
	}

	private Map<String, Object> ConvertBeanToMap(CoalParam cParam) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(cParam.getSearchTime()))
			map.put("serachTime", cParam.getSearchTime());
		else 
			map.put("serachTime", "");
		
		if(StringUtils.isNotBlank(cParam.getStartTime()))
			map.put("startTime", DateUtil.parseDate(cParam.getStartTime(),"yyyy-MM-dd HH:mm:ss"));
		else 
			map.put("startTime", "");
		
		if(StringUtils.isNotBlank(cParam.getEndTime()))
			map.put("endTime", DateUtil.addDate(DateUtil.parseDate(cParam.getEndTime(),"yyyy-MM-dd HH:mm:ss"), 1));
		else 
			map.put("endTime", "");
		
		return map;
	}
	
	/**
	 * get coal count by where
	 */
	public Integer getCoalCount(CoalParam cParam){
		Map<String, Object> map = ConvertBeanToMap(cParam);
		return this.getSqlSession().selectOne("coal.queryCountCoal", map);
	}

	public Integer getCoalAdd(Coal coal) {
		return this.getSqlSession().insert("coal.insertCoal", coal);
	}

	public boolean delCoalById(Integer id) {
		Coal coal = new Coal();
		coal.setId(id);
		Integer idDel = this.getSqlSession().delete("coal.deleteCoal", coal);
		if(idDel > 0) return true;
		return false;
	}

	public Coal getCoalById(Integer id) {
		Coal coal = new Coal();
		coal.setId(id);
		return this.getSqlSession().selectOne("coal.queryCoal", coal);
	}
	
	public Integer updateCoalById(Coal coal) {
		return this.getSqlSession().update("coal.updateCoal", coal);
	}
	
}
