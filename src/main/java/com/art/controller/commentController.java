package com.art.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Activity.CommentDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.InvoiceDetail;
import com.art.service.ParamService;

@Controller
@RequestMapping("/comment")
public class commentController {
	@Autowired
	CommentDAO cmtDao;
	@Autowired
	InvoiceDetailDAO ivdtDao;
	@Autowired
	ParamService paramService;
	@Autowired
	ProductDAO pdDao;

	@PostMapping("/get-comment")
	public ResponseEntity<?> getComment(Model model) {
		String productID = paramService.getString("productId", "");
		int invoiceDetailId = paramService.getInt("invoiceDetailId", -1);
		try {
			Product product = pdDao.getById(productID);
			InvoiceDetail invoiceDetail = ivdtDao.getById(invoiceDetailId);
			Optional<Comment> cmt = cmtDao.findByInvoiceDetailAndProduct(invoiceDetail, product);
			return ResponseEntity.ok(cmt);
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}
		
	}
}
