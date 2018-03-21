package com.portal.service;

import com.portal.model.User;


public interface UserService {
	boolean validateUser(String userid, String password) ;
	public String checkRole(String userId);
	int getUid(String username);
	public String fetchUserQuest(String userId);
	public String fetchUserEmail(String userId);
	
	public void setPassword(String userId, String pwd);

	
	public String fetchUserAns(String userId);
}
