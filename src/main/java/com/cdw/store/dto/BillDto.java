package com.cdw.store.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDto {
	private Long id;
	private Long shippingCost;
	private Long total;
	private Integer status; // 0: dang giao, 1:da giao, 2:huy
	private Date createdDate;
	private Date updatedDate;
	private String stringAddress;
	private String currentPhone;
}
