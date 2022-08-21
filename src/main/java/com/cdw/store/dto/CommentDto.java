package com.cdw.store.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
	private Long id;
	private String content;
	private Integer status;
	private Integer star;
	private String urlImg;
	private String phone;
	private String fullname;
	private Date createdDate;
	private Long userId;
	private Long productId;
}
