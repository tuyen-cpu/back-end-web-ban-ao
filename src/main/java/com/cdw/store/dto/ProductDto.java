package com.cdw.store.dto;

import com.cdw.store.model.GroupProduct;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
	private Long id;
	private String name;
	private String desc;
	private Long quantity;
	private Long price;
	private Integer discount;
	private String urlImg;
	private Integer status;
	private Long groupProductId;
}
