package com.cdw.store.utils;

import org.modelmapper.ModelMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.BillDto;
import com.cdw.store.dto.BillInAdminDto;
import com.cdw.store.model.Address;
import com.cdw.store.model.Bill;
import com.cdw.store.model.Voucher;

@Service
public class BillConverter {
	@Autowired
	private ModelMapper modelMapper;

	public BillDto convertToDto(Bill entity) {
		BillDto dto = new BillDto();

		dto = modelMapper.map(entity, BillDto.class);

		Address address = entity.getAddress();
		StringBuilder sb = new StringBuilder();
		sb.append(address.getStreet());
		sb.append(", ");
		sb.append(address.getWard());
		sb.append(", ");
		sb.append(address.getDistrict());
		sb.append(", ");
		sb.append(address.getCity());
		dto.setStringAddress(sb.toString());

		dto.setCurrentPhone(address.getPhone());

		return dto;
	}

	public BillInAdminDto convertToBillInAdminDto(Bill entity) {
		BillInAdminDto dto = new BillInAdminDto();
		BeanUtils.copyProperties(entity, dto);
		Address address = entity.getAddress();
		if(address!=null) {
			StringBuilder sb = new StringBuilder();
			sb.append(address.getStreet());
			sb.append(", ");
			sb.append(address.getWard());
			sb.append(", ");
			sb.append(address.getDistrict());
			sb.append(", ");
			sb.append(address.getCity());
			dto.setAddress(sb.toString());
			
			dto.setPhone(address.getPhone());
			
			if(address.getUser()!=null) {
				dto.setFullname(address.getUser().getUsername());
			}
		}
		
		Voucher voucher = entity.getVoucher();
		if(voucher != null) {
			dto.setVoucherCost(voucher.getCost());
		}else {
			dto.setVoucherCost(0l);
		}
		
		return dto;
	}
}
