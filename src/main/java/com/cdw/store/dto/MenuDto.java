package com.cdw.store.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDto {
	private Long id;
	private String categoryName;
	private List<String> brands= new ArrayList<String>();
}
