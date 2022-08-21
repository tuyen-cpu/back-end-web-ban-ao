package com.cdw.store.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Bill;

import java.util.List;

@Repository
public interface BillRepo extends JpaRepository<Bill, Long>{
    @Query("SELECT b FROM Bill b where  b.address.user.id=:id")
    List<Bill> findALlByUserId(@Param("id") Long id);

}
