package com.cdw.store.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.OrderDetail;
@Repository
public interface OrderDetailRepo extends JpaRepository<OrderDetail, Long> {

}
