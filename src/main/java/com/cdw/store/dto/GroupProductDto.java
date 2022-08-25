package com.cdw.store.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupProductDto {
    private Long id;
    private String name;
    private Long price;
    private String description;
    private Integer discount;
    private String urlImage;
    private Integer status;
    private Long categoryId;
    private List<ProductDto> products;
}
