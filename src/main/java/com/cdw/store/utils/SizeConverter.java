package com.cdw.store.utils;

import com.cdw.store.dto.SizeDto;
import com.cdw.store.model.Size;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SizeConverter {
    @Autowired
    private ModelMapper modelMapper;

    public SizeDto convertToDto(Size entity){
        return modelMapper.map(entity, SizeDto.class);
    }

    public Size convertToEntity(SizeDto dto){
        return modelMapper.map(dto, Size.class);
    }
}
