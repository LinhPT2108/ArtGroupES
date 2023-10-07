package com.art.Entities.Promotion;

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
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Voucher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "10000")
	private int id;

	@Column
	private double discount;

	@ManyToOne
	@JoinColumn(name="userVoucher")
	private UserCustom user;

}
