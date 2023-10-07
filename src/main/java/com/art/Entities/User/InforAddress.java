package com.art.Entities.User;

import org.hibernate.annotations.Nationalized;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
public class InforAddress {

	@Id
	private String phoneNumber;
	
	@Column
	@Nationalized
	private String address;
	
	@ManyToOne
	@JoinColumn(name="userInfor")
	private UserCustom user;
}
