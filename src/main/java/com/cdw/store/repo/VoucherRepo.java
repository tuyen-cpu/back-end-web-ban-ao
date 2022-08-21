package com.cdw.store.repo;

import java.util.Date;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdw.store.model.Voucher;

@Repository
public interface VoucherRepo extends JpaRepository<Voucher, Long> {

	boolean existsByCodeAndTimeGreaterThanAndStatusAndStartedDateLessThanEqualAndEndedDateGreaterThanEqual(String code,
			int status, int time, Date currentTime, Date currentTime2);

	Optional<Voucher> findByCodeAndTimeGreaterThanAndStatusAndStartedDateLessThanEqualAndEndedDateGreaterThanEqual(
			String code, int status, int time, Date currentTime, Date currentTime2);

	Optional<Voucher> findByCode(String code);

	void deleteAllByIdIn(Long[] ids);

}
