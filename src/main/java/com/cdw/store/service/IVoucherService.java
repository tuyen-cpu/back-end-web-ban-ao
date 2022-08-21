package com.cdw.store.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;

import com.cdw.store.dto.VoucherDto;

public interface IVoucherService {

	boolean existsByCode(String code, Date currentTime);

	Long useByCode(String code, Date currentTime);

	int appleVoucherForBill(Long billId, List<String> codes);// return number of voucher added

	Page<VoucherDto> getVouchersInAdmin(Integer page, Integer size);

	boolean delete(Long[] ids);

	boolean updateStatusById(Long[] id, Integer status);

	VoucherDto saveVoucher(VoucherDto user);
}
