package com.art.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.DAO.Promotion.InvoiceDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.Invoice;

@Controller
@RequestMapping("/admin")
public class StatisticalController {

	@Autowired
	InvoiceDAO revenueService;
	
	@Autowired
	InvoiceDetailDAO idDAO;
	
	@Autowired
	UserCustomDAO uDAO;
	
	 @GetMapping("/statistical-revenue/daily-revenue")
	    public ResponseEntity<?> getDailyRevenue() {
	        // Gọi phương thức của dịch vụ để lấy dữ liệu doanh thu theo ngày
	        List<String> labels = revenueService.getLabelsRevenueByDate();
	        List<Double> values = revenueService.getPriceRevenueByDate();
	        Map<String, Object> responseData = new HashMap<>();

	        responseData.put("labels", labels);
	        responseData.put("values", values);
	        return ResponseEntity.ok(responseData);

	    }

	    @GetMapping("/statistical-revenue/monthly-revenue")
	    public ResponseEntity<?> getMonthlyRevenue() {
	        // Gọi phương thức của dịch vụ để lấy dữ liệu doanh thu theo tháng
	        List<Integer> labels = revenueService.getMonthLabelsRevenue();
	        List<Double> values = revenueService.getTotalAmountByMonth();

	        Map<String, Object> responseData = new HashMap<>();
	        responseData.put("labels", labels);
	        responseData.put("values", values);

	        return ResponseEntity.ok(responseData);
	    }

	    @GetMapping("/statistical-revenue/yearly-revenue")
	    public ResponseEntity<?> getYearlyRevenue() {
	        // Gọi phương thức của dịch vụ để lấy dữ liệu doanh thu theo năm
	        List<Integer> labels = revenueService.getYearLabelsRevenue();
	        List<Double> values = revenueService.getTotalAmountByYear();

	        Map<String, Object> responseData = new HashMap<>();
	        responseData.put("labels", labels);
	        responseData.put("values", values);

	        return ResponseEntity.ok(responseData);
	    }
	

	@GetMapping("/statistical-order")
	public String showOrders(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "order-form");
		model.addAttribute("title", "Thống kê đơn hàng");
		model.addAttribute("invoice", revenueService.findAllByOrderByInvoiceDateDesc());
		System.out.println("status: "+revenueService.findAllByOrderByInvoiceDateDesc().get(0).getStatus());

		System.out.println(revenueService.findAllByOrderByInvoiceDateDesc().get(0).getStatus()==1?"ok":"fail");
		return "admin/index";
	}

    @PostMapping("/update-status")
    @ResponseBody
    public ResponseEntity<String> updateStatus(@RequestParam int itemId, @RequestParam Integer status) {
        // Gọi phương thức service để cập nhật trạng thái hóa đơn
    	updateStatusOrder(itemId, status);
        return ResponseEntity.ok("Cập nhật trạng thái thành công");
    }
    
    public void updateStatusOrder(int itemId, Integer status) {
        Optional<Invoice> optionalInvoice = Optional.of(revenueService.findById(itemId));
        if (optionalInvoice.isPresent()) {
            Invoice invoice = optionalInvoice.get();
            invoice.setStatus(status);
            revenueService.save(invoice);
        }
    }
	
	@GetMapping("/statistical-wishlist")
	public String showWishlists(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "wishlist-form");
		model.addAttribute("title", "Thống kê sản phẩm theo lượt yêu thích");

		return "admin/index";
	}

	@GetMapping("/statistical-best-seller")
	public String showBestSeller(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "best-seller-form");
		model.addAttribute("title", "Thống kê sản phẩm bán chạy");

		
		//sản phẩm bán chạy
		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());
		
		return "admin/index";
	}

	@GetMapping("/statistical-orders-by-user")
	public String showOrdersByUser(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "orders-by-user-form");
		model.addAttribute("title", "Thống kê đơn hàng theo tài khoản");
		model.addAttribute("ordersByUser", uDAO.getUsersWithInvoiceCount());
		
		return "admin/index";
	}
}
