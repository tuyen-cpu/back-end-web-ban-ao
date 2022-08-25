package com.cdw.store.repo;


import com.cdw.store.model.GroupProduct;
import com.cdw.store.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupProductRepo extends JpaRepository<GroupProduct, Long> {
Page<GroupProduct> findByNameContainingIgnoreCaseOrCategoryNameContainingIgnoreCase(String name,String categoryName, Pageable pageable);
Page<GroupProduct> findByCategoryId(Long id,Pageable pageable);
}

