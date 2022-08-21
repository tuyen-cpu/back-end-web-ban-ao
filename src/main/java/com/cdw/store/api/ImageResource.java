package com.cdw.store.api;

import com.cdw.store.dto.DetailProductDto;
import com.cdw.store.dto.ImageDto;
import com.cdw.store.model.Image;
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

    @GetMapping("/{productId}")
    public ResponseEntity<List<ImageDto>> getProductById(@PathVariable("productId") Long productId){
        List<ImageDto> images = imageService.findImageByProductId(productId);
        return new ResponseEntity<>(images, HttpStatus.OK);
    }
    @PostMapping("/add")
    public ResponseEntity<List<ImageDto>> addProduct(@RequestBody ImageDto[] imageDto){
        List<ImageDto> list = new ArrayList<>();
        for(int i =0;i<imageDto.length;i++){
            ImageDto image = imageService.addImage(imageDto[i]);
            list.add(image);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Long> deleteProduct(@PathVariable("id") Long id){
        imageService.deleteImage(id);
        return new ResponseEntity<>(id,HttpStatus.OK);
    }
}
