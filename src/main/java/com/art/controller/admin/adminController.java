package com.art.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.DAO.Promotion.InvoiceDAO;
import com.art.DAO.Promotion.InvoiceDetailDAO;

@Controller
@RequestMapping("/admin")
public class adminController {

	@Autowired
	InvoiceDAO revenueService;

	@Autowired
	InvoiceDetailDAO idDAO;

	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("views", "dashboard");
		model.addAttribute("title", "Trang chủ");
		model.addAttribute("invoice", revenueService.findAllByOrderByInvoiceDateDesc());
		model.addAttribute("bestSellers", idDAO.countProductsOrderByCountDesc());
		getRateYear(model);
		getRateMonth(model);
		return "admin/index";
	}

	public void getRateYear(Model model) {
		List<Integer> labels = revenueService.getYearLabelsRevenue();
		List<Double> values = revenueService.getTotalAmountByYear();

		if (labels.size() == 1) {
			model.addAttribute("nowYear", values.get(0));
			model.addAttribute("lastYear", 0);
			model.addAttribute("rateYear", values.get(0) / 1000000);
		} else {
			model.addAttribute("nowYear", values.get(values.size() - 1));
			model.addAttribute("lastYear", values.get(values.size() - 2));
			model.addAttribute("rateYear", values.get(values.size() - 1) / values.get(values.size() - 2));
		}
	}

	public void getRateMonth(Model model) {
		List<Integer> labels = revenueService.getMonthLabelsRevenue();
		List<Double> values = revenueService.getTotalAmountByMonth();

		if (labels.size() == 1) {
			model.addAttribute("nowMonth", values.get(0));
			model.addAttribute("lastMonth", 0);
			model.addAttribute("rateMonth", values.get(0) / 1000000);
		} else {
			model.addAttribute("nowMonth", values.get(values.size() - 1));
			model.addAttribute("lastMonth", values.get(values.size() - 2));
			model.addAttribute("rateMonth", values.get(values.size() - 1) / values.get(values.size() - 2));
		}
	}
}
