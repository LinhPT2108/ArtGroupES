package com.art.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.art.DAO.Activity.CommentDAO;
import com.art.DAO.Activity.WishListDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.Entities.Activity.WishList;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.User.UserCustom;
import com.art.service.SessionService;

@Controller
public class productDetailController {
	@Autowired
	ProductDAO pdDAO;

	@Autowired
	FlashSaleDAO lsDAO;

	@Autowired
	PromotionalDetailsDAO pmtDAO;

	@Autowired
	WishListDAO wishListDAO;

	@Autowired
	SessionService session;

	@Autowired
	CommentDAO cDAO;

	@ModelAttribute("likeList")
	public List<WishList> getCategories() {
		UserCustom userCustom = session.get("userLogin");
		List<WishList> listLike = wishListDAO.findByUser(userCustom);
		return listLike;
	}

	@GetMapping("/products/{id}")
	public String productdetail(@PathVariable("id") String productId, Model model) {
		Product product = pdDAO.findByProductId(productId);
		model.addAttribute("product", product);
		model.addAttribute("star", pdDAO.calculateAverageRating(productId));
		model.addAttribute("sumRate", pdDAO.countCommentsByProduct(productId));
		model.addAttribute("sumSell", pdDAO.countTotalProducts(productId));
		model.addAttribute("disCountProduct", pmtDAO.findByProductId(productId));
		model.addAttribute("comment", cDAO.findByProductId(productId));
		model.addAttribute("productOther", pdDAO.findProductByCategoryId(product.getCategoryProduct().getCategoryId()));
//		System.out.println(pdDAO.findProductByCategoryId(product.getCategoryProduct().getCategoryId()).size());
		if(product.getProductPromotionalDetails().isEmpty()) {
			model.addAttribute("isFlashSale", false);
		}else {
			model.addAttribute("isFlashSale", true);
		}
		FlashSale endDay = lsDAO.findByIsStatus(false);

		model.addAttribute("now", new Date());
		model.addAttribute("flashsale", lsDAO.findByIsStatus(false));
		if (endDay != null) {
			model.addAttribute("listPdFlashsale", pmtDAO.findByFlashSale_Id(endDay.getId()));
			Date endDay1 = lsDAO.findByIsStatus(false).getEndDay();
			System.out.println(endDay1);
			Date now = new Date();
			Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
			System.out.println(checkDayTime);
			if (checkDayTime) {
				model.addAttribute("checkDayTime", true);
			} else {
				model.addAttribute("checkDayTime", false);
			}
		} else {
			model.addAttribute("checkDayTime", true);
		}
		return "product-detail";
	}
}
