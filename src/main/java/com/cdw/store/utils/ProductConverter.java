package com.cdw.store.utils;

import java.util.ArrayList;
import java.util.List;

import com.cdw.store.dto.ProductAddDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.DetailProductDto;
import com.cdw.store.dto.ProductDto;
import com.cdw.store.model.Image;
import com.cdw.store.model.Product;

@Service
public class ProductConverter {
	@Autowired
	private ModelMapper modelMapper;
	public Product convertToEntity(ProductDto dto) {

		return modelMapper.map(dto,Product.class);
	}
	public Page<ProductDto> convertToDto(Page<Product> pageEntity){
		if (pageEntity == null) {
			return null;
		}
		return pageEntity.map(this::convertToDto);
	}
	public ProductDto convertToDto(Product entity) {
		System.out.println(entity.getGroupProduct().getName());
		ProductDto dto= new ProductDto();
		dto.setId(entity.getId());
		dto.setGroupProductId(entity.getGroupProduct().getId());
		dto.setName(entity.getGroupProduct().getName());
		dto.setPrice(entity.getPrice());
		dto.setSizeName(entity.getSize().getName());
//		dto.setCategoryId(entity.getCategory().getId());
		dto.setSizeId(entity.getSize().getId());
		dto.setQuantity(entity.getQuantity());
		dto.setStatus(entity.getStatus());
		if(entity.getGroupProduct().getImages().size()>0){
			dto.setUrlImg(entity.getGroupProduct().getImages().get(0).getLink());
		}

		return dto;
	}
	
	public DetailProductDto convertToDetailProductDto (Product entity) {
		DetailProductDto dto= new DetailProductDto();
		dto.setId(entity.getId());
		dto.setPrice(entity.getPrice());
		dto.setQuantity(dto.getQuantity());
		dto.setQuantity(entity.getQuantity());
		dto.setSize(entity.getSize().getName());
		//get brand
		String brand = "";
//		List<Attribute> attributes = entity.getAttributes();
//		for (Attribute attribute : attributes) {
//			if(attribute.getName().equals("THƯƠNG HIỆU")) {
//				brand=attribute.getValue();
//			}
//		}
		dto.setBrand(brand);
		
//		List<Image> imgs = entity.getImages();
//		if(imgs!=null && imgs.size()>0) {
//			List<String> urlImgs = new ArrayList<String>();
//			imgs.stream().forEach(img->{
//				urlImgs.add(img.getLink());
//			});
//			String urls[] = urlImgs.toArray(new String[urlImgs.size()]);
//			dto.setUrlImgs(urls);
//		}
		
//		String summary = entity.getSummary();
//		if(summary!=null && summary!="") {
//			String[] description= summary.split(";");
//			dto.setDescription(description);
//		}
//
//		String promotion = entity.getPromotion();
//		if(promotion!=null && promotion!="") {
//			String[] promotions= promotion.split(";");
//			dto.setPromotion(promotions);
//		}
//
//		dto.setDescription_full(entity.getLongDescription());
//		dto.setDescription_short(entity.getShortDescription());
		return dto;
	}
	public Product convertAddProductToEntity(ProductAddDto productAddDto){

		return modelMapper.map(productAddDto,Product.class);
	}
}
