package com.cdw.store.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "voucher")
public class Voucher {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String code;
	private Long cost;
	@Column(name = "started_date")
	private Date startedDate;
	@Column(name = "ended_date")
	private Date endedDate;
	@Column(name = "status")
	private Integer status;
	@Column(name = "time")
	private Integer time;
	
	@JsonIgnore
	@OneToMany(mappedBy = "voucher", cascade = CascadeType.ALL)
	private List<Bill> bills = new ArrayList<>();

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Voucher voucher = (Voucher) o;
		return Objects.equals(id, voucher.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
}
