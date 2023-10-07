package com.art.DAO.Promotion;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.Invoice;
import com.art.Entities.Promotion.InvoiceDetail;

public interface InvoiceDetailDAO extends JpaRepository<InvoiceDetail, Integer> {

//	@SuppressWarnings("unchecked")
//	// Thêm hoặc cập nhật một InvoiceDetail
//	InvoiceDetail save(InvoiceDetail invoiceDetail);
//
//	// Phương thức xóa InvoiceDetail theo ID
//	void deleteById(int invoiceDetailId);
//
//	// Phương thức kiểm tra sự tồn tại của InvoiceDetail theo ID
//	boolean existsById(int invoiceDetailId);
//
//	// Phương thức tìm kiếm InvoiceDetail theo ID
//	Optional<InvoiceDetail> findById(int invoiceDetailId);
//
//	// Tìm kiếm InvoiceDetail theo Invoice
//	List<InvoiceDetail> findByInvoice(Invoice invoice);
//
//	// Tìm kiếm InvoiceDetail theo Product
//	List<InvoiceDetail> findByProduct(Product product);

}
