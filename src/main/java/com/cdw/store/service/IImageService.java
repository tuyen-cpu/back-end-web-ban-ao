package com.cdw.store.service;

import com.cdw.store.dto.ImageDto;
import com.cdw.store.model.Image;

import java.util.List;

public interface IImageService {
    public List<ImageDto> findImageByGroupProductId(Long id);
     ImageDto addImage(ImageDto imageDto);
     void deleteImage(Long id);
     ImageDto getImageTopByGroupProductId(Long id);

}
