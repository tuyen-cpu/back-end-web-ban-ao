package com.cdw.store.utils;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.model.Category;

@Service
public class CategoryConverter {
	@Autowired
    private ModelMapper modelMapper;
	
	public CategoryDto convertToDto(Category entity){
        return modelMapper.map(entity, CategoryDto.class);
    }
	
	public Category convertToEntity(CategoryDto dto){
        return modelMapper.map(dto, Category.class);
    }
}
