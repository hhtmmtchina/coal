package com.szcwdhy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.szcwdhy.model.User;
import com.szcwdhy.util.dialect.Pagination;

@Repository
public class UserDao extends SqlSessionDaoSupport{
	Logger log = LoggerFactory.getLogger(getClass());
	
	public Integer saveUser(User user){
		return this.getSqlSession().insert("user.insertUser",user);
	}
	
	public List<User> getUserList(User user, Pagination pagination){
		RowBounds rowBounds = new RowBounds(pagination.getOffset(), pagination.getLimit());
		return this.getSqlSession().selectList("user.queryUserList", user, rowBounds);
	}
	
	public User getUser(User user){
		return this.getSqlSession().selectOne("user.queryUser", user);
	}
	
	public Integer updateUser(User user){
		return this.getSqlSession().update("user.updateUser", user);
	}
	
	public Integer deleteUser(User user){
		return this.getSqlSession().delete("user.deleteUser", user);
	}

	public Integer getUserCount() {
		return this.getSqlSession().selectOne("user.queryUserCount");
	}
}
