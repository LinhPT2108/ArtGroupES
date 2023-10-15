package com.art.service;


import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import com.art.DAO.Activity.CartDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.Promotion.PromotionalDetails;
import com.art.Entities.User.UserCustom;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session;
	@Autowired
	FlashSaleDAO fsDAO;
	@Autowired
	PromotionalDetailsDAO pmtDAO;
	@Autowired
	CartDAO cartDAO;

	/**
	 * Đọc giá trị của attribute trong session
	 * 
	 * @param name tên attribute
	 * @return giá trị đọc được hoặc null nếu không tồn tại
	 */
	@SuppressWarnings("unchecked")
	public <T> T get(String name) {
		return (T) session.getAttribute(name);
	}

	/**
	 * Thay đổi hoặc tạo mới attribute trong session
	 * 
	 * @param name  tên attribute
	 * @param value giá trị attribute
	 */
	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}

	/**
	 * Xóa attribute trong session
	 * 
	 * @param name tên attribute cần xóa
	 */
	public void remove(String name) {
		session.removeAttribute(name);
	}

	public void setCart(List<Cart> cart) {

		FlashSale isFlashSale = fsDAO.findByIsStatus(false).get(0);

		if (isFlashSale != null) {
			List<PromotionalDetails> pmt = pmtDAO.findByFlashSale_Id(isFlashSale.getId());
			session.setAttribute("ssPdFlashSale", pmt);
			session.setAttribute("isFlashSale", true);
		} else {
			session.setAttribute("isFlashSale", false);
		}
		session.setAttribute("carts", cart);

		Double totalPrice = totalPriceCartByUserId(get("userLogin"));
		session.setAttribute("totalPriceInCart", totalPrice);
	}
	
	public double totalPriceCartByUserId(UserCustom userId) {
		
		FlashSale isFlashSale = fsDAO.findByIsStatus(false).get(0);

		List<Cart> cartList = cartDAO.findByUser(userId);

		double totalPrice = 0;
		if (isFlashSale != null) {
			List<PromotionalDetails> pmt = pmtDAO.findByFlashSale_Id(isFlashSale.getId());

			for (Cart cart : cartList) {
				Boolean isSale = false;
				for (PromotionalDetails p : pmt) {
					if (cart.getProduct().getProductId() == p.getProduct().getProductId()) {
						isSale = true;
					}
				}
				if (isSale) {
					totalPrice += cart.getProduct().getProductPromotionalDetails().get(0).getDiscountedPrice()
							* cart.getQuantity();
				} else { 
					BigDecimal bigDecimalValue = new BigDecimal(String.valueOf(cart.getProduct().getPrice())); 
					int intValue = cart.getQuantity(); 

					BigDecimal result = bigDecimalValue.multiply(new BigDecimal(intValue));
					totalPrice += Double.parseDouble(String.valueOf(result));
				}
			}
		} else {
			for (Cart cart : cartList) {
				BigDecimal bigDecimalValue = new BigDecimal(String.valueOf(cart.getProduct().getPrice())); 
				int intValue = cart.getQuantity(); 

				BigDecimal result = bigDecimalValue.multiply(new BigDecimal(intValue));
				totalPrice += Double.parseDouble(String.valueOf(result));
			}
		}
		return totalPrice;
	}
}
