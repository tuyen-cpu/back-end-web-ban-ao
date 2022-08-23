package com.cdw.store.service;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.GroupProduct;
import org.springframework.data.domain.Page;

public interface IGroupProductService {
    Page<GroupProductDto> getAllGroupProduct(Integer page, Integer size);
    GroupProductDto addGroupProduct(GroupProductDto groupProductDto);
    GroupProductDto getById(Long id);
}
