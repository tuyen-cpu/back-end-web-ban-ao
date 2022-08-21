package com.cdw.store.utils;

import com.cdw.store.dto.ImageDto;
import com.cdw.store.dto.UserDto;
import com.cdw.store.model.Image;
import com.cdw.store.model.User;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageConverter {
    @Autowired
    private ModelMapper modelMapper;

    public ImageDto convertToDto(Image entity){
        return modelMapper.map(entity, ImageDto.class);
    }

    public Image convertToEntity(ImageDto dto){
        return modelMapper.map(dto, Image.class);
    }
}
