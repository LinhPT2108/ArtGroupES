package com.art.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

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
import com.art.DAO.Activity.WishListDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.FlashSaleDAO;
import com.art.DAO.Promotion.InvoiceDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.DAO.Promotion.PromotionalDetailsDAO;
import com.art.DAO.User.InforAddressDAO;
import com.art.DAO.User.RoleDAO;
import com.art.DAO.User.UserCustomDAO;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Activity.WishList;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.Promotion.Invoice;
import com.art.Entities.User.InforAddress;
import com.art.Entities.User.UserCustom;
import com.art.model.MailInfo;
import com.art.service.CookieService;
import com.art.service.MailerServiceImpl;
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
	@Autowired
	RoleDAO roleDAO;
	@Autowired
	MailerServiceImpl mailer;
	@Autowired
	FlashSaleDAO lsDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	PromotionalDetailsDAO pmtDAO;
	@Autowired
	InvoiceDetailDAO idDAO;
	@Autowired
	WishListDAO wishListDAO;

	@ModelAttribute("likeList")
	public List<WishList> getCategories() {
		UserCustom userCustom = sessionService.get("userLogin");
		List<WishList> listLike = wishListDAO.findByUser(userCustom);
		return listLike;
	}

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
			if (!user.isDel()) {
				if (PasswordEncryption.toSHA1(password).equals(user.getPassword())) {
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
	public String regis(@ModelAttribute("us") UserCustom us, Model model) {
		model.addAttribute("title", "Đăng ký");
		return "register";
	}

	@PostMapping("/register")
	public ResponseEntity<?> register(@Valid @ModelAttribute("us") UserCustom us, BindingResult rs, Model model) {
		System.out.println(us.toString());
		String confirmPass = paramService.getString("confirmPassword", "");
		Map<String, String> errors = new HashMap<>();
		System.out.println(confirmPass);
		if (!confirmPass.equals(us.getPassword())) {
			errors.put("confirmPassword", "Xác nhận mật khẩu không chính xác");
		}

		if (!usDAO.findByEmail(us.getEmail()).isEmpty()) {
			errors.put("email", "Email đã tồn tại");
		}

		if (rs.hasErrors()) {
			for (FieldError error : rs.getFieldErrors()) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return ResponseEntity.ok(errors);
		}

		if (!errors.isEmpty()) {
			return ResponseEntity.ok(errors);
		} else {
			us.setDel(true);
			us.setRoleName(roleDAO.getById("user"));
			try {
				String verify = PasswordEncryption.getRandomString(8);
				us.setPassword(PasswordEncryption.toSHA1(us.getPassword()));
				us.setVerifyCode(verify);
				usDAO.save(us);
				sessionService.set("userRegister", us);
				mailer.sendVerify(new MailInfo(us.getEmail(), "Xác nhận tài khoản ArtGroupES",
						"Chào mừng bạn đến với ART GROUP EST.2023. Đây là mã xác nhận của bạn: " + verify));
			} catch (Exception e) {
				return ResponseEntity.ok("fail");
			}
		}

		return ResponseEntity.ok("success");
	}

	@GetMapping("/verify-code")
	public String verify(Model model) {
		model.addAttribute("title", "Xác thực tài khoản");
		model.addAttribute("userRegister", sessionService.get("sessionService"));
		return "verify";
	}

	@PostMapping("/verify-code/{id}")
	public ResponseEntity<?> verifyCode(@Valid @PathVariable("id") String id, @ModelAttribute("verifyCode") String code,
			BindingResult rs, Model model) {
		Map<String, String> errors = new HashMap<>();
		UserCustom user = usDAO.getOne(id);
		System.out.println("user: " + user.getFullname());
		System.out.println("code: " + code);
		if (user != null) {
			if (!user.getVerifyCode().equalsIgnoreCase(code)) {
				errors.put("verifyCode", "Mã xác nhận không đúng !");
			}

			System.out.println("code 1: " + code);
			if (rs.hasErrors()) {
				for (FieldError error : rs.getFieldErrors()) {
					errors.put(error.getField(), error.getDefaultMessage());
				}

				System.out.println("code e: " + code);
				return ResponseEntity.ok(errors);
			}
			if (!errors.isEmpty()) {
				System.out.println("code e: " + code);
				return ResponseEntity.ok(errors);
			} else {
				if (user.getVerifyCode().equalsIgnoreCase(code)) {
					user.setVerifyCode("");
					user.setDel(false);
					System.out.println("code: " + code);
					try {
						usDAO.save(user);
					} catch (Exception e) {
						return ResponseEntity.ok("fail");
					}
				}
			}
			return ResponseEntity.ok("success");
		} else {
			return ResponseEntity.ok("fail");
		}
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
			currentUser.setPassword(PasswordEncryption.toSHA1(confirmPassword));
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
		} else if (type == 3) {
			model.addAttribute("title", "Đơn hàng đã hoàn thành");
		} else {
			model.addAttribute("title", "Đơn hàng hủy");
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

	@PostMapping("/purchased-order/remove/{id}")
	public ResponseEntity<?> removeInvoice(@PathVariable("id") int invoiceId) {
		try {
			Invoice Invoice = ivDao.getById(invoiceId);
			Invoice.setStatus(-1);
			ivDao.save(Invoice);
			return ResponseEntity.ok("success");
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}

	@GetMapping("/wish-list")
	public String wishList(Model model, @RequestParam("p") Optional<Integer> p) {
		model.addAttribute("title", "Danh sách sản phẩm yêu thích");
		model.addAttribute("views", "acount-product-list");
		UserCustom userCustom = sessionService.get("userLogin");

		Sort sort = Sort.by(Direction.DESC, "wishlistDate");
		Pageable pageable = PageRequest.of(p.orElse(0), 8, sort);

		model.addAttribute("listProduct", wishListDAO.findByUser(userCustom, pageable));

		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());
		
		try {
			FlashSale endDay = lsDAO.findByIsStatus(false);

			model.addAttribute("now", new Date());
			model.addAttribute("flashsale", lsDAO.findByIsStatus(false));
			if (endDay != null) {
				model.addAttribute("listPdFlashsale", pmtDAO.findByFlashSale_Id(endDay.getId()));
				Date endDay1 = lsDAO.findByIsStatus(false).getEndDay();
				System.out.println(endDay1);
				Date now = new Date();
				Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
				System.out.println(checkDayTime);
				if (checkDayTime) {
					model.addAttribute("checkDayTime", true);
				} else {
					model.addAttribute("checkDayTime", false);
				}
			} else {
				model.addAttribute("checkDayTime", true);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			model.addAttribute("checkDayTime", true);
		}

		return "account";
	}

	@GetMapping("/viewed-list")
	public String viewedList(Model model) {
		model.addAttribute("title", "Danh sách sản phẩm đã xem");
		model.addAttribute("views", "acount-product-list");
		return "account";
	}

	@GetMapping("/forgot-password")
	public String getForgotPassword(Model model) {
		model.addAttribute("title", "Quên mật khẩu");
		return "forgotPass";
	}

	@PostMapping("/forgot-password")
	public ResponseEntity<?> postForgotPassword(Model model) {
		String email = paramService.getString("email", "");
		String newPas = paramService.getString("newPass", "");
		UserCustom userCustom = usDAO.findByEmail(email).get(0);
		try {

			userCustom.setPassword(PasswordEncryption.toSHA1(newPas));
			usDAO.save(userCustom);
			return ResponseEntity.ok("success");
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}

	@PostMapping("/send-code")
	public ResponseEntity<?> getCode(Model model) {
		String email = paramService.getString("email", "");
		System.out.println(email);
		List<UserCustom> userCustoms = usDAO.findByEmail(email);
		if (userCustoms.isEmpty()) {
			return ResponseEntity.ok("404");
		} else {
			String veriCode = generateVerificationCode();
			String subject = "[ARTGroup] - Mã xác nhận";
			try {
				MailInfo mailInfo = new MailInfo(email, subject, "Mã xác nhận của bạn là: " + veriCode);
				mailer.send(mailInfo);
				// mailer.send(email, subject, "Mã xác nhận của bạn là: " + veriCode);
				return ResponseEntity.ok(veriCode);
			} catch (Exception e) {
				System.out.println(e);
				// TODO: handle exception
				return ResponseEntity.ok("fail");
			}
		}
	}

	private String generateVerificationCode() {
		Random random = new Random();
		int code = 100000 + random.nextInt(900000);
		return String.valueOf(code);
	}
}
