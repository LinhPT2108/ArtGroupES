package com.art.DAO.Activity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.art.Entities.Activity.Comment;
import com.art.Entities.Activity.ImageComment;

@Transactional
public interface ImageCommentDAO extends JpaRepository<ImageComment, Integer> {

	@SuppressWarnings("unchecked")
	// Thêm hoặc cập nhật một hình ảnh
	ImageComment save(ImageComment image);

//	
//	// Xóa một hình ảnh dựa trên ID
//	void deleteById(int imageId);
//	
//	// Tìm hình ảnh theo ID
	List<ImageComment> findById(int imageId);
//	
//	// Tìm hình ảnh thông qua sản phẩm
//	List<Image> findByProduct(Product product);

	void deleteByComment(Comment comment);

}
