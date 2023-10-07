package com.art.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class adminController {
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("views", "dashboard");
		model.addAttribute("title", "Trang chủ");
		return "admin/index";
	}

}
