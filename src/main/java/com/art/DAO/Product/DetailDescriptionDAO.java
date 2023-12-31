package com.art.DAO.Product;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.art.Entities.Product.DetailDescription;
import com.art.Entities.Product.Product;


@Transactional
public interface DetailDescriptionDAO extends JpaRepository<DetailDescription, Integer> {

	@SuppressWarnings("unchecked")
	// Thêm hoặc cập nhật một đối tượng DetailDescription.
	DetailDescription save(DetailDescription detailDescription);

	// Xóa một mô tả chi tiết dựa trên ID
	void deleteById(int detailDescriptionId);

	// Tìm mô tả chi tiết theo ID
	Optional<DetailDescription> findById(int detailDescriptionId);

	void deleteByProduct(Product product);
}
