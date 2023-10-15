package com.art.DAO.Activity;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.Cart;
import com.art.Entities.Product.Product;
import com.art.Entities.User.UserCustom;

public interface CartDAO extends JpaRepository<Cart, Integer> {
	
	// Thêm hoặc cập nhật một giỏ hàng
//	@SuppressWarnings("unchecked")
//	Cart save(Cart cart);
//	
//	// Xóa một giỏ hàng theo ID
//	void deleteById(int cartId);
//	
//	// Tìm giỏ hàng theo ID
//	Optional<Cart> findById(int cartId);
//	
//	// Lấy tất cả các giỏ hàng của một người dùng
//	List<Cart> findByUser(UserCustom user);
//	
//	// Lấy tất cả các giỏ hàng chứa một sản phẩm
//	List<Cart> findByProduct(Product product);
//
//	// Lấy tất cả các giỏ hàng chứa một sản phẩm
//	List<Cart> findByPrice(double price);
}
