package com.cdw.store.service;

import java.util.List;

import com.cdw.store.model.Role;

public interface IRoleService {
	public Role addUser(Role role);

	public List<Role> findALlRoles();

	public Role updateRole(Role role);

	public void deleteRole(Long id);

	public Role findRoleById(Long id);
	
	public Role findByName(String name);
}
