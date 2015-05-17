package com.szcwdhy.util.dialect;


public class MySqlDialect extends Dialect{
	
	protected static final String SQL_END_DELIMITER = ";";
	
	public String getLimitString(String sql, boolean hasOffset) {
		return MySqlPageHepler.getLimitString(sql,-1,-1);
	}

	public String getLimitString(String sql, int offset, int limit) {
		return MySqlPageHepler.getLimitString(sql, offset, limit);
	}

	public boolean supportsLimit() {
		return true;
	}
}
