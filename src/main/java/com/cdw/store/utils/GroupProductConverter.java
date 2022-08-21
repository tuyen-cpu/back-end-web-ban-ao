package com.cdw.store.utils;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.GroupProduct;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupProductConverter {
    @Autowired
    private ModelMapper modelMapper;

    public GroupProductDto convertToDto(GroupProduct entity){
        return modelMapper.map(entity, GroupProductDto.class);
    }
    public GroupProduct convertToEntity(GroupProductDto dto){
        return modelMapper.map(dto, GroupProduct.class);
    }
}
