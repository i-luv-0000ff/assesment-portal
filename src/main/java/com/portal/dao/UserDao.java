package com.portal.dao;

import com.portal.model.User;

public interface UserDao {
	
	public String checkRole(String userId);
	public String getUserPswd(String userId);
	public int getUserId(String username);
	
	public String getUserQuest(String UserId);

	public String getSecrtyAns(String UserId);

	public String getUserEmail(String UserId);
	
	public void changePassword(String UserId,String pwd);
}
