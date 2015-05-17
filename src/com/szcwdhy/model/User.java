package com.szcwdhy.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value="User")
public class User implements Serializable {
	private static final long serialVersionUID = -5253819065064495376L;

	private Integer id;
	private	String username;
	private String password;
	private int usertype;
	private String mobile;
	private Date createdtime;
	private Date updatedtime;
	private String checkcode;
}
