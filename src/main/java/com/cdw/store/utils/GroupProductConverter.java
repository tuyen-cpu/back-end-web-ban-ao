package com.cdw.store.utils;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.dto.ProductDto;
import com.cdw.store.model.GroupProduct;
import com.cdw.store.model.Product;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public class GroupProductConverter {
    @Autowired
    private ModelMapper modelMapper;
    public Page<GroupProductDto> convertToDto(Page<GroupProduct> pageEntity){
        if (pageEntity == null) {
            return null;
        }
        return pageEntity.map(this::convertToDto);
    }
    public GroupProductDto convertToDto(GroupProduct entity){
        GroupProductDto groupProductDto = new GroupProductDto();
        groupProductDto.setId(entity.getId());
        groupProductDto.setName(entity.getName());
        groupProductDto.setDescription(entity.getDescription());
        groupProductDto.setDiscount(entity.getDiscount());
        groupProductDto.setStatus(entity.getStatus());
        groupProductDto.setCategoryId(entity.getCategory().getId());
        if(entity.getImages().size()>0){
            groupProductDto.setUrlImage(entity.getImages().get(0).getLink());
        }
        return groupProductDto;
    }
    public GroupProduct convertToEntity(GroupProductDto dto){
        return modelMapper.map(dto, GroupProduct.class);
    }
}
