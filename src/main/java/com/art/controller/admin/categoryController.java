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
		return "admin/index";
	}

	@ModelAttribute("cts")
	public List<Category> getUsercustoms() {
		return caDao.findAll();
	}

	@RequestMapping("/category/edit/{categoryId}")
	public String edit(@ModelAttribute("ct") Category ct, Model model, @PathVariable("categoryId") Integer categoryId) {
		model.addAttribute("views", "category-form");
		model.addAttribute("title", "Phân loại sản phẩm");

		ct = caDao.findById(categoryId).get();
		model.addAttribute("ct", ct);
		List<Category> cts = caDao.findAll();
		model.addAttribute("cts", cts);
		return "admin/index";
	}

	@PostMapping("/category/create")
	public String create(@ModelAttribute("ct") Category ct) {
		UserCustom user = sessionService.get("userLogin");
		ct.setUser(user);
		ct.setDel(true);
		categoryReponsitory.save(ct);
		return "redirect:/admin/category";
	}

	@RequestMapping("/category/update")
	public String update(@ModelAttribute("ct") Category ct) {

		UserCustom user = sessionService.get("userLogin");
		ct.setUser(user);
		ct.setDel(true);
		categoryReponsitory.save(ct);
		return "redirect:/admin/category";
	}

	@RequestMapping("/category/delete")
	public String delete(@ModelAttribute("ct") Category ct) {

		UserCustom user = sessionService.get("userLogin");
		ct.setUser(user);
		ct.setDel(false);
		categoryReponsitory.save(ct);
		return "redirect:/admin/category";
	}
	
	
}
