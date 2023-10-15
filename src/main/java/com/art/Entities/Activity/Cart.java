package com.art.Entities.Activity;

import com.art.Entities.Product.Product;
import com.art.Entities.User.UserCustom;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartId;

	@ManyToOne
	@JoinColumn(name = "userCart")
	private UserCustom user;

	@ManyToOne
	@JoinColumn(name = "productCart")
	private Product product;

	@Column(name = "quantity", nullable = false)
	private int quantity;
}
