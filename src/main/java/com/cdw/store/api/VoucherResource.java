package com.cdw.store.api;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cdw.store.dto.BillInAdminDto;
import com.cdw.store.dto.UserDto;
import com.cdw.store.dto.VoucherDto;
import com.cdw.store.service.IVoucherService;

@RestController
@RequestMapping("/voucher")
public class VoucherResource {
	@Autowired
	private IVoucherService voucherService;

	@GetMapping("/checkCode")
	public ResponseEntity<Boolean> existVoucherCode(@RequestParam String code) {
		Date currentTime = new Date();
		boolean result = voucherService.existsByCode(code, currentTime);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/useCode")
	public ResponseEntity<Long> useVoucherCode(@RequestParam String code) {
		Date currentTime = new Date();
		Long result = voucherService.useByCode(code, currentTime);
		return new ResponseEntity<Long>(result, HttpStatus.OK);
	}
	
	@GetMapping("/all/admin")
	public ResponseEntity<Page<VoucherDto>> getAllVouchersInAdmin(@RequestParam Integer page,
			@RequestParam Integer size) {
		Page<VoucherDto> vouchers = voucherService.getVouchersInAdmin(page, size);
		return new ResponseEntity<Page<VoucherDto>>(vouchers, HttpStatus.OK);
	}
	
	@DeleteMapping()
	public ResponseEntity<Boolean> delete(@RequestParam Long[] id) {
		boolean result = voucherService.delete(id);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/updateStatus")
	public ResponseEntity<Boolean> updateStatus(@RequestParam Long[] id, @RequestParam Integer status) {
		boolean result = voucherService.updateStatusById(id, status);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@PostMapping()
	public ResponseEntity<VoucherDto> addUser(@RequestBody VoucherDto voucher) {
		VoucherDto result = voucherService.saveVoucher(voucher);
		return new ResponseEntity<VoucherDto>(result, HttpStatus.OK);
	}
}
