package com.cdw.store.repo;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Product;

import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    @Query("SELECT p FROM Product p WHERE UPPER(p.groupProduct.name) LIKE %?1%")
    List<Product> search(String keyword);
    Page<Product> findByGroupProductNameContainingIgnoreCase(String q, Pageable pageable);

//    @Query("Select distinct p from Product p join p.attributes a join a.category c where c.id = :id")
//    @Query("Select distinct p from Product p join p.attributes a join a.category c where c.id = :id")
//        Page<Product> findProductsByCategoryId(Long id, Pageable pageable);


//    @Query("Select distinct p from Product p join p.attributes a join a.category c where c.name = :name")
//        Page<Product> findProductsByCategogyName(String name, Pageable pageable);

	@Query("SELECT p.quantity FROM Product p WHERE p.id = :id")
	Long getQuantityProductByProductId(@Param("id") Long id);
	
	@Query("SELECT p.price-(p.price*(p.discount/100)) FROM Product p WHERE p.id = :id")
	Long getOutputPriceProductByProductId(Long id);
    @Query("Select distinct p.longDescription from Product p  where p.id = :id")
    String getLongDescriptionById(Long id);

    Boolean existsByGroupProductIdAndSizeId(Long groupProductId, Long sizeId);

}
