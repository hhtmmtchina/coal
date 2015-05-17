package com.szcwdhy.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value="CoalParam")
public class CoalParam implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 5121857157991112222L;

	private String searchTime;
	private String startTime;
	private String endTime;
	private String timeType;
	
}
