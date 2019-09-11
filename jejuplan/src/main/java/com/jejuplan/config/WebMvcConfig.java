package com.jejuplan.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
 
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	//@Autowired
    //CertificationInterceptor certificationInterceptor;
    
    //@Override
    //public void addInterceptors(InterceptorRegistry registry) {
    //	registry.addInterceptor(certificationInterceptor)
    //            .addPathPatterns("/**/*")
    //	  		.excludePathPatterns("/login/view");
	//}
	
	@Autowired
	@Qualifier(value = "httpInterceptor")
	private HandlerInterceptor interceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
				.addPathPatterns("/**")
				.excludePathPatterns("/login/**");
	}
	
}
