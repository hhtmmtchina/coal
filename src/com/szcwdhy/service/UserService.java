package com.szcwdhy.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.catalina.util.MD5Encoder;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.szcwdhy.dao.UserDao;
import com.szcwdhy.model.User;
import com.szcwdhy.util.dialect.Pagination;
import com.szcwdhy.utils.MD5Util;

@Service
public class UserService {

	@Resource
	private UserDao userDao;
	
	public boolean saveUser(User user){
		if(StringUtils.isBlank(user.getMobile()))user.setMobile("0");
		if(StringUtils.isNotBlank(user.getPassword())) user.setPassword(MD5Util.MD5(user.getPassword()));
		Integer id = userDao.saveUser(user);
		return id!=null && id > 0 ? true : false;
	}

	/**
	 * 获取用户列表
	 * @param uParam
	 * @return
	 */
	public List<User> getUsers(User uParam, Pagination pagination) {
		List<User> users = userDao.getUserList(uParam, pagination);
		return users;
	}
	
	public Integer getUserCount(){
		return userDao.getUserCount();
	}
	
	public User getUser(User user){
		if(StringUtils.isNotBlank(user.getPassword())) user.setPassword(MD5Util.MD5(user.getPassword()));
		return userDao.getUser(user);
	}
	
	public Integer updateUser(User user){
		return userDao.updateUser(user);
	}
	
	public Integer deleteUser(Integer id){
		User user = new User();
		user.setId(id);
		return userDao.deleteUser(user);
	}

	public User getUser(Integer id) {
		User user = new User();
		user.setId(id);
		return userDao.getUser(user);
	}
}
