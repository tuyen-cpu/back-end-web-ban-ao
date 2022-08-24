package com.cdw.store.service;


import com.cdw.store.dto.SizeDto;
import org.springframework.data.domain.Page;

public interface ISizeService {
    Page<SizeDto> getAllSize(Integer page, Integer size);
}
