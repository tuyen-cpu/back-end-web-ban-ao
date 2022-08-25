package com.cdw.store.service;

import java.util.List;

import com.cdw.store.dto.DetailProductDto;
import com.cdw.store.dto.ImageDto;
import com.cdw.store.dto.ProductAddDto;
import com.cdw.store.dto.ProductDto;
import com.cdw.store.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IProductService {
	 ProductDto addProduct(ProductAddDto productAddDto);

	 List<ProductDto> findALlProducts();

	 ProductDto updateProduct(ProductDto productDto);

	 void deleteProduct(Long id);

	 DetailProductDto findProductById(Long id);
	ProductDto getProductById(Long id);
	 List<ProductDto> searchProducts(String key);
	 Page<ProductDto>searchAndPaging(String q,Pageable  paging);
//	public Page<ProductDto>findByCategoryId(Long id,Pageable  paging);
	 Page<ProductDto>findAll(Pageable  paging);

	 Long getQuantityProductByProductId (Long id);

//	 Long getOutputPriceProductById (Long id);

//	 String getLongDescription(Long id);
	void updateProduct(ProductAddDto productAddDto);
	 List<ProductDto> test();

	boolean existsByGroupProductIdAndSizeId(Long groupProductId,Long sizeId);
	boolean existsById(Long id);

	List<ProductDto> getByGroupProductId(Long id);
}
