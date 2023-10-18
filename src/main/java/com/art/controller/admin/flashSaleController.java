package com.art.controller.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.User.RoleDAO;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.User.Role;
import com.art.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class flashSaleController {
	@Autowired
	FlashSaleDAO flashSaleDAO;
	@Autowired
	HttpServletResponse response;
	@Autowired

	SessionService sessionService;
	@GetMapping("/flashSale")
	public String FlashSale(@ModelAttribute("flashSale") FlashSale flashSale,Model model) {	
		model.addAttribute("views", "flashSale-form");
		model.addAttribute("title", "Quản lí khuyến mãi");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật"); 
		model.addAttribute("deleteButton", "Xóa");
		List<FlashSale> flashSales=flashSaleDAO.findAll();
		model.addAttribute("flashSales",flashSales);
		return "admin/index";
	}

	@PostMapping("/flashSale/create")
	public String createflashSale(@Valid @ModelAttribute("flashSale") FlashSale flashSale, BindingResult bd,Model model) {
		model.addAttribute("views", "flashSale-form");
		model.addAttribute("title", "Quản lí khuyến mãi");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật"); 
		model.addAttribute("deleteButton", "Xóa");
		if(bd.hasErrors()) {
			return "admin/index";
		}
		flashSaleDAO.save(flashSale);
		return "redirect:/admin/flashSale";
	}
	@RequestMapping("/flashSale/edit/{id}")
	public String editflashSale(@ModelAttribute("flashSale") FlashSale flashSale,Model model,@PathVariable("id") Integer id) {
		try {
			model.addAttribute("views", "flashSale-form");
			model.addAttribute("title", "Quản lí khuyến mãi");
			model.addAttribute("typeButton", "Thêm");
			model.addAttribute("updateButton", "Cập nhật"); 
			model.addAttribute("deleteButton", "Xóa");
			List<FlashSale> flashSales=flashSaleDAO.findAll();
			FlashSale flashsalebyid=flashSaleDAO.findById(id).get();
			model.addAttribute("flashSale",flashsalebyid);
			model.addAttribute("flashSales",flashSales);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/index";
	}
	@RequestMapping("/flashSale/update")
	public String updateflashSale(@ModelAttribute("flashSale") FlashSale flashSale,BindingResult bd,Model model) {
		model.addAttribute("views", "flashSale-form");
		model.addAttribute("title", "Quản lí khuyến mãi");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật"); 
		model.addAttribute("deleteButton", "Xóa");
		if(bd.hasErrors()) {
			return "admin/index";
		}
		flashSaleDAO.save(flashSale);
		return "redirect:/admin/flashSale/edit/"+flashSale.getId();
	}
	@RequestMapping("/flashSale/delete/{id}")
	public String updateflashSale(@PathVariable("id") Integer id,Model model) {
		model.addAttribute("views", "flashSale-form");
		model.addAttribute("title", "Quản lí khuyến mãi");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật"); 
		model.addAttribute("deleteButton", "Xóa");
		flashSaleDAO.deleteById(id);
		return "redirect:/admin/flashSale";
	}
}
