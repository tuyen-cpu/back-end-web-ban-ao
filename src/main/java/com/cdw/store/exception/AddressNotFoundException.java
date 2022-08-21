package com.cdw.store.exception;

public class AddressNotFoundException extends RuntimeException {
	public AddressNotFoundException(String message) {
		super(message);
	}
}