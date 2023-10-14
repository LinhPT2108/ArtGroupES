package com.art.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.art.Entities.User.UserCustom;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	private SessionService sessionService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Kiểm tra trạng thái đăng nhập bằng session
		UserCustom user = (UserCustom) sessionService.get("userLogin");

		// Kiểm tra đường dẫn yêu cầu
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		// Kiểm tra quyền truy cập
		if (user == null && requiresAuthentication(requestURI)) {
			// Người dùng chưa đăng nhập và yêu cầu truy cập trang cần đăng nhập, chuyển
			// hướng đến trang đăng nhập
			response.sendRedirect("/account/login");
			return false;
		} else if (user != null && !hasAccess(user, requestURI)) {
			// Người dùng đã đăng nhập và không có quyền truy cập trang này, chuyển hướng
			// đến trang cần thiết (ví dụ: /access-denied)
			System.out.println(1);
			response.sendRedirect("/access-denied");
			return false;
		} else if (user != null && (requestURI.contains("login") || requestURI.contains("register"))) {
			System.out.println(3);
			response.sendRedirect("/");
			return false;
		}
		System.out.println(2);

		return true;
	}

	// Kiểm tra xem yêu cầu có cần đăng nhập không
	private boolean requiresAuthentication(String requestURI) {
		return !requestURI.equals("/account/login") && !requestURI.equals("/account/register")
				&& !requestURI.equals("/account/forgot-password");
	}

	// Kiểm tra xem người dùng có quyền truy cập vào đường dẫn hay không (tùy thuộc
	// vào logic của bạn)
	private boolean hasAccess(UserCustom user, String requestURI) {
		// Thêm logic kiểm tra quyền truy cập của người dùng ở đây
		// Ví dụ: Kiểm tra vai trò của người dùng và đường dẫn yêu cầu
		if (user.getRoleName().getRoleName().equals("admin") && !requestURI.startsWith("/checkout")) {
			return true;
		} else if (user.getRoleName().getRoleName().equals("user") && !requestURI.contains("/admin")) {
			return true;
		} else if (requestURI.contains("login") || requestURI.contains("register")) {
			return true;
		}
		return false;
	}
}