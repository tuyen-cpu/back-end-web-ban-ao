package com.cdw.store.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.CategoryDto;
import com.cdw.store.dto.CommentDto;
import com.cdw.store.exception.ProductNotFoundException;
import com.cdw.store.exception.UserNotFoundException;
import com.cdw.store.model.Category;
import com.cdw.store.model.Comment;
import com.cdw.store.model.Product;
import com.cdw.store.model.User;
import com.cdw.store.repo.CommentRepo;
import com.cdw.store.repo.ProductRepo;
import com.cdw.store.repo.UserRepo;
import com.cdw.store.service.ICommentService;
import com.cdw.store.service.IStorageService;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class CommentService implements ICommentService {
	@Autowired
	private CommentRepo commentRepo;
	@Autowired
	private ProductRepo productRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private IStorageService storageService;

	@Override
	public CommentDto addComment(CommentDto commentDto) {
		Comment comment = new Comment();
		BeanUtils.copyProperties(commentDto, comment);
		comment.setCreatedDate(new Date());
		comment.setId(null);

		Product product = productRepo.findById(commentDto.getProductId()).orElseThrow(
				() -> new ProductNotFoundException("Product by id = " + commentDto.getProductId() + " was not found"));
		comment.setProductComment(product);

		if (commentDto.getUserId() != -1l) {
			User user = userRepo.findById(commentDto.getUserId()).orElseThrow(
					() -> new UserNotFoundException("User by id = " + commentDto.getUserId() + " was not found"));

			comment.setUserComment(user);
		}

		comment = commentRepo.save(comment);

		CommentDto result = new CommentDto();
		BeanUtils.copyProperties(comment, result);

		return result;
	}

	@Override
	public List<CommentDto> getAllCommentByProductId(Long id) {
		List<Comment> comments = commentRepo.findByProductCommentId(id);
		List<CommentDto> commentDtos = comments.stream().map((item) -> {
			CommentDto dto = new CommentDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
		return commentDtos;
	}

	@Override
	public Page<CommentDto> getAllCommentByProductId(Long id, Integer page) {
		Pageable nthPageWithFiveElements = PageRequest.of(page, 5, Sort.by("createdDate").descending());
		// Pageable nthPageWithFiveElements = PageRequest.of(page, 5);

		Page<Comment> comments = commentRepo.findByProductCommentId(id, nthPageWithFiveElements);
		Page<CommentDto> results = comments.map(new Function<Comment, CommentDto>() {
			@Override
			public CommentDto apply(Comment entity) {
				CommentDto dto = new CommentDto();
				BeanUtils.copyProperties(entity, dto);
				return dto;
			}
		});
		return results;
	}

	@Override
	public List<Float> getPercentCommentsByProductId(Long id) {
		List<Float> results = new ArrayList<Float>();
		int allComment = commentRepo.countByProductId(id);
		if (allComment > 0) {
			for (int i = 1; i <= 5; i++) {
				int numComment = commentRepo.countByProductIdAndStar(id, i);
				float percent = (float) (((float) numComment / allComment) * 100);
				results.add((float) (Math.round(percent)));
			}
		} else {
			Float[] percents = { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f };
			results = Arrays.asList(percents);
		}

		return results;
	}

	@Override
	public Float getAverageStarByProductId(Long id) {
		Float result = commentRepo.averageStarByProductId(id);
		return (result==null?0.0f:(float) (Math.round(result * 100.0) / 100.0));
	}

	@Override
	public Page<CommentDto> getCommentsInAdmin(Integer page, Integer size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("id").ascending());
		Page<Comment> categories = commentRepo.findAllByStatus(pageable, 1);
		Page<CommentDto> results = categories.map(new Function<Comment, CommentDto>() {
			@Override
			public CommentDto apply(Comment entity) {
				CommentDto dto = new CommentDto();
				BeanUtils.copyProperties(entity, dto);
				if (entity.getUserComment() != null) {
					dto.setUserId(entity.getUserComment().getId());
				}
				if (entity.getProductComment() != null) {
					dto.setProductId(entity.getProductComment().getId());
				}
				return dto;
			}
		});
		return results;
	}

	@Transactional
	@Override
	public boolean delete(Long[] ids) {
		for (Long id : ids) {
			String urls = commentRepo.getUrlImgById(id);
			if (urls != null && urls != "") {
				for (String filename : urls.split(",")) {
					storageService.deleteByFilename(filename);
				}
			}
		}
		commentRepo.deleteAllByIdIn(ids);
		return true;
	}

	@Transactional
	@Override
	public boolean updateStatusById(Long[] ids, Integer status) {
		for (Long id : ids) {
			Optional<Comment> entity = commentRepo.findById(id);
			if(entity.isPresent()) {
				entity.get().setStatus(status);
				commentRepo.save(entity.get());
			}
		}
		return true;
	}

}
