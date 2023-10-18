package com.art.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.art.DAO.User.RoleDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.User.Role;
import com.art.Entities.User.UserCustom;
import com.art.service.ParamService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class userCustomController {
	@Autowired
	RoleDAO roleDAO;
	@Autowired
	UserCustomDAO userCustomDAO;
	@Autowired
	HttpServletResponse response;
	@Autowired
	ParamService paramService;

	@GetMapping("/userCustom")
	public String UserCustom(@ModelAttribute("userCustom") UserCustom userCustom, Model model) {
		model.addAttribute("views", "userCustom-form");
		model.addAttribute("title", "Quản lí tài khoản");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật");
		model.addAttribute("deleteButton", "Xóa");
		List<Role> listRole = roleDAO.findAll();
		List<UserCustom> userCustoms = userCustomDAO.findAll();
		model.addAttribute("roles", listRole);
		model.addAttribute("userCustoms", userCustoms);
		return "admin/index";
	}

	@PostMapping("/userCustom/create")
	public String createUserCustom(@Valid @ModelAttribute("userCustom") UserCustom userCustom, BindingResult bd,
			Model model, @RequestParam("avatar") MultipartFile avatar) {
		List<Role> listRole = roleDAO.findAll();
		model.addAttribute("views", "userCustom-form");
		model.addAttribute("title", "Quản lí tài khoản");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật");
		model.addAttribute("deleteButton", "Xóa");
		model.addAttribute("roles", listRole);
		if (bd.hasErrors()) {
			return "admin/index";
		}
		if (!avatar.isEmpty()) {
			userCustom.setImage(paramService.save(avatar, "images/avatar").getName());
		}
		userCustomDAO.save(userCustom);
		return "redirect:/admin/userCustom";
	}

	@GetMapping("/userCustom/edit/{userId}")
	public String editUserCustom(@ModelAttribute("userCustom") UserCustom userCustom, Model model,
			@PathVariable("userId") String userId) {
		try {
			model.addAttribute("views", "userCustom-form");
			model.addAttribute("title", "Quản lí tài khoản");
			model.addAttribute("typeButton", "Thêm");
			model.addAttribute("updateButton", "Cập nhật");
			model.addAttribute("deleteButton", "Xóa");
			List<Role> listRole = roleDAO.findAll();
			List<UserCustom> userCustoms = userCustomDAO.findAll();
			UserCustom usercus = userCustomDAO.getById(userId);
			model.addAttribute("userCustom", usercus);
			model.addAttribute("roles", listRole);
			model.addAttribute("userCustoms", userCustoms);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/index";
	}

	@RequestMapping("/userCustom/update")
	public String updateUserCustom(@ModelAttribute("userCustom") UserCustom userCustom, BindingResult bd, Model model,
			@RequestParam("avatar") MultipartFile avatar) {
		List<Role> listRole = roleDAO.findAll();
		model.addAttribute("views", "userCustom-form");
		model.addAttribute("title", "Quản lí tài khoản");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật");
		model.addAttribute("deleteButton", "Xóa");
		model.addAttribute("roles", listRole);
		if (bd.hasErrors()) {
			return "admin/index";
		}
		String userId = paramService.getString("userId", "");
		UserCustom currentUser = userCustomDAO.getById(userId);
		if (!avatar.isEmpty()) {
			userCustom.setImage(paramService.save(avatar, "images/avatar").getName());
		}else {
			userCustom.setImage(currentUser.getImage());
		}
		userCustomDAO.save(userCustom);

		return "redirect:/admin/userCustom/edit/" + userCustom.getUserId();
	}

	@RequestMapping("/userCustom/delete/{userId}")
	public String updateUserCustom(@PathVariable("userId") String userId, Model model) {
		List<Role> listRole = roleDAO.findAll();
		model.addAttribute("views", "userCustom-form");
		model.addAttribute("title", "Quản lí tài khoản");
		model.addAttribute("typeButton", "Thêm");
		model.addAttribute("updateButton", "Cập nhật");
		model.addAttribute("deleteButton", "Xóa");
		model.addAttribute("roles", listRole);
		userCustomDAO.deleteById(userId);
		return "redirect:/admin/userCustom";
	}
}
