package com.connectto.guide;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan//(basePackages = "com.connectto.guide")
@SpringBootApplication
public class GuideMobileApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(GuideMobileApplication.class, args);
	}
}
