package com.cdw.store.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Response;
@Repository
public interface ResponseRepo extends JpaRepository<Response, Long>{

}
