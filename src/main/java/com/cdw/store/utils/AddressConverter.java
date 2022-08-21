package com.cdw.store.utils;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.AddressDto;
import com.cdw.store.model.Address;

@Service
public class AddressConverter {
	@Autowired
    private ModelMapper modelMapper;
	
	public AddressDto convertToDto(Address entity){
        return modelMapper.map(entity, AddressDto.class);
    }
	
	public Address convertToEntity(AddressDto dto){
        return modelMapper.map(dto, Address.class);
    }
}
