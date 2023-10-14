package com.art.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Product.CategoryDAO;
import com.art.DAO.Product.ManufacturerDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.Entities.Product.Category;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.Product.Product;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class productController {
	@Autowired
	CategoryDAO caDAO;
	@Autowired
	ManufacturerDAO mnDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	HttpServletResponse response;

	@ModelAttribute("categoriesList")
	public Map<Category, String> getCategories() {
		List<Category> listCate = caDAO.findAll();
		Map<Category, String> map = new HashMap<>();
		for (Category c : listCate) {
			map.put(c, c.getCategoryName());
		}
		return map;
	}

	@ModelAttribute("manufacturerList")
	public Map<Manufacturer, String> getManufacturers() {
		List<Manufacturer> listManu = mnDAO.findAll();
		Map<Manufacturer, String> map = new HashMap<>();
		for (Manufacturer c : listManu) {
			map.put(c, c.getManufacturerName());
		}
		return map;
	}

	@GetMapping("/product")
	public String product(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "product-form");
		model.addAttribute("title", "Quản lí sản phẩm");
		model.addAttribute("typeButton", "Thêm");

		return "admin/index";
	}

	@PostMapping("/product")
	public ResponseEntity<?> createProduct(@Valid @ModelAttribute("pd") Product product, BindingResult result) {
		if (result.hasErrors()) {
			// Trả lỗi về Json
			Map<String, String> errors = new HashMap<>();
			for (FieldError error : result.getFieldErrors()) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return ResponseEntity.ok(errors);
		} else {
			pdDAO.save(product);
		}

		return ResponseEntity.ok("success");
	}

}
