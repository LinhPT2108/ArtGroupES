package com.art.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Product.CategoryDAO;
import com.art.DAO.User.CategoryReponsitory;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Product.Category;
import com.art.Entities.User.UserCustom;
import com.art.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class categoryController {
	@Autowired
	CategoryDAO caDao;
	@Autowired
	UserCustomDAO ucDao;
	@Autowired
	CategoryReponsitory categoryReponsitory;
	@Autowired
	HttpServletResponse response;

	@Autowired
	SessionService sessionService;



	@GetMapping("/category")
	public String category(@ModelAttribute("ct") Category ct, Model model) {

		model.addAttribute("views", "category-form");
		model.addAttribute("title", "Phân loại sản phẩm");
		model.addAttribute("typeButton", "Thêm");

		return "admin/index";
	}

	@RequestMapping("/category/edit/{categoryId}")
	public String edit(@ModelAttribute("ct") Category ct, Model model, @PathVariable("categoryId") Integer categoryId) {
		
		System.out.println(categoryId);
		ct = caDao.findById(categoryId).get();
		System.out.println(ct + "abc");
		model.addAttribute("categories", ct);
		List<Category> items = caDao.findAll();
		model.addAttribute("categories", ct);
		return "redirect:/admin/category";
	}

	@PostMapping("/category/create")
	public String create(@ModelAttribute("ct") Category ct) {
		UserCustom user = sessionService.get("userLogin");
		ct.setUser(user);
		categoryReponsitory.save(ct);
		return "redirect:/admin/category";
	}

	@ModelAttribute("cts")
	public List<Category> getUsercustoms() {
		return caDao.findAll();
	}

}
