package com.cdw.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdw.store.model.Role;
import com.cdw.store.repo.RoleRepo;
import com.cdw.store.service.IRoleService;

@Service
public class RoleService implements IRoleService {
	@Autowired
	private RoleRepo roleRepo;

	@Override
	public Role addUser(Role role) {
		return roleRepo.save(role);
	}

	@Override
	public List<Role> findALlRoles() {
		return roleRepo.findAll();
	}

	@Override
	public Role updateRole(Role role) {
		return roleRepo.save(role);
	}

	@Override
	public void deleteRole(Long id) {
		roleRepo.deleteById(id);
	}

	@Override
	public Role findRoleById(Long id) {
		return roleRepo.findById(id).orElseThrow(() -> new RuntimeException("Error: Role is not found."));
	}

	@Override
	public Role findByName(String name) {
		return roleRepo.findByName(name).orElseThrow(() -> new RuntimeException("Error: Role is not found."));
	}
	
	
}
