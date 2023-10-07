package com.art.DAO.Activity;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.Comment;
import com.art.Entities.Product.Product;
import com.art.Entities.User.UserCustom;

public interface CommentDAO extends JpaRepository<Comment, Integer> {
	
//	// Thêm hoặc cập nhật một bình luận
//	@SuppressWarnings("unchecked")
//	Comment save(Comment comment);
//	
//	// Xóa một bình luận theo ID
//	void deleteById(int commentId);
//	
//	// Tìm bình luận theo ID
//	Optional<Comment> findById(int commentId);
//	
//	// Lấy tất cả các bình luận của một người dùng
//	List<Comment> findByUser(UserCustom user);
//	
//	// Lấy tất cả các bình luận của một sản phẩm
//	List<Comment> findByProduct(Product product);
	
	
	
}
