package com.cdw.store.repo;


import com.cdw.store.model.GroupProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupProductRepo extends JpaRepository<GroupProduct, Long> {

}
