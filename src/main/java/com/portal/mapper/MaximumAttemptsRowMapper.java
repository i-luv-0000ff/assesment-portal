package com.portal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.portal.model.Category;

public class MaximumAttemptsRowMapper implements RowMapper<Category> {
	@Override
	public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
		Category category = new Category();
		category.setCategoryId(rs.getInt("category_Id"));
		category.setMaximumAttempts(rs.getInt("MaximumAttempts"));
		
		return category;
	}

}
