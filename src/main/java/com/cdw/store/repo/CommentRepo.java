package com.cdw.store.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cdw.store.dto.CommentDto;
import com.cdw.store.model.Comment;
@Repository
public interface CommentRepo extends JpaRepository<Comment, Long> {

	List<Comment> findByProductCommentId(Long id);

	Page<Comment> findByProductCommentId(Long id, Pageable nthPageWithFiveElements);

	@Query("select count(c) from Comment c where c.productComment.id=:productId and c.status = 1")
	Integer countByProductId(@Param("productId") Long productId);
	
	@Query("select count(c) from Comment c where c.productComment.id=:productId and c.star=:star  and c.status = 1")
	Integer countByProductIdAndStar(@Param("productId") Long productId,@Param("star") Integer star);
	
	@Query("select AVG(star) from Comment c where c.productComment.id=:productId  and c.status = 1")
	Float averageStarByProductId(@Param("productId") Long productId);

	Page<Comment> findAllByStatus(Pageable pageable, Integer status);

	void deleteAllByIdIn(Long[] ids);

	@Query("select c.urlImg from Comment c where c.id=:id ")
	String getUrlImgById(Long id);
	
}
