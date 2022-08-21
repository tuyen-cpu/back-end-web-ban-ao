package com.cdw.store.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.AddressDto;
import com.cdw.store.model.Address;
import com.cdw.store.model.User;
import com.cdw.store.repo.AddressRepo;
import com.cdw.store.service.IAddressService;
import com.cdw.store.utils.AddressConverter;

@Service
public class AddressService implements IAddressService {
	@Autowired
	private AddressRepo addressRepo;

	@Autowired
	private AddressConverter addressConverter;

	@Override
	public Address addAddress(Address address) {
		return addressRepo.save(address);
	}

	@Override
	public List<AddressDto> findALlAddresses() {
		List<Address> entities = addressRepo.findAll();
		List<AddressDto> results = new ArrayList<>();

		for (Address address : entities) {
			AddressDto result = addressConverter.convertToDto(address);
			results.add(result);
		}

		return results;
	}

	@Override
	public Address updateAddress(Address address) {
		return addressRepo.save(address);
	}

	@Override
	public void deleteAddress(Long id) {
		addressRepo.deleteById(id);
	}

	@Override
	public Address findAddressById(Long id) {
		return addressRepo.findById(id).orElse(null);
	}

	@Override
	public List<AddressDto> findByAddressUserId(Long id) {
		List<AddressDto> addresses = addressRepo.findAddressByUserId(id).stream()
				.map(addressEntity -> addressConverter.convertToDto(addressEntity)).collect(Collectors.toList());
		return addresses;
	}

	@Transactional
	@Override
	public Long addAddress(AddressDto addressDto, Date curDate, User user) {
		Address address = addressConverter.convertToEntity(addressDto);
		address.setCreatedDate(curDate);
		address.setUpdatedDate(curDate);
		address.setUser(user);
		return addressRepo.save(address).getId();
	}

	@Override
	public Long updateAddress(AddressDto addressDto, Date curDate, User user) {
		Optional<Address> address = addressRepo.findById(addressDto.getId());
		if (address.isPresent()) {
			Address curAddress = address.get();
			Long id = curAddress.getId();
			Date createdDate = curAddress.getCreatedDate();
			curAddress = addressConverter.convertToEntity(addressDto);
			curAddress.setId(id);
			curAddress.setCreatedDate(createdDate);
			curAddress.setUpdatedDate(curDate);
			curAddress.setUser(user);
			return addressRepo.save(curAddress).getId();
		} else {
			return addAddress(addressDto, curDate, user);
		}
	}

}
