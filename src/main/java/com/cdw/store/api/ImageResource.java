package com.cdw.store.api;

import com.cdw.store.dto.DetailProductDto;
import com.cdw.store.dto.ImageDto;
import com.cdw.store.model.Image;
import com.cdw.store.model.ResponseObject;
import com.cdw.store.repo.ImageRepo;
import com.cdw.store.repo.ProductRepo;
import com.cdw.store.service.impl.ImageService;
import com.cdw.store.service.impl.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/image")
public class ImageResource {
    @Autowired
    private ImageService imageService;
    @Autowired
    private ImageRepo imageRepo;

    @GetMapping("/{groupProductId}")
    public ResponseEntity<ResponseObject> getProductById(@PathVariable("groupProductId") Long productId){
     try{
         List<ImageDto> images = imageService.findImageByGroupProductId(productId);
         return new ResponseEntity<>(new ResponseObject("ok","Get Group product success!",images), HttpStatus.OK);
     }catch (Exception e){
         return new ResponseEntity<>(new ResponseObject("failed",e.getMessage(),""), HttpStatus.BAD_REQUEST);
     }
    }
    @PostMapping("/add")
    public ResponseEntity<ResponseObject> addProduct(@RequestBody ImageDto[] imageDto){
       try{
           List<ImageDto> list = new ArrayList<>();
           for(int i =0;i<imageDto.length;i++){
               ImageDto image = imageService.addImage(imageDto[i]);
               list.add(image);
           }
           return new ResponseEntity<>(new ResponseObject("ok","Add image success!",list), HttpStatus.OK);

       }catch (Exception e){
           return new ResponseEntity<>(new ResponseObject("failed","Add image failed!",""), HttpStatus.BAD_REQUEST);

       }

    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<ResponseObject> deleteProduct(@PathVariable("id") Long id){
     try{
         imageService.deleteImage(id);
         return new ResponseEntity<>(new ResponseObject("ok","Delete image success!",id),HttpStatus.OK);

     }catch(Exception e){
         return new ResponseEntity<>(new ResponseObject("failed","Delete image failed!",""),HttpStatus.BAD_REQUEST);

     }
    }
}
