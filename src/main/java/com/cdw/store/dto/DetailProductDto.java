package com.cdw.store.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailProductDto {
	private Long id;
	private String name;
	private String brand;
	private Long price;
	private Integer discount;
	private Long quantity;
	private String size;
	private String[] description;
	private String[] promotion;
	private String[] urlImgs;
	private String description_full;
	private String description_short;
	private String category;

}