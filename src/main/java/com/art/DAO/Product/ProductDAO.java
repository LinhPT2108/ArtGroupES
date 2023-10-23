package com.art.DAO.Product;

import java.util.List;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.art.Entities.Product.Category;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.Product.Product;

public interface ProductDAO extends JpaRepository<Product, String> {

//	// Thêm Product
//    @SuppressWarnings("unchecked")
//	Product save(Product product);
//
//    // Cập nhật Product
//    @SuppressWarnings("unchecked")
//	Product saveAndFlush(Product product);
//
//    // Xóa Product theo ID
//    void deleteById(String productId);
//
//    // Kiểm tra sự tồn tại của Product theo ID
//    boolean existsById(String productId);
//
//    // Tìm Product theo ID
//    Product findByProduct_id(String product_id);
//
//    // Tìm tất cả Product
//    List<Product> findAll();
//
//    // Tìm Product theo tên
	List<Product> findByProductName(String productName);

	@Query("SELECT p FROM Product p WHERE p.productName LIKE %:keyword%")
	List<Product> searchProductByName(String keyword);

	@Query("SELECT p FROM Product p WHERE p.productName LIKE %:keyword% AND p.categoryProduct = :category")
	List<Product> searchProductByNameAndCategory(String keyword, Category category);

//
//    // Tìm Product theo số lượng trong kho
//    List<Product> findByQuantityInStock(int quantityInStock);
//
//    // Tìm Product theo trạng thái is_del
	List<Product> findByDel(boolean isDel);

//
//    // Tìm Product theo giá
//    List<Product> findByPrice(BigDecimal price);
//
//    // Tìm Product theo ID của UserCustom
//    List<Product> findByUser_UserId(int userId);
//
//    // Tìm Product theo ID của Category
	List<Product> findByCategoryProduct(Category categoryProduct);

	List<Product> findByCategoryProductAndManufacturerProduct(Category category, Manufacturer manufacturer);

//    // Tìm Product theo ID của Manufacturer
	List<Product> findByManufacturerProduct(Manufacturer manufacturerProduct);
}
