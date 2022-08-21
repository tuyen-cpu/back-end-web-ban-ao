package com.cdw.store.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.VoucherDto;
import com.cdw.store.model.Bill;
import com.cdw.store.model.Voucher;
import com.cdw.store.repo.BillRepo;
import com.cdw.store.repo.VoucherRepo;
import com.cdw.store.service.IVoucherService;

@Service
public class VoucherService implements IVoucherService {
	@Autowired
	private VoucherRepo voucherRepo;

	@Autowired
	private BillRepo billRepo;

	@Override
	public boolean existsByCode(String code, Date currentTime) {
		return voucherRepo
				.existsByCodeAndTimeGreaterThanAndStatusAndStartedDateLessThanEqualAndEndedDateGreaterThanEqual(code, 0,
						1, currentTime, currentTime);
	}

	@Transactional
	@Override
	public Long useByCode(String code, Date currentTime) {
		Optional<Voucher> voucher = voucherRepo
				.findByCodeAndTimeGreaterThanAndStatusAndStartedDateLessThanEqualAndEndedDateGreaterThanEqual(code, 0,
						1, currentTime, currentTime);
		if (voucher.isPresent()) {
			Voucher currentVoucher = voucher.get();
			return currentVoucher.getCost();
		}

		return -1L;// het han
	}

	@Override
	public int appleVoucherForBill(Long billId, List<String> codes) {
		int result = 0;
		Optional<Bill> bill = billRepo.findById(billId);
		if (bill.isPresent()) {
			Bill curBill = bill.get();
			for (String code : codes) {
				Optional<Voucher> voucher = voucherRepo.findByCode(code);
				if (voucher.isPresent()) {
					Voucher curVoucher = voucher.get();
					curVoucher.setTime(curVoucher.getTime() - 1);
					curBill.setVoucher(curVoucher);
					voucherRepo.save(curVoucher);
					result++;
				}
			}
			return result;
		}

		return -1; // error
	}

	@Override
	public Page<VoucherDto> getVouchersInAdmin(Integer page, Integer size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("id").ascending());
		Page<Voucher> vouchers = voucherRepo.findAll(pageable);
		Page<VoucherDto> results = vouchers.map(new Function<Voucher, VoucherDto>() {
			@Override
			public VoucherDto apply(Voucher entity) {
				VoucherDto dto = new VoucherDto();
				BeanUtils.copyProperties(entity, dto);
				if(entity.getBills()!=null && entity.getBills().size()>0) {
					Long[] ids = entity.getBills().stream()
						    .map(bill -> bill.getId())
						    .toArray(Long[]::new);
					dto.setBillIds(Arrays.asList(ids));
				}
				
				return dto;
			}
		});
		return results ;
	}
	
	@Transactional
	@Override
	public boolean delete(Long[] ids) {
		voucherRepo.deleteAllByIdIn(ids);
		return true;
	}

	@Transactional
	@Override
	public boolean updateStatusById(Long[] ids, Integer status) {
		for (Long id : ids) {
			Optional<Voucher> entity = voucherRepo.findById(id);
			if(entity.isPresent()) {
				entity.get().setStatus(status);
				voucherRepo.save(entity.get());
			}
		}
		return true;
	}

	@Transactional
	@Override
	public VoucherDto saveVoucher(VoucherDto dto) {
		VoucherDto result = new VoucherDto();
		Voucher savedVoucher = null;
		
		if(dto.getId()!=null && dto.getId()>0) {
			Optional<Voucher> voucher = voucherRepo.findById(dto.getId());
			if(voucher.isPresent()) {
				BeanUtils.copyProperties(dto, voucher.get());
				savedVoucher = voucherRepo.save(voucher.get());
			}
		}else {
			Voucher voucher = new Voucher();
			BeanUtils.copyProperties(dto, voucher);
			voucher.setId(null);
			savedVoucher = voucherRepo.save(voucher);
		}
		BeanUtils.copyProperties(savedVoucher, result );
		return result;
	}
}
