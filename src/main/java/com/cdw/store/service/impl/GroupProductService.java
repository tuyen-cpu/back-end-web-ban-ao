package com.cdw.store.service.impl;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.model.Category;
import com.cdw.store.model.GroupProduct;
import com.cdw.store.repo.GroupProductRepo;
import com.cdw.store.service.IGroupProductService;
import com.cdw.store.utils.GroupProductConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GroupProductService implements IGroupProductService {
    @Autowired
    private GroupProductRepo productGroupRepo;

    @Autowired
    private GroupProductConverter groupProductConverter;
    @Override
    public Page<GroupProductDto> getAllGroupProduct(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<GroupProduct> groupProducts = productGroupRepo.findAll(pageable);
        return groupProductConverter.convertToDto(groupProducts);
    }

    @Override
    public GroupProductDto addGroupProduct(GroupProductDto groupProductDto) {
        return groupProductConverter.convertToDto(productGroupRepo.save(groupProductConverter.convertToEntity(groupProductDto)));
    }

    @Override
    public GroupProductDto getById(Long id) {
        Optional<GroupProduct> gr = Optional.ofNullable(productGroupRepo.findById(id).orElseThrow(() -> new RuntimeException(("Group product " + id + " not found!"))));
        return groupProductConverter.convertToDto(gr.get());

    }

    @Override
    public boolean updateStatus(Long id, Integer status) {
        System.out.println("ở đây");
        Optional<GroupProduct> entity = productGroupRepo.findById(id);
        System.out.println("đây nữa");
        if(entity.isPresent()) {
            entity.get().setStatus(status);
            productGroupRepo.save(entity.get());
            System.out.println("OK");
            return true;
        }
        return false;
    }
}
