package com.cdw.store.service.impl;

import com.cdw.store.dto.AddressDto;
import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.GroupProduct;
import com.cdw.store.repo.GroupProductRepo;
import com.cdw.store.service.IGroupProductService;
import com.cdw.store.utils.GroupProductConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
@Service
public class GroupProductService implements IGroupProductService {
    @Autowired
    private GroupProductRepo productGroupRepo;

    @Autowired
    private GroupProductConverter groupProductConverter;
    @Override
    public List<GroupProductDto> getAllGroupProduct() {
       return productGroupRepo.findAll().stream()
                .map(addressEntity -> groupProductConverter.convertToDto(addressEntity)).collect(Collectors.toList());
    }

    @Override
    public GroupProductDto addGroupProduct(GroupProductDto groupProductDto) {
        return groupProductConverter.convertToDto(productGroupRepo.save(groupProductConverter.convertToEntity(groupProductDto)));
    }
}
