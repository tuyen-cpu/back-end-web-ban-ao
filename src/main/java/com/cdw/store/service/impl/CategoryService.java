package com.cdw.store.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.model.Category;
import com.cdw.store.repo.CategoryRepo;
import com.cdw.store.service.ICategoryService;
import com.cdw.store.utils.CategoryConverter;
@Service
public class CategoryService implements ICategoryService{
	@Autowired
	private CategoryRepo categoryRepo;
	
	@Autowired
	private CategoryConverter categoryConverter;

	@Override
	public List<CategoryDto> findAll() {
		List<CategoryDto> results = new ArrayList<CategoryDto>();
		List<Category> categories = categoryRepo.findAll();
		if(categories!=null && categories.size()>0) {
			categories.forEach(category->{
				results.add( categoryConverter.convertToDto(category));
			});
		}
		return results;
	}

	@Override
	public Page<CategoryDto> getCategoriesInAdmin(Integer page, Integer size , String status) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("id").ascending());
		Page<Category> categories=null;
		if(status.equals("Active")){
			categories = categoryRepo.findAllByStatus(pageable,status);
		}else{
			categories = categoryRepo.findAll(pageable);
		}
		Page<CategoryDto> results = categories.map(new Function<Category, CategoryDto>() {
			@Override
			public CategoryDto apply(Category entity) {
				CategoryDto dto = new CategoryDto();
				dto = categoryConverter.convertToDto(entity);
				return dto;
			}
		});
		return results ;
	}

	@Transactional
	@Override
	public boolean updateStatus(Long[] ids, String status) {
		for (Long id : ids) {
			Optional<Category> entity = categoryRepo.findById(id);
			if(entity.isPresent()) {
				entity.get().setStatus(status);
				categoryRepo.save(entity.get());
			}
		}
		return true;
	}

	@Transactional
	@Override
	public CategoryDto saveCategory(CategoryDto dto) {
		CategoryDto result = new CategoryDto();
		Category savedCategory = new Category();
		
		if(dto.getId()!=null&&dto.getId()>0) {
			
			Optional<Category> entity = categoryRepo.findById(dto.getId());
			if(entity.isPresent()) {
				BeanUtils.copyProperties(dto, entity.get());
				savedCategory = categoryRepo.save(entity.get());
			}
		}else {
			Category category = new Category();
			BeanUtils.copyProperties(dto, category);
			savedCategory = categoryRepo.save(category);
		}
//		BeanUtils.copyProperties(savedCategory, result);
		result = categoryConverter.convertToDto(savedCategory);
		return result ;
	}

	@Override
	public boolean existAttributeName(String name) {
		return categoryRepo.existsByName(name);
	}
	
	
}
