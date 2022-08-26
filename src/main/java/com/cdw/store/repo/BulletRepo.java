package com.cdw.store.repo;

import com.cdw.store.model.Bulletin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BulletRepo extends JpaRepository<Bulletin, Long> {
    List<Bulletin> findByUserIdAndStatus(Long id ,Integer status);

}
