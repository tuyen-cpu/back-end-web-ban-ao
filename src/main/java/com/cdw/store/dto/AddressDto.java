package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cdw.store.model.Bill;
import com.cdw.store.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddressDto {
	private Long id;
	private String fullname;
	private String phone;
	private String country;
	private String city;
	private String district;
	private String ward;
	private String street;
	private String company; 
	private Date createdDate;
	private Date updatedDate;

}