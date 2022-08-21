package com.cdw.store.service;

import java.util.Date;
import java.util.List;

import com.cdw.store.dto.AddressDto;
import com.cdw.store.model.Address;
import com.cdw.store.model.User;

public interface IAddressService {
	public Address addAddress(Address address);

	public List<AddressDto> findALlAddresses();

	public Address updateAddress(Address address);

	public void deleteAddress(Long id);

	public Address findAddressById(Long id);

	List<AddressDto> findByAddressUserId(Long id);

	public Long addAddress(AddressDto addressDto, Date curDate, User user);
	
	public Long updateAddress(AddressDto addressDto, Date curDate, User user);
}
