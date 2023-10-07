package com.art.DAO.Product;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Product.Manufacturer;
import com.art.Entities.User.UserCustom;

public interface ManufacturerDAO extends JpaRepository<Manufacturer, Integer>{

//	@SuppressWarnings("unchecked")
//	// Thêm hoặc cập nhật một nhà sản xuất
//	Manufacturer save(Manufacturer manufacturer);
//	
//	// Xóa một nhà sản xuất dựa trên ID
//	void deleteById(int manufacturerId);
//	
//	// Tìm nhà sản xuất theo ID
//	Optional<Manufacturer> findById(int manufacturerId);
//	
//	// Lấy tất cả nhà sản xuất theo tên nhà sản xuất
//	List<Manufacturer> findByManufacturerName(String manufacturerName);
//
//	// Lấy tất cả nhà sản xuất với trạng thái xóa
//    List<Manufacturer> findByDel(boolean isDel);
//
//    // Lấy tất cả nhà sản xuất theo người tạo
//    List<Manufacturer> findByUser(UserCustom user);
	
	
	
}
