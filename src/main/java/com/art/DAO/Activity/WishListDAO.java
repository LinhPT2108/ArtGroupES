package com.art.DAO.Activity;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.WishList;

public interface WishListDAO extends JpaRepository<WishList, Integer> {

//	// Thêm hoặc cập nhật một sản phẩm vào WishList
//	@SuppressWarnings("unchecked")
//	WishList save(WishList wishList);
//
//	// Xóa một sản phẩm khỏi danh sách mong muốn theo ID
//	void deleteById(int wishListId);
//
//	// Tìm kiếm sản phẩm trong danh sách mong muốn theo ID
//	Optional<WishList> findById(int wishListId);
//
//	// Lấy tất cả các sản phẩm trong danh sách mong muốn của một người dùng
//	List<WishList> findByUser(UserCustom user);
//
//	// Lấy tất cả các người dùng đã thêm một sản phẩm vào WishList
//	List<WishList> findByProduct(Product product);

}
