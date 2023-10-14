package com.art.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class productDetailController {
	@GetMapping("/product-detail")
	public String productdetail() {
		return "product-detail";
	}
}

