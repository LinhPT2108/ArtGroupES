package com.art.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Activity.CartDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.PromotionalDetails;
import com.art.Entities.User.UserCustom;
import com.art.service.ParamService;
import com.art.service.SessionService;

@Controller
@RequestMapping("/cart")
public class cartController {
	@Autowired
	private ParamService param;
	@Autowired
	private SessionService session;
	@Autowired
	private CartDAO caDAO;
	@Autowired
	private ProductDAO pdDAO;
	@Autowired
	private UserCustomDAO usDAO;
	@Autowired
	private PromotionalDetailsDAO pmtDAO;

	@PostMapping("/get-cart-info")
	public ResponseEntity<?> getCart() {
		try {
			UserCustom userCustom = session.get("userLogin");
			int cartCount = caDAO.findByUser(userCustom).size();
			String productID = param.getString("product_id", "");
			Double totalPrice = session.totalPriceCartByUserId(userCustom);
			Product pd = pdDAO.getById(productID);
			int cartID = caDAO.findByProductAndUser(pd, userCustom).getCartId();
			System.out.println(cartID);
			BigDecimal price = null;

			List<PromotionalDetails> pds = pmtDAO.findAll();
			boolean check = false;
			for (PromotionalDetails p : pds) {
				if (p.getProduct().getProductId().equals(productID)) {
					price = BigDecimal.valueOf(p.getDiscountedPrice());
					check = true;
				}
			}
			if (!check) {
				price = pdDAO.getById(productID).getPrice();
			}

			String jsonResponse = "{\"cartCount\":" + cartCount + ", \"cartId\":" + cartID + ", \"productName\":\""
					+ pd.getProductName() + "\", \"originalPrice\":" + pd.getPrice() + ", \"discountedPrice\":" + price
					+ ", \"productId\":\"" + productID + "\", \"quantity\":" + 1 + ", \"image\":\""
					+ pd.getProductImage().get(0).getImage() + "\", \"totalPrice\":" + totalPrice
					+ ", \"quantityInStock\":" + pd.getQuantityInStock() + "}";
			return ResponseEntity.ok(jsonResponse);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return ResponseEntity.ok("fail");

	}

	@PostMapping("/add-to-cart")
	public ResponseEntity<?> addToCart(Model model) {
		UserCustom uLogin = session.get("userLogin");
		String productID = param.getString("productId", "");
		int quantityInCart = param.getInt("quantityInCart", 1);
//		System.out.println(productID + " - " + quantityInCart);
		BigDecimal price;

		List<PromotionalDetails> pds = pmtDAO.findAll();
		boolean check = false;
		for (PromotionalDetails p : pds) {
			if (p.getProduct().getProductId() == productID) {
				price = BigDecimal.valueOf(p.getDiscountedPrice());
				check = true;
			}
		}
		if (!check) {
			price = pdDAO.getById(productID).getPrice();
		}
		List<Cart> pdInCart = caDAO.findByUser(uLogin);
		boolean checkPD = false;
		int duplicateCart = 0;
		for (Cart cart : pdInCart) {
			System.out.println(cart.getProduct().getProductId().equals(productID));
			if (cart.getProduct().getProductId().equals(productID)) {
				Cart cartPlus = cart;
				cartPlus.setCartId(cart.getCartId());
				cartPlus.setQuantity(cart.getQuantity() + 1);
				System.out.println(cartPlus.getCartId());
				caDAO.save(cartPlus);
				List<Cart> listC = caDAO.findByUser(uLogin);
				System.out.println(listC.size());
				session.setCart(listC);
				checkPD = true;
				duplicateCart = cart.getCartId();
				break;
			}
		}
		if (checkPD) {
			return ResponseEntity.ok(duplicateCart);
		} else {
			try {
				Cart cart = new Cart();
				cart.setUser(uLogin);
				cart.setProduct(pdDAO.getById(productID));
				cart.setQuantity(quantityInCart);
				caDAO.save(cart);
				List<Cart> listC = caDAO.findByUser(uLogin);
				session.setCart(listC);
				session.set("sizeInCart", listC.size());
				System.out.println(listC.size());

				return ResponseEntity.ok("success");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
				return ResponseEntity.ok("fail");

			}
		}
	}

	@RequestMapping("/remove/{id}")
	public ResponseEntity<?> removeItems(@PathVariable("id") int id) {
		System.out.println(id);
		try {
			UserCustom userCustom = session.get("userLogin");
			caDAO.deleteById(id);
			session.setCart(caDAO.findByUser(session.get("userLogin")));
			List<Cart> listCarts = caDAO.findByUser(session.get("userLogin"));
			session.set("sizeInCart", listCarts.size());

			int cartCount = listCarts.size();
			Double totalPrice = session.totalPriceCartByUserId(userCustom);

			String jsonResponse = "{\"cartCount\":" + cartCount + ", \"cartId\":" + id + ", \"totalPrice\":" + totalPrice + "}";
			return ResponseEntity.ok(jsonResponse);
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}
}
