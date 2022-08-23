package com.cdw.store.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupProductDto {
    private Long id;
    private String name;
    private String description;
    private Integer discount;
    private String urlImage;
    private Integer status;
    private Long categoryId;
}
