package com.cdw.store.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Category;
@Repository
public interface CategoryRepo extends JpaRepository<Category, Long>{

	Page<Category> findAllByStatus(Pageable pageable, String status);

	boolean existsByName(String name);

}
