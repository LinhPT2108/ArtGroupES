package com.art.DAO.User;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Product.Manufacturer;

public interface ManufacturerReponsitory extends JpaRepository<Manufacturer, Integer> {

}
