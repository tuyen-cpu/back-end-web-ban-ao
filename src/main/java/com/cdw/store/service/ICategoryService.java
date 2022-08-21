package com.cdw.store.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.CategoryDto;

@Service
public interface ICategoryService {
	
	List<CategoryDto> findAll();

	Page<CategoryDto> getCategoriesInAdmin(Integer page, Integer size);

	boolean updateStatus(Long[] id, String status);

	CategoryDto saveCategory(CategoryDto dto);

	boolean existAttributeName(String name);
	
}
