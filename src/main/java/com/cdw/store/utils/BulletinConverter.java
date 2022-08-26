package com.cdw.store.utils;

import com.cdw.store.dto.BulletinDto;
import com.cdw.store.dto.CategoryDto;
import com.cdw.store.model.Bulletin;
import com.cdw.store.model.Category;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BulletinConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BulletinDto convertToDto(Bulletin entity){
        return modelMapper.map(entity, BulletinDto.class);
    }

    public Bulletin convertToEntity(BulletinDto dto){
        return modelMapper.map(dto, Bulletin.class);
    }

}
