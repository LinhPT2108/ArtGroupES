package com.art.DAO.Activity;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.ImageComment;
import com.art.Entities.Product.Image;


public interface ImageCommentDAO extends JpaRepository<ImageComment, Integer>{

	
	@SuppressWarnings("unchecked")
	// Thêm hoặc cập nhật một hình ảnh
	Image save(Image image);
//	
//	// Xóa một hình ảnh dựa trên ID
//	void deleteById(int imageId);
//	
//	// Tìm hình ảnh theo ID
//	Optional<Image> findById(int imageId);
//	
//	// Tìm hình ảnh thông qua sản phẩm
//	List<Image> findByProduct(Product product);
	
	
	
	
}
