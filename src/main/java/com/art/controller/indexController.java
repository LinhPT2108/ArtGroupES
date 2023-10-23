package com.art.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.art.DAO.Activity.BannerDAO;
import com.art.DAO.Activity.WishListDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.Entities.Activity.WishList;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.User.UserCustom;
import com.art.service.SessionService;

@Controller
public class indexController {
	@Autowired
	BannerDAO bnDao;
	@Autowired
	FlashSaleDAO lsDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	PromotionalDetailsDAO pmtDAO;
	@Autowired
	InvoiceDetailDAO idDAO;
	@Autowired
	WishListDAO wishListDAO;
	@Autowired
	SessionService session;
	
	@ModelAttribute("likeList")
	public List<WishList> getCategories() {
		UserCustom userCustom = session.get("userLogin");
		List<WishList> listLike = wishListDAO.findByUser(userCustom);
		return listLike;
	}
	
	
	@GetMapping({ "/", "", "/index" })
	public String home(Model model) {
		model.addAttribute("listBanner", bnDao.findAll());

		model.addAttribute("listProduct", pdDAO.findAll());
		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());

		FlashSale endDay = lsDAO.findByIsStatus(false).get(0);

		model.addAttribute("now", new Date());
		model.addAttribute("flashsale", lsDAO.findByIsStatus(false).get(0));
		if (endDay != null) {
			model.addAttribute("listPdFlashsale", pmtDAO.findByFlashSale_Id(endDay.getId()));
			Date endDay1 = lsDAO.findByIsStatus(false).get(0).getEndDay();
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

		return "index";
	}

	@GetMapping("/quick-views/{id}")
	public ResponseEntity<?> getProduct(@PathVariable("id") String id, Model model) {

		System.out.println(id);
		try {
			Product pd = pdDAO.getById(id);
			model.addAttribute("quickProduct", pd);
			return ResponseEntity.ok(pd);
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}
}
