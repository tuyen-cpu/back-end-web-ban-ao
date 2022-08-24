package com.cdw.store.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.dto.MenuDto;
import com.cdw.store.service.ICategoryService;

@RestController
@RequestMapping("/category")
public class CategoryResource {
	@Autowired
	private ICategoryService categoryService;

	@GetMapping("/menu")
	public ResponseEntity<List<MenuDto>> loadMenu() {
		List<MenuDto> menus = new ArrayList<MenuDto>();
		if (categoryService.findAll().size() > 0) {
			categoryService.findAll().forEach(category -> {
				MenuDto menuDto = new MenuDto();
				menuDto.setId(category.getId());
				menuDto.setCategoryName(category.getName());

				menus.add(menuDto);
			});
		}
		return new ResponseEntity<>(menus, HttpStatus.OK);
	}

	@GetMapping("/all/admin")
	public ResponseEntity<Page<CategoryDto>> getAllCategoriesInAdmin(@RequestParam Integer page,
			@RequestParam Integer size,@RequestParam String status) {
		Page<CategoryDto> categories = categoryService.getCategoriesInAdmin(page, size,status);
		return new ResponseEntity<Page<CategoryDto>>(categories, HttpStatus.OK);
	}

	@GetMapping("/updateStatus")
	public ResponseEntity<Boolean> updateStatus(@RequestParam Long[] id, @RequestParam String status) {
		boolean result = categoryService.updateStatus(id, status);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@PostMapping()
	public ResponseEntity<CategoryDto> saveCategory(@RequestBody CategoryDto dto) {
		CategoryDto result = categoryService.saveCategory(dto);
		return new ResponseEntity<CategoryDto>(result, HttpStatus.CREATED);
	}
	
	@GetMapping("/checkCategoryName")
	public ResponseEntity<Boolean> existCategoryName(@RequestParam String name) {
		boolean result = categoryService.existAttributeName(name);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
}
