package com.cdw.store.service;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.GroupProduct;

import java.util.List;

public interface IGroupProductService {
    List<GroupProductDto> getAllGroupProduct();
    GroupProductDto addGroupProduct(GroupProductDto groupProductDto);
}
