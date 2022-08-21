package com.cdw.store.repo;

import com.cdw.store.dto.AddressDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Address;

import java.util.List;

@Repository
public interface AddressRepo extends JpaRepository<Address, Long>{
    public List<Address> findAddressByUserId(Long id);

}
