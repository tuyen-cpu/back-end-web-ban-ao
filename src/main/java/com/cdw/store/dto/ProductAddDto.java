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
public class ProductAddDto implements Serializable {
    private Long id;
    private String name;
    private String longDescription;
    private Long price;
    private Long quantity;
    private Long sizeId;
    private Integer discount;
    private Integer status;
    private Long categoryId;
    private Long groupProductId;
}