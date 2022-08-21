package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CheckoutDto {
	private AddressDto address;
	private List<String> voucherCodes = new ArrayList<String>();
	private Long shipCost;
	private List<OrderDetailDto> cart = new ArrayList<OrderDetailDto>();
	private Long userId;
	private Long total;
	private String note;
}
