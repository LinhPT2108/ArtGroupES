package com.art.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/account")
public class accountController {
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/register")
	public String regis() {
		return "register";
	}

	@GetMapping("/profile")
	public String profile(Model model) {
		model.addAttribute("title", "Hồ sơ");
		model.addAttribute("views", "profile");
		return "account";
	}

	@PostMapping("/profile/update-infor")
	public String postProfile(@RequestParam("avatar") MultipartFile avatar, Model model) {

		model.addAttribute("title", "Hồ sơ");
		model.addAttribute("views", "profile");
		return "account";
	}

	@GetMapping("/address")
	public String address(Model model) {
		model.addAttribute("title", "Địa chỉ");
		model.addAttribute("views", "address");
		return "account";
	}

	@GetMapping("/change-password")
	public String changePass(Model model) {
		model.addAttribute("title", "Đổi mật khẩu");
		model.addAttribute("views", "changPass");
		return "account";
	}

	@GetMapping("/purchased-order")
	public String purchasedOrder(Model model) {
		model.addAttribute("title", "Đơn hàng đã hoàn thành");
		model.addAttribute("views", "purchasedOrder");
		return "account";
	}

	@GetMapping("/wish-list")
	public String wishList(Model model) {
		model.addAttribute("title", "Danh sách sản phẩm yêu thích");
		model.addAttribute("views", "acount-product-list");
		return "account";
	}

	@GetMapping("/viewed-list")
	public String viewedList(Model model) {
		model.addAttribute("title", "Danh sách sản phẩm đã xem");
		model.addAttribute("views", "acount-product-list");
		return "account";
	}
}
