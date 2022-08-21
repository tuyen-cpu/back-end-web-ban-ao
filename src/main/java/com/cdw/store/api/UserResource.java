package com.cdw.store.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cdw.store.dto.UserDto;
import com.cdw.store.dto.UserInAdminDto;
import com.cdw.store.service.impl.UserService;

@RestController
@RequestMapping("/user")
public class UserResource {
	@Autowired
	private UserService userService;

	@GetMapping("/checkUsername")
	public ResponseEntity<Boolean> existUsername(@RequestParam String username) {
		boolean result = userService.existsByUsername(username);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@GetMapping("/checkEmail")
	public ResponseEntity<Boolean> existEmail(@RequestParam String email) {
		boolean result = userService.existsByEmail(email);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@GetMapping("/all")
	public ResponseEntity<List<UserDto>> getUsers() {
		List<UserDto> users = userService.getUsers();
		return new ResponseEntity<List<UserDto>>(users, HttpStatus.OK);
	}

	@GetMapping("/all/admin")
	public ResponseEntity<Page<UserInAdminDto>> getUsersInAdmin(@RequestParam Integer page,
			@RequestParam Integer size) {
		Page<UserInAdminDto> users = userService.getUsersInAdmin(page, size);
		return new ResponseEntity<Page<UserInAdminDto>>(users, HttpStatus.OK);
	}

	@PostMapping()
	public UserDto addUser(@RequestBody UserDto user) {
		return userService.addUser(user);
	}

	@GetMapping("/editStatus")
	public ResponseEntity<Boolean> updateDeletedStatus(@RequestParam Long[] id) {
		boolean result = userService.updateDeletedStatus(id);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@GetMapping("/forgot_password")
	public ResponseEntity<Boolean> processForgotPassword(@RequestParam String email) {
		boolean result = userService.processForgotPassword(email);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@PostMapping("/reset_password")
	public ResponseEntity<Boolean> changePassword(@RequestBody UserDto user) {
		Boolean result = userService.updatePassword(user.getToken(), user.getPassword());
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@GetMapping("/checkToken")
	public ResponseEntity<Boolean> checkValidToken(@RequestParam String token) {
		boolean result = userService.checkValidToken(token);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
}
