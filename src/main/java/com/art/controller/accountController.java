package com.art.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.art.DAO.Activity.CartDAO;
import com.art.DAO.Promotion.InvoiceDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.User.InforAddressDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Promotion.Invoice;
import com.art.Entities.User.InforAddress;
import com.art.Entities.User.UserCustom;
import com.art.service.CookieService;
import com.art.service.ParamService;
import com.art.service.PasswordEncryption;
import com.art.service.SessionService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/account")
public class accountController {
	@Autowired
	UserCustomDAO usDAO;
	@Autowired
	InforAddressDAO infDAO;
	@Autowired
	CookieService cookieService;
	@Autowired
	SessionService sessionService;
	@Autowired
	ParamService paramService;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	InvoiceDAO ivDao;
	@Autowired
	InvoiceDetailDAO invoiceDetailDAO;

	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("LGemail",
				cookieService.get("LGemail") != null ? cookieService.get("LGemail").getValue() : "");
		return "login";
	}

	@PostMapping("/login")
	public String getLogin(Model model) {
		String email = paramService.getString("LGemail", null);
		String password = paramService.getString("lGpassword", null);
		Boolean rm = paramService.getBoolean("chkRemember", false);
		System.out.println(email + " - " + password + " - " + rm);
		try {
			
			UserCustom user = usDAO.findByEmail(email).get(0);
			if (user.isDel()) {
				if ( PasswordEncryption.toSHA1(password).equals(user.getPassword())) {
					sessionService.set("userLogin", user);
					if (rm) {
						cookieService.add("LGemail", email, 12);
					} else {
						cookieService.remove("LGemail");
					}
					System.out.println("đăng nhập thành công");
					for (Cart c : cartDAO.findByUser(user)) {
						System.out.println(c.getProduct().getProductId());

					}
					sessionService.set("sizeInCart", cartDAO.findByUser(user).size());
					sessionService.setCart(cartDAO.findByUser(user));
					if (user.getRoleName().getRoleName().equals("admin")) {
						return "redirect:/admin/dashboard";
					} else {
						return "redirect:/";
					}
				}
			}
			model.addAttribute("mess", "Tài khoản hoặc mật khẩu không chính xác!");
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("mess", "Tài khoản hoặc mật khẩu không chính xác");
		}
		return "login";
	}

	@GetMapping("/logout")
	public String setLogout() {
		sessionService.remove("userLogin");
		return "redirect:/";
	}

	@GetMapping("/register")
	public String regis() {
		return "register";
	}

	@GetMapping(value = "/profile")
	public String profile(@ModelAttribute("us") UserCustom us, BindingResult rs, Model model) {
		model.addAttribute("title", "Hồ sơ");
		model.addAttribute("views", "profile");
		if (rs.hasErrors()) {
			return "account";
		}

		return "account";
	}

	@PostMapping("/profile/update-infor")
	public ResponseEntity<?> postProfile(@Valid @ModelAttribute("us") UserCustom us, BindingResult rs, Model model,
			@RequestParam("avatar") MultipartFile avatar) {
		String fullname = paramService.getString("fullname", "");
		String email = paramService.getString("email", "");
		String userId = paramService.getString("userId", "");
		System.out.println(userId + " - " + fullname.isBlank() + " - " + email);
		Map<String, String> errors = new HashMap<>();

		if (fullname.isBlank()) {
			errors.put("fullname", "Vui lòng nhập họ tên");
		} else if (containsSpecialCharacters(fullname) || containsNumber(fullname)) {
			errors.put("fullname", "Họ tên không được chứa số và kí tự đặt biệt");
		}
		if (email.isBlank()) {
			errors.put("email", "Vui lòng nhập email");
		} else if (!isValidEmail(email)) {
			errors.put("email", "Email không hợp lệ");
		} else if (!usDAO.findByEmail(email).isEmpty()) {
			List<UserCustom> userCustom2 = usDAO.findByEmail(email);
			for (UserCustom u : userCustom2) {
				if (!u.getUserId().equals(userId)) {
					errors.put("email", "Email đã tồn tại");
				}
			}
		}
		if (!errors.isEmpty()) {
			return ResponseEntity.ok(errors);
		} else {
			UserCustom currentUser = usDAO.getById(userId);
			if (!avatar.isEmpty()) {
				currentUser.setImage(paramService.save(avatar, "/images/avatar").getName());
			}
			currentUser.setFullname(fullname);
			currentUser.setEmail(email);
			usDAO.save(currentUser);
			sessionService.set("userLogin", currentUser);
		}
		return ResponseEntity.ok("success");
	}

	private boolean isValidEmail(String email) {
		return email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
	}

	private boolean containsNumber(String str) {
		return str.matches(".*\\d.*");
	}

	private boolean containsSpecialCharacters(String str) {
		return str.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");
	}

	public String getFileExtension(String filename) {
		int dotIndex = filename.lastIndexOf(".");
		if (dotIndex >= 0) {
			return filename.substring(dotIndex);
		}
		return "";
	}

	@GetMapping("/address")
	public String address(@ModelAttribute("infAddress") InforAddress infAddress, Model model,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("title", "Địa chỉ");
		model.addAttribute("views", "address");

		UserCustom id = sessionService.get("userLogin");
		UserCustom userCustom = usDAO.getById(id.getUserId());
		Pageable pageable = PageRequest.of(p.orElse(0), 4);
		Page<InforAddress> userPage = infDAO.findByUser(userCustom, pageable);
		List<Integer> pageList = new ArrayList<>();

		model.addAttribute("userAddress", userPage);

		sessionService.set("userLogin", userCustom);
		return "account";
	}

	@PostMapping("/address/add")
	public ResponseEntity<?> addAddress(@Valid @ModelAttribute("infAddress") InforAddress infAddress, BindingResult rs,
			Model model) {
		System.out.println(infAddress.toString());
		Map<String, String> errors = new HashMap<>();
		if (rs.hasErrors()) {
			// Xử lý lỗi và trả về dưới dạng JSON
			for (FieldError error : rs.getFieldErrors()) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return ResponseEntity.ok(errors);
		}
		if (infDAO.findById(infAddress.getPhoneNumber()).isEmpty()) {
			infAddress.setUser(sessionService.get("userLogin"));
			infDAO.save(infAddress);
		} else {
			errors.put("address", "");
			errors.put("phoneNumber", "Số điện thoại đã tồn tại");
			return ResponseEntity.ok(errors);
		}
		return ResponseEntity.ok("success");
	}

	@GetMapping("/address/delete/{id}")
	public ResponseEntity<?> delAddress(@PathVariable("id") String id) {
		System.out.println(id);
		try {
			infDAO.deleteById(id);
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
		return ResponseEntity.ok("success");
	}

	@GetMapping("/address/edit/{id}")
	public ResponseEntity<?> editAddress(@PathVariable("id") String id) {
		System.out.println(id);
		try {
			InforAddress editInf = infDAO.getById(id);
			return ResponseEntity.ok(editInf);
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}

	@PostMapping("/address/update")
	public ResponseEntity<?> updateAddress(@Valid @ModelAttribute("infAddress") InforAddress infAddress,
			BindingResult rs, Model model) {
		try {
			System.out.println(infAddress.toString());
			Map<String, String> errors = new HashMap<>();
			if (rs.hasErrors()) {
				// Xử lý lỗi và trả về dưới dạng JSON
				for (FieldError error : rs.getFieldErrors()) {
					errors.put(error.getField(), error.getDefaultMessage());
				}
				return ResponseEntity.ok(errors);
			} else {
				infAddress.setUser(sessionService.get("userLogin"));
				infDAO.save(infAddress);
			}
		} catch (Exception e) {
			return ResponseEntity.ok("fail");
		}
		return ResponseEntity.ok("success");
	}

	@GetMapping("/change-password")
	public String changePass(Model model) {
		model.addAttribute("title", "Đổi mật khẩu");
		model.addAttribute("views", "changPass");
		return "account";
	}

	@PostMapping("/change-password")
	public ResponseEntity<?> postChangePassword(Model model) {
		String currentPassword = paramService.getString("currentPass", "");
		String confirmPassword = paramService.getString("newPass", "");

		System.out.println(currentPassword + " - " + confirmPassword);
		UserCustom currentUser = sessionService.get("userLogin");

		if (!currentPassword.equals(currentUser.getPassword())) {
			return ResponseEntity.ok("404");
		} else {
			currentUser.setPassword(confirmPassword);
			usDAO.save(currentUser);

		}
		return ResponseEntity.ok("success");
	}

	@GetMapping("/purchased-order/{type}")
	public String purchasedOrder(@ModelAttribute("cmt") Comment cmt, Model model, @PathVariable("type") int type,
			@RequestParam("p") Optional<Integer> p) {
		if (type == 1) {
			model.addAttribute("title", "Đơn hàng đang đuọc xử lí");
		} else if (type == 2) {
			model.addAttribute("title", "Đơn hàng đang giao hàng");
		} else {
			model.addAttribute("title", "Đơn hàng đã hoàn thành");
		}
		model.addAttribute("views", "purchasedOrder");
		UserCustom userID = sessionService.get("userLogin");
		Sort sort = Sort.by(Direction.DESC, "invoiceDate");
		Pageable pageable = PageRequest.of(p.orElse(0), 4, sort);
		Page<Invoice> listInvoice = ivDao.findByUserAndStatus(userID, type, pageable);
		System.out.println(listInvoice.getTotalElements());

		model.addAttribute("sizeInvoice", listInvoice.getTotalElements());
		model.addAttribute("listInvoice", listInvoice);
		model.addAttribute("typeInvoice", type);
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
