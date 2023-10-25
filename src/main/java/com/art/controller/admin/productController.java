package com.art.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.art.DAO.Product.CategoryDAO;
import com.art.DAO.Product.DetailDescriptionDAO;
import com.art.DAO.Product.ImageDAO;
import com.art.DAO.Product.ManufacturerDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.Entities.Product.Category;
import com.art.Entities.Product.DetailDescription;
import com.art.Entities.Product.Image;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.Product.Product;
import com.art.service.ParamService;
import com.art.service.SessionService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@MultipartConfig(maxFileSize = 999999999, maxRequestSize = 999999999)
@Controller
@RequestMapping("/admin")
public class productController {
	@Autowired
	CategoryDAO caDAO;
	@Autowired
	ManufacturerDAO mnDAO;
	@Autowired
	ProductDAO pdDAO;
	@Autowired
	HttpServletResponse response;
	@Autowired
	ImageDAO imgDao;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	DetailDescriptionDAO detailDescriptionDAO;

	@ModelAttribute("categoriesList")
	public Map<Category, String> getCategories() {
		List<Category> listCate = caDAO.findByDel(true);
		Map<Category, String> map = new HashMap<>();
		for (Category c : listCate) {
			map.put(c, c.getCategoryName());
		}
		return map;
	}

	@ModelAttribute("manufacturerList")
	public Map<Manufacturer, String> getManufacturers() {
		List<Manufacturer> listManu = mnDAO.findByDel(true);
		Map<Manufacturer, String> map = new HashMap<>();
		for (Manufacturer c : listManu) {
			map.put(c, c.getManufacturerName());
		}
		return map;
	}

	@GetMapping("/product")
	public String product(@ModelAttribute("pd") Product pd, Model model) {

		model.addAttribute("views", "product-form");
		model.addAttribute("title", "Quản lí sản phẩm");
		model.addAttribute("typeButton", false);
		model.addAttribute("products", pdDAO.findByDel(false));

		return "admin/index";
	}

	@PostMapping("/product")
	public ResponseEntity<?> createProduct(@Valid @ModelAttribute("pd") Product product, BindingResult result,
			@RequestParam("listImage") MultipartFile[] listImage, @RequestParam("descriptions") String descriptions) {

		Map<String, String> errors = new HashMap<>();
		System.out.println(descriptions);
		if (descriptions.length() == 32 || descriptions.length() == 2) {
			errors.put("detailDecription", "Vui lòng nhập ít nhất 1 mô tả");
		}

		for (MultipartFile image : listImage) {
			if (!image.isEmpty()) {
				System.out.println(image.getOriginalFilename());
			} else {
				errors.put("image", "Vui lòng chọn ít nhất 1 ảnh");
			}
		}
		if (result.hasErrors()) {
			// Trả lỗi về Json
			for (FieldError error : result.getFieldErrors()) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return ResponseEntity.ok(errors);
		}

		if (errors.isEmpty()) {
			try {
				product.setUser(sessionService.get("userLogin"));
				pdDAO.save(product);
			} catch (Exception e) {
				// TODO: handle exception
				return ResponseEntity.ok("fail");
			}
			for (MultipartFile img : listImage) {
				Image image = new Image();
				image.setImage(paramService.save(img, "images/products").getName());
				image.setProduct(product);
				imgDao.save(image);
			}

			Gson gson = new Gson();
			List<Map<String, String>> list = gson.fromJson(descriptions, new TypeToken<List<Map<String, String>>>() {
			}.getType());

			for (Map<String, String> map : list) {
				System.out.println(map.values());
			}
			for (Map<String, String> map : list) {

				DetailDescription detailDescription = new DetailDescription();
				detailDescription.setTile((map.get("tieuDe")));
				detailDescription.setDescription(map.get("description"));
				detailDescription.setProduct(product);

				detailDescriptionDAO.save(detailDescription);
			}
			return ResponseEntity.ok("success");
		}else {
			return ResponseEntity.ok(errors);
		}
	}

	@PostMapping("/product/remove/{id}")
	public ResponseEntity<?> removeProduct(@PathVariable("id") String id) {
		try {
			if (pdDAO.getById(id) == null) {
				return ResponseEntity.ok("fail");
			} else {
				Product pd = pdDAO.getById(id);
				pd.setDel(true);
				pdDAO.save(pd);
				return ResponseEntity.ok("success");
			}

		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
	}

	@GetMapping("/product/edit/{id}")
	public String editProduct(@ModelAttribute("pd") Product product, Model model,
			@PathVariable("id") String productId) {
		model.addAttribute("views", "product-form");
		model.addAttribute("title", "Quản lí sản phẩm");
		model.addAttribute("typeButton", true);
		model.addAttribute("products", pdDAO.findByDel(false));
		Product pd = pdDAO.getById(productId);
		model.addAttribute("pd", pd);
		System.out.println(productId);

		return "admin/index";
	}

	@PostMapping("/product/update-product")
	public ResponseEntity<?> updateProduct(@Valid @ModelAttribute("pd") Product product, BindingResult result,
			@RequestParam("listImage") MultipartFile[] listImage, @RequestParam("descriptions") String descriptions) {

		Map<String, String> errors = new HashMap<>();
		System.out.println(descriptions);
		if (descriptions.length() == 32 || descriptions.length() == 2) {
			errors.put("detailDecription", "Vui lòng nhập ít nhất 1 mô tả");
		}

//		for (MultipartFile image : listImage) {
//			if (!image.isEmpty()) {
//				System.out.println(image.getOriginalFilename());
//			} else {
//				errors.put("image", "Vui lòng chọn ít nhất 1 ảnh");
//			}
//		}
		if (result.hasErrors()) {
			// Trả lỗi về Json
			for (FieldError error : result.getFieldErrors()) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return ResponseEntity.ok(errors);
		}

		if (errors.isEmpty()) {
			try {
				product.setUser(sessionService.get("userLogin"));
				pdDAO.save(product);
				System.out.println(listImage.length);
			} catch (Exception e) {
				System.out.println(e);
				// TODO: handle exception
				return ResponseEntity.ok("fail");
			}

			if (listImage.length == 1) {
				System.out.println("không làm gì hết");
			} else {
				imgDao.deleteByProduct(product);
				for (MultipartFile img : listImage) {
					System.out.println(img.getOriginalFilename());
					Image image = new Image();
					image.setImage(paramService.save(img, "images/products").getName());
					image.setProduct(product);
					imgDao.save(image);
				}
			}

			detailDescriptionDAO.deleteByProduct(product);
			Gson gson = new Gson();
			List<Map<String, String>> list = gson.fromJson(descriptions, new TypeToken<List<Map<String, String>>>() {
			}.getType());

			for (Map<String, String> map : list) {
				System.out.println(map.values());
			}
			for (Map<String, String> map : list) {
				DetailDescription detailDescription = new DetailDescription();
				detailDescription.setTile((map.get("tieuDe")));
				detailDescription.setDescription(map.get("description"));
				detailDescription.setProduct(product);

				detailDescriptionDAO.save(detailDescription);
			}

		} else {
			return ResponseEntity.ok(errors);
		}
		return ResponseEntity.ok("success");
	}
}