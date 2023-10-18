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

import com.art.DAO.Product.ManufacturerDAO;
import com.art.DAO.User.ManufacturerReponsitory;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.User.UserCustom;
import com.art.service.SessionService;

@Controller
@RequestMapping("admin")
public class manufacturerController {
	@Autowired
	ManufacturerDAO mnDAO;
	@Autowired
	UserCustomDAO usDAO;
	@Autowired
	ManufacturerReponsitory manufacturerReponsitory;
	@Autowired
	ManufacturerReponsitory mnreps;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("mns")
	public List<Manufacturer> getUsercustoms() {
		return mnDAO.findAll();
	}

	
	@GetMapping("/manufacturer")
	public String manufacturer(@ModelAttribute("mn") Manufacturer mn, Model model) {
		model.addAttribute("views", "manufacturer-form");
		model.addAttribute("title", "Thương hiệu sản phẩm");
		model.addAttribute("typeButton", "Thêm");

		return "admin/index";
	}
	
	@RequestMapping("/manufacturer/edit/{id}")
	public String edit(@ModelAttribute("mn") Manufacturer mn, Model model, @PathVariable("id") Integer id) {
		model.addAttribute("views", "manufacturer-form");
		model.addAttribute("title", "Thương hiệu sản phẩm");

		mn = mnDAO.findById(id).get();
		model.addAttribute("mn", mn);
		List<Manufacturer> mns = mnDAO.findAll();
		model.addAttribute("mns", mns);
		return "admin/index";
	}
	
	@PostMapping("/manufacturer/create")
	public String createManufacturer(@ModelAttribute("mn") Manufacturer mn) {
		UserCustom user = sessionService.get("userLogin");
		mn.setUser(user);
		mnDAO.save(mn);
		return "redirect:/admin/manufacturer";
	}

	@PostMapping("/manufacturer/update")
	public String updateManufacturer(@ModelAttribute("mn") Manufacturer mn) {
		UserCustom user = sessionService.get("userLogin");
		mn.setUser(user);
		mnDAO.save(mn);
		return "redirect:/admin/manufacturer";
	}

	@RequestMapping("/manufacturer/delete/{id}")
	public String create(@ModelAttribute("mn") Manufacturer mn, @PathVariable("id") Integer id, Model model) {
		model.addAttribute("views", "manufacturer-form");
		model.addAttribute("title", "Phân loại sản phẩm");

		mn = mnDAO.findById(id).get();
		model.addAttribute("mn", mn);
		List<Manufacturer> mns = mnDAO.findAll();
		model.addAttribute("mns", mns);
		manufacturerReponsitory.deleteById(id);
		return "redirect:/admin/manufacturer";
	}
}
