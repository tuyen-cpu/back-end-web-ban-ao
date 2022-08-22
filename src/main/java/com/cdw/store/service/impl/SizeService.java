package com.cdw.store.service.impl;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.dto.SizeDto;
import com.cdw.store.model.Category;
import com.cdw.store.model.Size;
import com.cdw.store.repo.SizeRepo;
import com.cdw.store.service.ISizeService;
import com.cdw.store.utils.SizeConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.function.Function;
@Service
public class SizeService implements ISizeService {
    @Autowired
    private SizeRepo sizeRepo;
    @Autowired
    private SizeConverter sizeConverter;
    @Override
    public Page<SizeDto> getAllSize(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").ascending());
        Page<Size> sizes= sizeRepo.findAll(pageable);

        Page<SizeDto> results = sizes.map(new Function<Size, SizeDto>() {
            @Override
            public SizeDto apply(Size entity) {
             return sizeConverter.convertToDto(entity);
            }
        });
        return results ;
    }
}
