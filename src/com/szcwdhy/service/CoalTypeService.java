package com.szcwdhy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szcwdhy.dao.CoalDao;
import com.szcwdhy.dao.CoalTypeDao;
import com.szcwdhy.model.Coal;
import com.szcwdhy.model.CoalParam;
import com.szcwdhy.model.CoalType;
import com.szcwdhy.util.dialect.Pagination;

@Service
public class CoalTypeService {
	@Resource
	private CoalTypeDao coalTypeDao;
	
	public List<CoalType> getCoalTypeList(int type){
		return coalTypeDao.getCoalTypeList(type);
	}
}
