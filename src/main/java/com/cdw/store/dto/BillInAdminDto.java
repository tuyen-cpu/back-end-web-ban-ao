package com.cdw.store.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BillInAdminDto {
	private Long id;
	private String fullname;
	private Long userId;
	private String phone;
	private String address;
	private Date updatedDate;
	private Long voucherCost;
	private Long total;
	private Integer status;
}
