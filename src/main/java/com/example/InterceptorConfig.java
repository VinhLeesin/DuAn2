package com.example;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor li = new LocaleChangeInterceptor();
        li.setParamName("lang");
        registry.addInterceptor(li).addPathPatterns("/**");
    }
}
