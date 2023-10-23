package com.art.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
@Controller
public class productDetailController {
	@GetMapping("/products/{id}")
	public String productdetail(@PathVariable("id") String productId) {
		System.out.println(productId);
		return "product-detail";
	}
}

