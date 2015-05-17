package com.szcwdhy.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "CoalType")
public class CoalType implements Serializable {
	
	private static final long serialVersionUID = -256042197556128162L;
	private Integer id;
	private String coalName;
	private String parentId;

}
