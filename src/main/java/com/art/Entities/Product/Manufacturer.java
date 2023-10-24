package com.art.Entities.Product;

import java.util.List;
import java.util.Objects;

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
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter 
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Manufacturer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column
	@Nationalized
	@NotNull(message = "Tên thương hiệu không được để trống")
	private String manufacturerName;

	@Column
	private boolean del;

	@ManyToOne
	@JoinColumn(name = "userManufacturer")
	private UserCustom user;

	@OneToMany(mappedBy = "manufacturerProduct")
	private List<Product> manufacturer;

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Manufacturer other = (Manufacturer) obj;
		return id == other.id;
	}

	
}
