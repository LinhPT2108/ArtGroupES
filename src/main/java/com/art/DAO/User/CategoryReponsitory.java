package com.art.DAO.User;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Product.Category;



public interface CategoryReponsitory extends JpaRepository<Category, Integer>{
	
	
	
}
