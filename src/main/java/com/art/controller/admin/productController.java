package com.art.controller.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Product.CategoryDAO;
import com.art.DAO.Product.ManufacturerDAO;
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
	HttpServletResponse response;
	@GetMapping("/product")
	public String product(@ModelAttribute("pd") Product pd, Model model) {
		List<Category> listCate = caDAO.findAll();
		List<Manufacturer> listManu = mnDAO.findAll();
		model.addAttribute("views", "product-form");
		model.addAttribute("title", "Quản lí sản phẩm");
		model.addAttribute("typeButton", "Thêm");

		model.addAttribute("categories", listCate);
		model.addAttribute("manufacturer", listManu);
		return "admin/index";
	}

	@PostMapping("/product/create")
	public String createProduct(@Valid @ModelAttribute("pd") Product pd, BindingResult bd,Model model) {
		if(bd.hasErrors()) {
			List<Category> listCate = caDAO.findAll();
			List<Manufacturer> listManu = mnDAO.findAll();
			model.addAttribute("views", "product-form");
			model.addAttribute("title", "Quản lí sản phẩm");
			model.addAttribute("typeButton", "Thêm");

			model.addAttribute("categories", listCate);
			model.addAttribute("manufacturer", listManu);
			try {
				response.getWriter().write("error");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "admin/index";
		}
		System.out.println(pd.toString());
		
		return "redirect:/admin/product";
	}

}
