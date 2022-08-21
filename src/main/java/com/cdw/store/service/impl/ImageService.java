package com.cdw.store.service.impl;

import com.cdw.store.dto.ImageDto;
import com.cdw.store.model.Image;
import com.cdw.store.repo.ImageRepo;
import com.cdw.store.service.IImageService;
import com.cdw.store.utils.ImageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ImageService implements IImageService {
    @Autowired
    ImageRepo imageRepo;
    @Autowired
    ImageConverter imageConverter;
    @Override
    public List<ImageDto> findImageByProductId(Long id) {
    return imageRepo.findImageByProductId(id).stream().map(productEntity->imageConverter.convertToDto(productEntity)).collect(Collectors.toList());

    }

    @Override
    public ImageDto addImage(ImageDto imageDto) {
        Image image = imageConverter.convertToEntity(imageDto);
        return imageConverter.convertToDto(imageRepo.save(image));
    }

    @Override
    public void deleteImage(Long id) {
      imageRepo.deleteById(id);
    }
}
