package com.cdw.store.api;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.dto.ImageDto;
import com.cdw.store.dto.VoucherDto;
import com.cdw.store.repo.GroupProductRepo;
import com.cdw.store.service.impl.GroupProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/group-product")
public class GroupProductResource {
    @Autowired
    private GroupProductService groupProductService;
    @Autowired
    private GroupProductRepo groupProductRepo;
    @GetMapping("/all")
    public ResponseEntity<List<GroupProductDto>> getAll(){
        List<GroupProductDto> groupProductDtos = groupProductService.getAllGroupProduct();
        return new ResponseEntity<>(groupProductDtos, HttpStatus.OK);
    }
    @PostMapping("add")
    public ResponseEntity<GroupProductDto> addGroupProduct(@RequestBody GroupProductDto groupProductDto) {
        GroupProductDto result = groupProductService.addGroupProduct(groupProductDto);
        return new ResponseEntity<GroupProductDto>(result, HttpStatus.OK);
    }
}
