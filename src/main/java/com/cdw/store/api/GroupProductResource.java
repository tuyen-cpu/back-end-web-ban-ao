package com.cdw.store.api;

import com.cdw.store.dto.GroupProductDto;
import com.cdw.store.dto.ImageDto;
import com.cdw.store.dto.VoucherDto;
import com.cdw.store.model.GroupProduct;
import com.cdw.store.model.ResponseObject;
import com.cdw.store.repo.GroupProductRepo;
import com.cdw.store.service.impl.GroupProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    public ResponseEntity<ResponseObject> getAll(@RequestParam Integer page,
                                                 @RequestParam Integer size){
        try{
            Page<GroupProductDto> groupProductDtos = groupProductService.getAllGroupProduct(page,size);
            return new ResponseEntity<>(new ResponseObject("ok","Get group product success!",groupProductDtos), HttpStatus.OK);

        }catch (Exception e){
            return new ResponseEntity<>(new ResponseObject("failed",e.getMessage(),""), HttpStatus.BAD_REQUEST);

        }
        }
    @GetMapping("/{id}")
    public ResponseEntity<ResponseObject> getById(@PathVariable Long id){
        try{
            GroupProductDto groupProductDto = groupProductService.getById(id);
            return new ResponseEntity<>(new ResponseObject("ok","Get group product success!",groupProductDto), HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(new ResponseObject("failed",e.getMessage(),""), HttpStatus.BAD_REQUEST);

        }
    }
    @PostMapping("add")
    public ResponseEntity<ResponseObject> addGroupProduct(@RequestBody GroupProductDto groupProductDto) {
      try{
          GroupProductDto result = groupProductService.addGroupProduct(groupProductDto);
          return new ResponseEntity<ResponseObject>(new ResponseObject("ok","Add group product success!",result), HttpStatus.OK);

      }catch (Exception e){
          return new ResponseEntity<ResponseObject>(new ResponseObject("failed",e.getMessage(),""), HttpStatus.BAD_REQUEST);

      }

    }
}
