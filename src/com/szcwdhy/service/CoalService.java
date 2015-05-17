package com.szcwdhy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szcwdhy.dao.CoalDao;
import com.szcwdhy.model.Coal;
import com.szcwdhy.model.CoalParam;
import com.szcwdhy.util.dialect.Pagination;

@Service
public class CoalService {

	@Resource
	private CoalDao coalDao;
	
	public List<Coal> getCoalList(CoalParam cParam, Pagination pagination, String exportType){
		return coalDao.getCoalList(cParam, pagination, exportType);
	}
	
	public Integer getCoalCount(CoalParam cParam){
		return coalDao.getCoalCount(cParam);
	}

	public Integer getCoalAdd(Coal coal) {
		return coalDao.getCoalAdd(coal);
	}

	public boolean delCoalById(Integer id) {
		return coalDao.delCoalById(id);
	}
	
	public Coal getCoalById(Integer id){
		return coalDao.getCoalById(id);
	}
	
	public Integer updateCoalById(Coal coal){
		return coalDao.updateCoalById(coal);
	}
}
