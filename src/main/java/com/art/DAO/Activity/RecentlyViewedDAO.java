package com.art.DAO.Activity;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.RecentlyViewed;
import com.art.Entities.Product.Product;
import com.art.Entities.User.UserCustom;

public interface RecentlyViewedDAO extends JpaRepository<RecentlyViewed, Integer> {

//	// Thêm hoặc cập nhật một mục đã xem
//	@SuppressWarnings("unchecked")
//	RecentlyViewed save(RecentlyViewed recentlyViewed);
//	
//	// Xóa một mục đã xem gần đây theo ID
//	void deleteById(int recentlyViewedId);
//	
//	// Tìm mục đã xem gần đây theo ID
//	Optional<RecentlyViewed> findById(int recentlyViewedId);
//	
//	// Lấy tất cả các mục đã xem gần đây của một người dùng
//	List<RecentlyViewed> findByUser(UserCustom user);
//	
//	// Lấy tất cả các mục đã xem gần đây của một sản phẩm
//	List<RecentlyViewed> findByProduct(Product product);
	
	
}
