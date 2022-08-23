package com.cdw.store.dto;

import com.cdw.store.model.GroupProduct;
import com.cdw.store.model.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto implements Serializable {
	private Long id;
	private Long quantity;
	private Long price;
	private String sizeName;
	private Long sizeId;
	private String urlImg;
	private Integer status;
	private Long groupProductId;
}
