package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
	private Long id;
	private String username;
	private String email;
	private String password;
	private Date birthday;
	private Integer gender;
	private Integer status;
	private String token;
	private Date createdDate;
	private Date updatedDate;
	private List<String> roles = new ArrayList<String>();
}
