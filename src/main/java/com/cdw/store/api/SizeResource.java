package com.cdw.store.api;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.dto.SizeDto;
import com.cdw.store.model.ResponseObject;
import com.cdw.store.service.ISizeService;
import com.cdw.store.service.impl.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/size")
public class SizeResource {
    @Autowired
    private ISizeService sizeService;
    @GetMapping("/all")
    public ResponseEntity<ResponseObject> getAllSize(@RequestParam Integer page,
                                                     @RequestParam Integer size){
        try{
            Page<SizeDto> sizes = sizeService.getAllSize(page, size);
            return new ResponseEntity<>(new ResponseObject("ok","Get sizes success!",sizes), HttpStatus.OK);

        }catch (Exception e){
            return new ResponseEntity<>(new ResponseObject("failed",e.getMessage(),""), HttpStatus.BAD_REQUEST);

        }

    }
}
