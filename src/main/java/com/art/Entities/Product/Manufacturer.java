package com.art.Entities.Product;

import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.art.Entities.User.UserCustom;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Manufacturer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column
	@Nationalized
	private String manufacturerName;

	@Column
	private boolean del;

	@ManyToOne
	@JoinColumn(name = "userManufacturer")
	private UserCustom user;

	@OneToMany(mappedBy = "manufacturerProduct")
	private List<Product> manufacturer;

}
