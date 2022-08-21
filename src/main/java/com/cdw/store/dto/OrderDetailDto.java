package com.cdw.store.dto;

import com.cdw.store.model.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDto {
	private Long id;//productId
	private Integer quantity;
	private Long price;
	private String name;
	private String img;
}
