package com.cdw.store.api;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cdw.store.dto.CheckoutDto;
import com.cdw.store.model.User;
import com.cdw.store.service.IAddressService;
import com.cdw.store.service.IBillService;
import com.cdw.store.service.IUserService;
import com.cdw.store.service.IVoucherService;

@RestController
@RequestMapping("/order")
public class OrderResource {
	@Autowired
	private IVoucherService voucherService;

	@Autowired
	private IAddressService addressService;

	@Autowired
	private IBillService billService;

	@Autowired
	private IUserService userService;

	@PostMapping()
	public ResponseEntity<Long> addOrder(@RequestBody CheckoutDto checkout) {
		Date curDate = new Date();
		Long addressId = checkout.getAddress().getId();
		User user = userService.findUserById(checkout.getUserId());
		Long result = -1l;

		if (user == null) {
			return new ResponseEntity<Long>(result, HttpStatus.BAD_REQUEST);
		}

		if (addressId == null) {
			//create address
			addressId = addressService.addAddress(checkout.getAddress(), curDate, user);
			checkout.getAddress().setId(addressId);
		}else {
			//update address
			addressId = addressService.updateAddress(checkout.getAddress(),curDate, user);
		}

		Long billId = billService.addBill(checkout, curDate, user);
				
		int numVoucher = voucherService.appleVoucherForBill(billId, checkout.getVoucherCodes());

		if (numVoucher == -1) {
			return new ResponseEntity<Long>(result, HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<Long>(billId, HttpStatus.OK);
	}

}
