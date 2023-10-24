package com.art.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Activity.CartDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.InvoiceDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.DAO.User.InforAddressDAO;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.Promotion.Invoice;
import com.art.Entities.Promotion.InvoiceDetail;
import com.art.Entities.Promotion.PromotionalDetails;
import com.art.Entities.User.InforAddress;
import com.art.Entities.User.UserCustom;
import com.art.service.ParamService;
import com.art.service.SessionService;

@Controller
@RequestMapping("/checkout")
public class checkoutController {
	@Autowired
	FlashSaleDAO flashSaleDAO;
	@Autowired
	PromotionalDetailsDAO pmtDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	InforAddressDAO inforAddressDAO;
	@Autowired
	SessionService session;
	@Autowired
	ParamService param;
	@Autowired
	InvoiceDAO ivDao;
	@Autowired
	InvoiceDetailDAO ivdtDao;
	@Autowired
	CartDAO cartDAO;

	@GetMapping("")
	public String getCheckout(Model model) {
		List<InforAddress> inforAddresses = inforAddressDAO.findByUser(session.get("userLogin"));
		model.addAttribute("listAddress", inforAddresses);

		return "checkout";
	}

	@PostMapping("")
	public ResponseEntity<?> postCheckout() {
		Map<String, String> errors = new HashMap<>();
		String note = param.getString("note", "");
		Double totalAmount = param.getDouble("totalAmount", 0);
		BigDecimal totalBigDecimal = BigDecimal.valueOf(totalAmount);
		System.out.println(note.equals("Chọn địa chỉ...") + " - " + totalBigDecimal);
		UserCustom userCustom = session.get("userLogin");
		if (note.equals("Chọn địa chỉ...")) {
			errors.put("address", "Vui lòng chọn thông tin giao hàng");
		}
		if (!errors.isEmpty()) {
			return ResponseEntity.ok(errors);
		} else {
			try {
				Invoice invoice = new Invoice();
				invoice.setInvoiceDate(new Date());
				invoice.setNote(note);
				invoice.setStatus(1);
				invoice.setTotalAmount(totalBigDecimal);
				invoice.setUser(userCustom);
				ivDao.save(invoice);

				List<Cart> cartItems = cartDAO.findByUser(userCustom);
				for (Cart cartItem : cartItems) {
					InvoiceDetail invoiceDetail = new InvoiceDetail();
					invoiceDetail.setInvoice(invoice);
					invoiceDetail.setProduct(cartItem.getProduct());
					invoiceDetail.setQuantity(cartItem.getQuantity());
					invoiceDetail.setPrice(getPriceProduct(cartItem.getProduct().getProductId()));
					ivdtDao.save(invoiceDetail);
				}

				List<Cart> listCarts = cartDAO.findByUser(userCustom);
				for (Cart cart : listCarts) {
					cartDAO.deleteById(cart.getCartId());
				}
				List<Cart> listCarts2 = cartDAO.findByUser(userCustom);
				session.setCart(listCarts2);
				return ResponseEntity.ok("success");

			} catch (Exception e) {
				System.out.println(e);
				// TODO: handle exception
				return ResponseEntity.ok("fail");
			}

		}
	}

	public BigDecimal getPriceProduct(String productID) {
		FlashSale isFlashSale = flashSaleDAO.findByIsStatus(false);

		BigDecimal price = null;

		if (isFlashSale != null) {
			List<PromotionalDetails> pmt = pmtDAO.findByFlashSale_Id(isFlashSale.getId());

			Boolean isSale = false;
			for (PromotionalDetails p : pmt) {
				if (productID == p.getProduct().getProductId()) {
					isSale = true;
					price = BigDecimal.valueOf(p.getDiscountedPrice());
					return price;
				}
			}
			if (!isSale) {
				price = pdDAO.getById(productID).getPrice();
			}
		} else {
			price = pdDAO.getById(productID).getPrice();
		}

		return price;
	}
}
