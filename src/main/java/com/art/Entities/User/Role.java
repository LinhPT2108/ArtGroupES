package com.art.Entities.User;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Entity
@Data
public class Role {
	@Id
	private String roleName;
	
	@OneToMany(mappedBy = "roleName")
	private List<UserCustom> role;
	
}
