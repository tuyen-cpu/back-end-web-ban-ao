package com.cdw.store.api;

import com.cdw.store.dto.BulletinDto;
import com.cdw.store.model.ResponseObject;
import com.cdw.store.service.IBulletinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bulletin")
public class BulletinResource {
    @Autowired
    private IBulletinService bulletinService;
    @GetMapping("/all/{userId}")
    public ResponseEntity<ResponseObject> getByUserId(@PathVariable Long userId) {
       try{
           List<BulletinDto> result =bulletinService.getByUserId(userId);
           return new ResponseEntity<>(new ResponseObject("ok","Success!",result), HttpStatus.OK);

       }catch (Exception e){
           return new ResponseEntity<>(new ResponseObject("ok",e.getMessage(),""), HttpStatus.BAD_REQUEST);

       }
    }
    @PutMapping("/update")
    public ResponseEntity<ResponseObject> getByUserId(@RequestBody BulletinDto bulletinDto) {
        try{
           bulletinService.update(bulletinDto);
            return new ResponseEntity<>(new ResponseObject("ok","Success!",""), HttpStatus.OK);

        }catch (Exception e){
            return new ResponseEntity<>(new ResponseObject("ok",e.getMessage(),""), HttpStatus.BAD_REQUEST);

        }
    }    @PostMapping("/add")
    public ResponseEntity<ResponseObject> add(@RequestBody BulletinDto bulletinDto) {
        try{
            bulletinService.add(bulletinDto);
            return new ResponseEntity<>(new ResponseObject("ok","Success!",""), HttpStatus.OK);

        }catch (Exception e){
            return new ResponseEntity<>(new ResponseObject("ok",e.getMessage(),""), HttpStatus.BAD_REQUEST);

        }
    }

}
