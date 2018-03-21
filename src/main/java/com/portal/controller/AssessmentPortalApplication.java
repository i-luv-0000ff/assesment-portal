package com.portal.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages={
"com.portal"})
public class AssessmentPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(AssessmentPortalApplication.class, args);
	}
}
