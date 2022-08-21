package com.cdw.store.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.cdw.store.dto.CommentDto;

public interface ICommentService {

	CommentDto addComment(CommentDto commentDto);

	List<CommentDto> getAllCommentByProductId(Long id);

	Page<CommentDto> getAllCommentByProductId(Long id, Integer page);
	
	List<Float> getPercentCommentsByProductId(Long id);

	Float getAverageStarByProductId(Long id);

	Page<CommentDto> getCommentsInAdmin(Integer page, Integer size);

	boolean delete(Long[] id);

	boolean updateStatusById(Long[] id, Integer status);
}
