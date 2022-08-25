package com.cdw.store.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cdw.store.dto.BillDto;
import com.cdw.store.dto.BillInAdminDto;
import com.cdw.store.dto.CheckoutDto;
import com.cdw.store.dto.DetailBillDto;
import com.cdw.store.dto.OrderDetailDto;
import com.cdw.store.exception.ProductNotFoundException;
import com.cdw.store.model.Address;
import com.cdw.store.model.Bill;
import com.cdw.store.model.Image;
import com.cdw.store.model.OrderDetail;
import com.cdw.store.model.Product;
import com.cdw.store.model.User;
import com.cdw.store.repo.AddressRepo;
import com.cdw.store.repo.BillRepo;
import com.cdw.store.repo.ImageRepo;
import com.cdw.store.repo.OrderDetailRepo;
import com.cdw.store.repo.ProductRepo;
import com.cdw.store.service.IBillService;
import com.cdw.store.utils.BillConverter;

@Service
public class BillService implements IBillService {
	@Autowired
	private BillRepo billRepo;

	@Autowired
	private BillConverter billConverter;

	@Autowired
	private AddressRepo addressRepo;

	@Autowired
	private OrderDetailRepo orderDetailRepo;

	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private ImageRepo imageRepo;
	
	@Override
	public List<BillDto> findAll() {
		List<Bill> bills = billRepo.findAll();
		List<BillDto> billDtos = bills.stream().map(billEntity -> billConverter.convertToDto(billEntity))
				.collect(Collectors.toList());
		return billDtos;
	}

	@Override
	public List<BillDto> findALlByUserId(Long id) {
		List<Bill> bills = billRepo.findALlByUserId(id);
		List<BillDto> billDtos = bills.stream().map(billEntity -> billConverter.convertToDto(billEntity))
				.collect(Collectors.toList());
		return billDtos;
	}

	@Transactional
	@Override
	public Long addBill(CheckoutDto checkoutDto, Date curDate, User user) {
		Bill bill = new Bill();

		Optional<Address> address = addressRepo.findById(checkoutDto.getAddress().getId());
		if (address.isPresent()) {
			bill.setAddress(address.get());
		}

		bill.setShippingCost(checkoutDto.getShipCost());
		bill.setNote(checkoutDto.getNote());
		bill.setStatus(0);// đang giao
		bill.setCreatedDate(curDate);
		bill.setUpdatedDate(curDate);

		bill.setTotal(checkoutDto.getTotal());

		bill = billRepo.save(bill);

		// add details
		for (OrderDetailDto item : checkoutDto.getCart()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQuantity());
			Product product = productRepo.findById(item.getId()).orElseThrow(
					() -> new ProductNotFoundException("Product by id = " + item.getId() + " was not found"));
			orderDetail.setProductDetail(product);
			orderDetail.setBill(bill);
			orderDetailRepo.save(orderDetail);
		}

		return bill.getId();
	}

	@Override
	public DetailBillDto findById(Long id) {
		Bill bill = billRepo.findById(id)
				.orElseThrow(() -> new RuntimeException("Bill by id = " + id + " was not found"));
		DetailBillDto dto = new DetailBillDto();
		BeanUtils.copyProperties(bill, dto);
		
		dto.setVoucherCost(bill.getVoucher() != null ? bill.getVoucher().getCost() : 0);
		Address address = bill.getAddress();
		dto.setPhone(address.getPhone());
		dto.setFullname(address.getFullname());
		StringBuilder sb = new StringBuilder();
		sb.append(address.getStreet());
		sb.append(", ");
		sb.append(address.getWard());
		sb.append(", ");
		sb.append(address.getDistrict());
		sb.append(", ");
		sb.append(address.getCity());
		sb.append(", ");
		sb.append(address.getCountry());
		dto.setAddress(sb.toString());
		dto.setMethod("Thanh toán khi nhận hàng");
		dto.setShippingTime("Khoảng 2-4 ngày");
		
		List<OrderDetailDto> orderDetailDtos = bill.getOrderDetails().stream().map((item) -> {
			OrderDetailDto detailDto = new OrderDetailDto();
			detailDto.setId(item.getId());
			detailDto.setName(item.getProductDetail().getGroupProduct().getName());
			detailDto.setPrice(item.getPrice());
			detailDto.setQuantity(item.getQuantity());
			
//			Image img = imageRepo.findTopByProductId(item.getId());
//			if(img!=null) {
//				detailDto.setImg(img.getLink());
//			}else {
//				detailDto.setImg("image.jpg");
//			}
			return detailDto;
		}).collect(Collectors.toList());
		dto.setOrderDetails(orderDetailDtos);
		return dto;
	}

	@Override
	public Page<BillInAdminDto> getBillsInAdmin(Integer page, Integer size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("createdDate").descending());
		Page<Bill> bills = billRepo.findAll(pageable);
		Page<BillInAdminDto> results = bills.map(new Function<Bill, BillInAdminDto>() {
			@Override
			public BillInAdminDto apply(Bill entity) {
				BillInAdminDto dto = new BillInAdminDto();
				dto = billConverter.convertToBillInAdminDto(entity);
				return dto;
			}
		});
		return results ;
	}

	@Transactional
	@Override
	public boolean updateCancelledStatus(Long[] ids) {
		for (Long id : ids) {
			if (updateCancelledStatusByBillId(id,2) == false) {
				return false;
			}
		}
		return true;
	}
	
	private boolean updateCancelledStatusByBillId(Long id, Integer status) {
		Optional<Bill> bill = billRepo.findById(id);
		if (bill.isPresent()) {
			bill.get().setStatus(status);// đã hủy
			billRepo.save(bill.get());
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public boolean updateStatus(Long id, Integer status) {
		return updateCancelledStatusByBillId(id,status);
	}
}
