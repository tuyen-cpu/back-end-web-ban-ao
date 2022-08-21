package com.cdw.store.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;

import com.cdw.store.dto.UserDto;
import com.cdw.store.dto.UserInAdminDto;
import com.cdw.store.model.User;

public interface IUserService {
	public User addUser(User user);

	public List<User> findALlUsers();

	public User updateUser(User user);

	public void deleteUser(Long id);

	public User findUserById(Long id);
	
	public boolean existsByUsername(String username);

	public boolean existsByEmail(String email);

	public List<UserDto> getUsers();

	public UserDto addUser(UserDto user);

	public Page<UserInAdminDto> getUsersInAdmin(Integer page, Integer size);

	public boolean updateDeletedStatus(Long id);

	public boolean updateDeletedStatus(Long[] ids);

	public boolean processForgotPassword(String email);

	public boolean updatePassword(String token, String password);

	public boolean checkValidToken(String token);

}
