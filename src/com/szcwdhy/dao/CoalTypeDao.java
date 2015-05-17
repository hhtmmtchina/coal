package com.szcwdhy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.szcwdhy.model.CoalType;

@Repository
public class CoalTypeDao extends SqlSessionDaoSupport {

	public List<CoalType> getCoalTypeList(int ctype){
		return this.getSqlSession().selectList("coalType.queryCoalTypeList",ctype);
	}

}
