package com.art.DAO.Promotion;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Promotion.Invoice;
import com.art.Entities.User.UserCustom;

public interface InvoiceDAO extends JpaRepository<Invoice, Integer>{

//	@SuppressWarnings("unchecked")
//	// Thêm hoặc cập nhật một Invoice
//    Invoice save(Invoice invoice);
//
//    @SuppressWarnings("unchecked")
//	// Phương thức cập nhật Invoice
//    Invoice saveAndFlush(Invoice invoice);
//
//    // Xóa Invoice theo id
//    void deleteById(int flashSaleId);
//	
//    // Kiểm tra sự tồn tại của FlashSale theo ID
//    boolean existsById(int flashSaleId);
//    
//	// tìm kiếm hóa đơn theo người dùng
//	List<Invoice> findByUser(UserCustom user);
//
//	// Tìm kiếm các hóa đơn có ngày nằm trong khoảng từ một ngày bắt đầu đến một ngày kết thúc
//    List<Invoice> findByInvoiceDateBetween(Date startDate, Date endDate);
//
//    // Tìm kiếm các hóa đơn có tổng số tiền lớn hơn hoặc bằng một số tiền cụ thể
//    List<Invoice> findByTotalAmountGreaterThanEqual(BigDecimal minAmount);
//
//    // Tìm kiếm các hóa đơn dựa trên nội dung ghi chú chứa một từ khóa cụ thể
//    List<Invoice> findByNoteContaining(String keyword);
//
//    // Tìm kiếm các hóa đơn dựa trên người dùng và tổng số tiền lớn hơn hoặc bằng một số tiền cụ thể
//    List<Invoice> findByUserAndTotalAmountGreaterThanEqual(UserCustom user, BigDecimal minAmount);
}
