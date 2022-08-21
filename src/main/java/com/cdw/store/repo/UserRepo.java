package com.cdw.store.repo;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.User;
@Repository
public interface UserRepo extends JpaRepository<User, Long> {
	Optional<User> findByUsername(String username);

	Boolean existsByUsername(String username);

	Boolean existsByEmail(String email);

	Page<User> findAll(Pageable pageable);

	Optional<User> findByEmail(String email);

	Optional<User> findByToken(String token);

	Optional<User> findByUsernameAndStatus(String username, Integer status);
	
}
