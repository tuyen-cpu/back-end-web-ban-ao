package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoucherDto {
	private Long id;
	private String code;
	private Long cost;
	private Date startedDate;
	private Date endedDate;
	private Integer status;
	private Integer time;
	private List<Long> billIds = new ArrayList<>();

}