package com.art.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.art.DAO.Activity.WishListDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.Entities.Activity.WishList;
import com.art.Entities.Product.Product;
import com.art.Entities.User.UserCustom;
import com.art.service.ParamService;
import com.art.service.SessionService;

@Controller
public class wishlistController {
	@Autowired
	WishListDAO wishListDAO;
	@Autowired
	ParamService param;
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO pdDao;

	@PostMapping("/like")
	public ResponseEntity<?> likeProduct() {
		UserCustom userID = session.get("userLogin");
		String productID = param.getString("productId", "");
		System.out.println(productID);
		Product product = pdDao.getById(productID);
		List<WishList> wl = wishListDAO.findByUserAndProduct(userID, product);
		boolean checkWishList = false;
		if (!wl.isEmpty()) {
			checkWishList = true;
		}
//		for (WishList w : wl) {
//			if (w.getProduct().getProductId().equals(productID)) {
//				checkWishList = true;
//				break;
//			}
//		}
		if (checkWishList) {
			wishListDAO.deleteByUserAndProduct(userID, product);
		} else {
			WishList wishlist = new WishList();
			wishlist.setProduct(product);
			wishlist.setUser(userID);
			wishlist.setWishlistDate(new Date());
			wishListDAO.save(wishlist);
		}
		return ResponseEntity.ok(checkWishList ? "success" : "fail");
	}
}
