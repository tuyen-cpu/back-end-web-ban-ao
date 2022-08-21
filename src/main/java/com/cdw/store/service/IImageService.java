package com.cdw.store.service;

import com.cdw.store.dto.ImageDto;
import com.cdw.store.model.Image;

import java.util.List;

public interface IImageService {
    public List<ImageDto> findImageByProductId(Long id);
    public ImageDto addImage(ImageDto imageDto);
    public void deleteImage(Long id);
}
