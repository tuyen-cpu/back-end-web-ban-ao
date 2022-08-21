package com.cdw.store.utils;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cdw.store.dto.UserDto;
import com.cdw.store.dto.UserInAdminDto;
import com.cdw.store.model.User;

@Component
public class UserConverter {
	@Autowired
	private ModelMapper modelMapper;

	public UserDto convertToDto(User entity) {
		UserDto dto = new UserDto();
		dto.setId(entity.getId());
		dto.setUsername(entity.getUsername());
		dto.setEmail(entity.getEmail());
		dto.setStatus(entity.getStatus());
		dto.setGender(entity.getGender());
		dto.setPassword(entity.getPassword());
		dto.setBirthday(entity.getBirthday());
		return dto;
	}

	public User convertToEntity(UserDto dto) {
		User entity = new User();
		entity.setId(dto.getId());
		entity.setUsername(dto.getUsername());
		entity.setEmail(dto.getEmail());
		entity.setStatus(dto.getStatus());
		entity.setGender(dto.getGender());
		entity.setBirthday(dto.getBirthday());
		return entity;
	}

	public UserInAdminDto convertToUserInAdminDto(User entity) {
		UserInAdminDto dto = new UserInAdminDto();
		dto.setId(entity.getId());
		dto.setUsername(entity.getUsername());
		dto.setEmail(entity.getEmail());
		dto.setStatus(entity.getStatus());
		dto.setGender(entity.getGender());
		dto.setBirthday(entity.getBirthday());
		return dto;
	}
}
