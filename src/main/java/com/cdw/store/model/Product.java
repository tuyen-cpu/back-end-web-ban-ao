package com.cdw.store.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "product")
public class Product  implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "group_product_id")
	@JsonIgnore
	private GroupProduct groupProduct;
	private Long quantity;
	private Long price; // gia nhap kho
	private Integer status; // 0:ngung ban, 1: con hang

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "size_id")
	@JsonIgnore
	private Size size;







	@JsonIgnore
	@OneToMany(mappedBy = "productComment", cascade = CascadeType.ALL)
	private List<Comment> comments = new ArrayList<>();

	@JsonIgnore
	@OneToMany(mappedBy = "productDetail", cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetails = new ArrayList<>();
	
//	@JsonIgnore
//	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
//	@JoinTable(name = "product_attribute", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "attribute_id"))
//	List<Attribute> attributes = new ArrayList<>();

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Product product = (Product) o;
		return Objects.equals(id, product.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
}
