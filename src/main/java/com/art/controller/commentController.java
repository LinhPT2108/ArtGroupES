package com.art.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.art.DAO.Activity.CommentDAO;
import com.art.DAO.Activity.ImageCommentDAO;
import com.art.DAO.Product.ProductDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Activity.ImageComment;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.InvoiceDetail;
import com.art.service.ParamService;
import com.art.service.SessionService;

import jakarta.validation.Valid;

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
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ImageCommentDAO imgCmtDAO;
	@Autowired
	InvoiceDetailDAO invoiceDetailDAO;

	@PostMapping("/get-comment")
	public ResponseEntity<?> getComment(Model model) {
		String productID = paramService.getString("productId", "");
		int invoiceDetailId = paramService.getInt("invoiceDetailId", -1);
		int commentId = paramService.getInt("commentId", -1);
		try {
			Product product = pdDao.getById(productID);
			InvoiceDetail invoiceDetail = ivdtDao.getById(invoiceDetailId);
			Optional<Comment> cmt = cmtDao.findByInvoiceDetailAndProduct(invoiceDetail, product);
			return ResponseEntity.ok(cmt.isEmpty() ? "404" : cmt);
		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			return ResponseEntity.ok("fail");
		}

	}

	@PostMapping("/add-comment")
	public ResponseEntity<?> addComment(@Valid @ModelAttribute("cmt") Comment cmt, BindingResult rs, Model model,
			@RequestParam("listImage") MultipartFile[] listImage) {
		int rate = paramService.getInt("rate", 1);
		String content = paramService.getString("content", "");
		String productId = paramService.getString("productId", "").replaceAll("\"", "");
		int invoiceDetailId = paramService.getInt("invoiceDetailId", -1);
		int commentId = paramService.getInt("commentId", -1);
		System.out.println(commentId);
		for (MultipartFile m : listImage) {
			if (!m.isEmpty()) {
				System.out.println(m.getOriginalFilename());
			}
		}
		System.out.println(content + " - " + rate + " - " + productId + " - " + invoiceDetailId);
		try {
			Comment comment = new Comment();
			if (commentId != -1) {
				comment.setId(commentId);
			}
			comment.setContent(content);
			comment.setDate(new Date());
			comment.setStar(rate);
			comment.setUser(session.get("userLogin"));
			comment.setProduct(pdDao.getById(productId));
			comment.setInvoiceDetail(invoiceDetailDAO.getById(invoiceDetailId));
			cmtDao.save(comment);
			System.out.println("Luu cmt thanh cong");
			System.out.println(listImage.length);
			if (listImage.length == 1) {
				boolean check = false;
				for (MultipartFile m : listImage) {
					System.out.println(m.getSize());
					if (m.getSize() == 0) {
						check = true;
					}
				}
				if (check) {
//					List<ImageComment> imgcmt = imgCmtDAO.findById(commentId);
//					imgCmtDAO.deleteByComment(cmtDao.getById(commentId));
//					for (ImageComment img : imgcmt) {
//						ImageComment imgComment = new ImageComment();
//						imgComment.setComment(comment);
//						imgComment.setImage(img.getImage());
//						imgCmtDAO.save(imgComment);
//					}
					System.out.println("khong co anh");
				} else {
					imgCmtDAO.deleteByComment(cmtDao.getById(commentId));
					for (MultipartFile img : listImage) {
						ImageComment imgComment = new ImageComment();
						imgComment.setComment(comment);
						imgComment.setImage(paramService.save(img, "images/comments").getName());
						imgCmtDAO.save(imgComment);
					}
				}
			} else {

				imgCmtDAO.deleteByComment(cmtDao.getById(commentId));

				for (MultipartFile img : listImage) {
					ImageComment imgComment = new ImageComment();
					imgComment.setComment(comment);
					imgComment.setImage(paramService.save(img, "images/comments").getName());
					imgCmtDAO.save(imgComment);
				}
			}

			System.out.println("Luu image cmt thanh cong");

			return ResponseEntity.ok("success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return ResponseEntity.ok("fail");
		}
	}
}
