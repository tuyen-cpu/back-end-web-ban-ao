package com.cdw.store.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BulletinDto {
    private Long id;
    private String name;
    private String status;
    private Long userId;
}
