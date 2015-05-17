package com.szcwdhy.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Coal")
public class Coal implements Serializable {
	
	private static final long serialVersionUID = -256042197556128162L;
	private Integer id;
	private String station;
	private String coalStation;
	private String deliveryUnit;
	private String coalType;
	private String toStation;
	private Integer carNumber;
	private Integer changCunMei;
	private Integer riShangMei;
	private Integer ziYouMeiKuang;
	private Integer gangCunMei;
	private String theShipment;
	private Date createdTime;
	private Date updatedTime;
}
