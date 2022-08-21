package com.cdw.store.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.cdw.store.dto.AddressDto;
import com.cdw.store.model.Address;
import com.cdw.store.service.IAddressService;

@RestController
@RequestMapping("/address")
public class AddressResource {
	@Autowired
	private IAddressService addressService;
	
	@GetMapping("/all")
	public ResponseEntity<List<AddressDto>> getAllAddresss(){
		List<AddressDto> addresses = addressService.findALlAddresses();
		return new ResponseEntity<List<AddressDto>>(addresses, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Address> getAddressById(@PathVariable("id") Long id){
		Address address = addressService.findAddressById(id);
		return new ResponseEntity<Address>(address, HttpStatus.OK);
	}
	@GetMapping("/all/user{userId}")
	public ResponseEntity<List<AddressDto>> getAllAddressesByUserId(@PathVariable("userId") Long id){
		List<AddressDto> address = addressService.findByAddressUserId(id);
		return new ResponseEntity<List<AddressDto>>(address, HttpStatus.OK);
	}
	@PostMapping("/add")
	public ResponseEntity<Address> addAddress(@RequestBody Address address){
		Address newAddress = addressService.addAddress(address);
		return new ResponseEntity<Address>(newAddress, HttpStatus.CREATED);
	}
	
	@PutMapping("/update")
	public ResponseEntity<Address> updateAddress(@RequestBody Address address){
		Address updateAddress = addressService.addAddress(address);
		return new ResponseEntity<Address>(updateAddress, HttpStatus.OK);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteAddress(@PathVariable("id") Long id){
		addressService.deleteAddress(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
