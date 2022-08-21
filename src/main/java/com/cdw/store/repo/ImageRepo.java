package com.cdw.store.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Image;

import java.util.List;

@Repository
public interface ImageRepo extends JpaRepository<Image, Long>{
    @Query("Select distinct i from Image i  where i.product.id=:id")
    List<Image> findImageByProductId(Long id);

	Image findTopByProductId(Long id);

}
