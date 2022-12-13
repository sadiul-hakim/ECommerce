package com.ecommerce.dao.user;

import java.util.List;

import com.ecommerce.entities.User;

public interface UserService {
	int save(User user);
	User login(LoginDTO dto);
	User getUser(String email);
	List<User> allUsers();
}
