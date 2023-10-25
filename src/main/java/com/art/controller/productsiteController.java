package com.art.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.art.DAO.Product.CategoryDAO;
import com.art.DAO.Product.ManufacturerDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.Entities.Product.Category;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.Promotion.Invoice;

@Controller
@RequestMapping("/product")
public class productsiteController {
	@Autowired
	FlashSaleDAO lsDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	PromotionalDetailsDAO pmtDAO;
	@Autowired
	InvoiceDetailDAO idDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ManufacturerDAO manuDAO;

	@ModelAttribute("priceList")
	public List<BigDecimal> getPrice() {
		List<Product> productList = pdDAO.findAll();
		List<BigDecimal> prices = new ArrayList<>();

		for (Product product : productList) {
			prices.add(product.getPrice());
		}

		Collections.sort(prices);

		BigDecimal minPrice = prices.get(0);
		BigDecimal maxPrice = prices.get(prices.size() - 1);
		BigDecimal priceRange = maxPrice.subtract(minPrice);

		BigDecimal interval = priceRange.divide(new BigDecimal(5), 2, RoundingMode.HALF_UP);

		List<BigDecimal> priceList = new ArrayList<>();
		BigDecimal currentPrice = minPrice;
		for (int i = 0; i < 5; i++) {
			currentPrice = currentPrice.add(interval);
			currentPrice = currentPrice.setScale(0, RoundingMode.CEILING);
			priceList.add(currentPrice);
		}

		return priceList;
	}

	@GetMapping("")
	public String getProduct(Model model, @RequestParam("c") Optional<Integer> category,
			@RequestParam("b") Optional<Integer> manufacturer, @RequestParam("p") Optional<Integer> p) {
		model.addAttribute("siteFlashSale", false);

		if (category.isPresent() && manufacturer.isPresent()) {
			model.addAttribute("catemanu", true);
			Category category2 = categoryDAO.getById(category.orElse(-1));
			Manufacturer manufacturer2 = manuDAO.getById(manufacturer.orElse(-1));
			Pageable pageable = PageRequest.of(p.orElse(0), 20);
			Page<Product> listProduct = pdDAO.findByCategoryProductAndManufacturerProduct(category2, manufacturer2,
					pageable);
			model.addAttribute("listProduct", listProduct);
		} else if (category.isPresent() && manufacturer.isEmpty()) {
			model.addAttribute("catemanu", true);
			Pageable pageable = PageRequest.of(p.orElse(0), 20);
			model.addAttribute("listProduct",
					pdDAO.findByCategoryProduct(categoryDAO.getById(category.get()), pageable));
			
		} else {
			model.addAttribute("catemanu", false);
			Pageable pageable = PageRequest.of(p.orElse(0), 20);
			model.addAttribute("listProduct", pdDAO.findAll(pageable));
		}

		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());

		try {
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
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			model.addAttribute("checkDayTime", true);
		}

		return "shop-grid";
	}

	@GetMapping("/search")
	public String searchProduct(@RequestParam("categoryId") Optional<Integer> categoryId,
			@RequestParam(value = "search", required = true) String search, Model model) {
		model.addAttribute("siteFlashSale", false);
		if (categoryId.get() == -1) {
			model.addAttribute("catemanu", false);
			model.addAttribute("listProduct", pdDAO.searchProductByName(search));
			System.out.println();
		} else if (categoryId.isPresent()) {
			model.addAttribute("catemanu", true);
			model.addAttribute("listProduct",
					pdDAO.searchProductByNameAndCategory(search, categoryDAO.getById(categoryId.get())));
		} else {
			model.addAttribute("catemanu", false);
			model.addAttribute("listProduct", pdDAO.findAll());
		}

		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());
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
		return "search-product";
	}

	@GetMapping("/flash-sale")
	public String getFlashSale(Model model, @RequestParam("p") Optional<Integer> p) {
		model.addAttribute("siteFlashSale", true);
		model.addAttribute("listProduct", pdDAO.findAll());

		try {
			FlashSale endDay = lsDAO.findByIsStatus(false);

			model.addAttribute("now", new Date());
			model.addAttribute("flashsale", lsDAO.findByIsStatus(false));
			if (endDay != null) {
				Pageable pageable = PageRequest.of(p.orElse(0), 20);
				model.addAttribute("listPdFlashsale", pmtDAO.findByFlashSale_Id(endDay.getId(), pageable));
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
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			model.addAttribute("checkDayTime", true);
		}
		return "shop-grid";
	}
}
