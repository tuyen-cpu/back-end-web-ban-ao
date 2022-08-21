package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailBillDto {
	private Long id;
	private String fullname;
	private Long shippingCost;
	private Long total;
	private Integer status;
	private Date createdDate;
	private Date updatedDate;
	private String note;
	private Long voucherCost;
	private String phone;
	private String address;
	private String method;
	private String shippingTime;
	private List<OrderDetailDto> orderDetails = new ArrayList<>();
}
