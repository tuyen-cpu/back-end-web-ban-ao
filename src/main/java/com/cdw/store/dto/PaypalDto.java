package com.cdw.store.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaypalDto {
    private double price;
    private String currency;
    private String method;
    private String intent;
    private String description;
}
