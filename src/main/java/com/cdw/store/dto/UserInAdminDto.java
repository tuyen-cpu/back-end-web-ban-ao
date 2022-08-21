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
public class UserInAdminDto {
	private Long id;
	private String username;
	private String email;
	private Date birthday;
	private Integer gender;
	private Integer status;
	private List<String> roles = new ArrayList<String>();
	private Integer numBills;
	private Integer numComments;
	private Integer numAddresses;
}
