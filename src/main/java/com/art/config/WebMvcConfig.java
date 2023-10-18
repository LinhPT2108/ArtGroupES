package com.art.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.art.service.AuthInterceptor;
import com.art.service.GlobalInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	private GlobalInterceptor global;
	@Autowired
	private AuthInterceptor accessInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/**").excludePathPatterns("/assets/**");
		registry.addInterceptor(accessInterceptor)
				.addPathPatterns("/account/**", "/admin/**", "/checkout/**", "/cart/**")
				.excludePathPatterns("/static/**");
		;
	};

}
