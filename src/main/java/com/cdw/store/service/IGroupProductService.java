package com.cdw.store.service;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.GroupProduct;
import org.springframework.data.domain.Page;

import java.security.acl.Group;

public interface IGroupProductService {
    Page<GroupProductDto> getAllGroupProduct(Integer page, Integer size);
    GroupProductDto addGroupProduct(GroupProductDto groupProductDto);
    GroupProductDto getById(Long id);

    boolean updateStatus(Long id, Integer status);
    Page<GroupProductDto> getByCategoryId(Long id,Integer page, Integer size);
Page<GroupProductDto> getByNameOrCategoryName(String q,Integer page, Integer size);
}
